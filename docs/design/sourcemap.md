# Index of source code — ACC → Databricks Connector

## Index format

| Source File | Purpose |
|---|---|

Paths are relative to the repository root.

## How to use this file

- Use this file to determine which source code files to load, based on the "purpose"
  of each source code file.
- Do not load all source code files every time.
- Update this index whenever you add a new source code file.

## Sourcemap Index

### Entry point and configuration

| Source File | Purpose |
|---|---|
| `acc-connector/backend/__init__.py` | Empty package marker for the backend package. |
| `acc-connector/app.py` | Flask application entry point. Registers all blueprints and serves the single-page UI. Drives the three-stage user flow: connect ACC (3-legged OAuth → hub/project selection), connect Databricks (OIDC → pick Unity Catalog → provisioning), then sync (ACC API → UC Volume → Bronze AUTO CDC pipeline). |
| `acc-connector/backend/config.py` | Unified config accessor. Environment variables win (local dev, tests, deploy override), otherwise falls back to the active user's row in the `app_secrets` table. `SECRET_KEY` is deliberately never stored in the DB — it is the root key encrypting stored OAuth tokens. |

### Routes — `acc-connector/backend/routes/`

The app's public HTTP surface. `static/app.js` depends on these shapes.

| Source File | Purpose |
|---|---|
| `acc-connector/backend/routes/__init__.py` | Empty package marker. |
| `acc-connector/backend/routes/acc_routes.py` | ACC/APS blueprint: `/connect/acc`, OAuth `/callback`, `/logout`, `/reset`, `/state`, hub and project listing, ACC debug endpoints. Owns the 3-legged OAuth handshake and hub/project selection. |
| `acc-connector/backend/routes/bootstrap_routes.py` | Workspace provisioning blueprint. Kicks off `bootstrap_service` on a background thread and reports progress. Optionally exposes Zerobus diagnostics behind `ENABLE_ZEROBUS`. |
| `acc-connector/backend/routes/dashboard_routes.py` | `GET /dashboard/data` — aggregates sync run history, record counts and CSV file counts for the dashboard charts. Holds the small display-formatting helpers for run numbering and record-count parsing. |
| `acc-connector/backend/routes/databricks_routes.py` | Databricks blueprint: credential save/status/delete, OIDC connect and callback, Unity Catalog listing, bootstrap status. Largest route module; uses a thread pool for parallel workspace queries. |
| `acc-connector/backend/routes/health_routes.py` | Empty placeholder for a health/readiness endpoint. No routes defined yet. |
| `acc-connector/backend/routes/sync_routes.py` | Sync blueprint: `/sync`, `/sync/snapshot`, `/sync/cdc`, `/sync/auto`, `/sync/status`, `/sync/zerobus-status`. Starts sync runs on background threads and serves the status the UI polls. |
| `acc-connector/backend/routes/portal_routes.py` | The M2M portal's own surface: serves `/portal`, `/api/me` (who is signed in and which hubs they may administer), and hub selection. Does not reimplement OAuth — `/portal/login` and `/portal/databricks-login` set a session flag that `app.index()` already honours, so neither acc_routes nor databricks_routes needed editing. Distinguishes a definitive denial from "could not verify" so an APS outage never reads as "you are not an admin". |
| `acc-connector/backend/routes/onboarding_routes.py` | Hub onboarding API: SSA status, provision, verify (probe 1), per-project robot verification (probes 2/3) and key rotation, all scoped to the session's active hub. Owns the mapping from typed service errors to status codes — capacity exhaustion is 409, not 500, because nothing is broken. |
| `acc-connector/backend/routes/connection_routes.py` | The connection API: create/resume, service-principal credentials, bootstrap, sync, run history, the CDC schedule, and the cron-triggered `/internal/scheduler/cdc`. Enforces two rules the services cannot: long work returns 202 and runs off the request thread, and a service-principal secret is accepted, written straight to the vault and never echoed back. The scheduler tick fails closed when its shared secret is unset. |

### Services — `acc-connector/backend/services/`

| Source File | Purpose |
|---|---|
| `acc-connector/backend/services/__init__.py` | Empty package marker. |
| `acc-connector/backend/services/bootstrap_service.py` | One-time workspace provisioning: a 12-step sequence validating workspace access, SQL Warehouse, metastore and the user-selected Unity Catalog, then creating the bronze schema, the `acc_bronze_volume` volume and the two `_meta_*` registry/status tables. PK rows are not seeded here — the real `schema.json` only arrives with the first sync. |
| `acc-connector/backend/services/pipeline_naming.py` | Resolves the per-catalog name of every provisioned Databricks artifact, so artifacts are catalog-scoped rather than carrying a fixed workspace-global name. Includes the delete-then-recreate `get_or_create_pipeline` helper. |
| `acc-connector/backend/services/sync_service.py` | User-mode sync entry point. Drives the Data Connector AUTO CDC FROM SNAPSHOT and CDC-beta flows; there is no per-entity REST ingest. Zerobus is diagnostics-only. Guarantees no ACC data touches the connector's disk or database. |
| `acc-connector/backend/services/zerobus_service.py` | Zerobus prerequisite diagnostics behind `ENABLE_ZEROBUS`. `check_zerobus_prerequisites(user_id)` runs four independent checks (Databricks token, bootstrap state, catalog reachability, explicit catalog `storage_root`) and returns a structured dict the UI renders as a ready/blocked banner. |
| `acc-connector/backend/services/ops_alert.py` | Tells ISV operators when SSA provisioning capacity is running low or gone — the customer cannot see or fix that themselves. Structured ERROR log plus an optional `OPS_ALERT_WEBHOOK_URL` POST; warns once per app per count so a multi-hub tick does not spam. A failing webhook never breaks provisioning. |

### Shared provisioning — `acc-connector/backend/services/provisioning/`

| Source File | Purpose |
|---|---|
| `acc-connector/backend/services/provisioning/__init__.py` | Package marker. Workspace provisioning shared by both auth paths; knows nothing about users, hubs or the database. |
| `acc-connector/backend/services/provisioning/bootstrap_steps.py` | The 11-step workspace bootstrap, once, for both paths — warehouse, metastore, catalog, bronze schema, volume, `_meta_*` tables, pk_config, notebooks, both pipelines and the sync workflows. Takes a `DatabricksClient` and a `progress` callback; returns the artefact ids for the driver to persist. `create_workflows=True` lets the M2M driver provision workflows regardless of `ENABLE_NOTEBOOK_DOWNLOAD`. |

### Sync pipeline — `acc-connector/backend/services/sync/`

| Source File | Purpose |
|---|---|
| `acc-connector/backend/services/sync/sync_orchestrator.py` | Coordinator for a sync run. Owns `_run_dc_export`, dispatching either a full Standard export into the snapshot AUTO CDC pipeline or the CDC path. The one module in this package allowed to call its siblings. |
| `acc-connector/backend/services/sync/sync_config.py` | Constants and layout rules for sync: watermark keys, the manual-full minimum interval, legacy vs. v2 volume base paths, and the 3-level `schema.json` conventions. |
| `acc-connector/backend/services/sync/download_service.py` | Legacy Phase 2 download path — pulls each Data Connector signed URL through Flask and uploads to the UC Volume. Retained for one release behind `ENABLE_NOTEBOOK_DOWNLOAD=false` while the notebook-based download is validated in production. |
| `acc-connector/backend/services/sync/pipeline_config.py` | Builds Databricks pipeline configuration, including the retry tuning conf (`pipelines.numUpdateRetryAttempts`, `pipelines.maxFlowRetryAttempts`) and the per-project pipeline defaults used by the routes layer. |
| `acc-connector/backend/services/sync/registry_service.py` | Maintains the `_meta_bronze_pk_registry` table — seeding PK rows in batches so pipelines can gate tables on known primary keys. |
| `acc-connector/backend/services/sync/schema_service.py` | Turns ACC schema documents into the SQL the bronze layer needs, including safe inline SQL literal escaping (ACC identifiers are validated alphanumeric + underscore). |
| `acc-connector/backend/services/sync/sync_reconcile_service.py` | Heals sync rows orphaned when a Flask/gunicorn worker restarts mid-run: the Databricks job may succeed while the local row is stuck at `workflow_running` or `bronze_job_running`. Status polls call in here to reconcile local state against the real Databricks run. |
| `acc-connector/backend/services/sync/watermark_service.py` | Computes incremental Data Connector export windows, anchored on the last *successful* sync rather than the last attempt. `pick_successful_sync_timestamp` is the shared helper the repositories defer-import. |
| `acc-connector/backend/services/sync/sync_steps.py` | The Data Connector export → UC Volume → Bronze pipeline sequence, shared by both auth paths. Identity-free: callers pass a `SyncTarget` (what to sync) and `SyncPorts` (the identity-bound callables — token getter, run recorder, watermark resolver). Keeps both download modes and the control-plane PK-registry seed. |

### Repositories — `acc-connector/backend/repositories/`

| Source File | Purpose |
|---|---|
| `acc-connector/backend/repositories/__init__.py` | Package marker; exposes `state_store` as the repository entry point. |
| `acc-connector/backend/repositories/state_store.py` | Facade over the state store. Documents and re-exports the whole persistence surface: `acc_tokens`, `acc_config`, `dbx_credentials`, `dbx_tokens`, `bootstrap_state`, `watermarks`, sync runs. Import this, not the per-concern modules. |
| `acc-connector/backend/repositories/state/database.py` | The persistence layer's dual backend. SQLite when `CONN_STRING` is unset (local dev, zero config), PostgreSQL via `psycopg` when it is set. Owns the shared `_conn()` helper and schema init that every other repository module uses. |
| `acc-connector/backend/repositories/state/encryption.py` | Fernet encryption for secrets at rest. Derives a 32-byte url-safe base64 key from `SECRET_KEY` and exposes `encrypt`/`decrypt`. |
| `acc-connector/backend/repositories/state/token_repository.py` | Stores and retrieves encrypted ACC and Databricks OAuth tokens, including expiry bookkeeping. |
| `acc-connector/backend/repositories/state/secret_repository.py` | Per-user app-registration credentials in the wide `app_secrets` table, keyed by ACC user id. Only `DATABRICKS_CLIENT_SECRET` is Fernet-encrypted; workspace URL and client id are non-secret identifiers stored in plaintext. |
| `acc-connector/backend/repositories/state/config_repository.py` | The user's ACC hub / project / folder selection. |
| `acc-connector/backend/repositories/state/bootstrap_repository.py` | Bootstrap state rows: job ids, notebook paths, compute config. Normalizes `snapshot_pipeline_id`, falling back to the legacy `bronze_pipeline_id` column. |
| `acc-connector/backend/repositories/state/catalog_claim_repository.py` | Tracks who owns a Unity Catalog. One active claim per (workspace, catalog) and per user, made atomic by a partial unique index on `(workspace_key, catalog_name) WHERE released_at IS NULL` so concurrent bootstraps race on INSERT and exactly one wins. |
| `acc-connector/backend/repositories/state/sync_repository.py` | Sync run rows and their lifecycle, including the `SYNC_STALE_SECONDS` staleness cutoff used to detect abandoned runs. |
| `acc-connector/backend/repositories/state/watermark_repository.py` | Per (user, project, data_type) watermark timestamps. |
| `acc-connector/backend/repositories/state/user_repository.py` | User-scoped bulk operations. `_USER_TABLES` lists every table wiped on reset/delete — keep it in sync when adding a user-scoped table. |
| `acc-connector/backend/repositories/state/aps_app_repository.py` | Registry of APS Client-ID shards (`aps_apps`). `list_active` is ordered by `app_ref` because shard selection must deterministically fill app_a before app_b. |
| `acc-connector/backend/repositories/state/tenant_repository.py` | Hub tenants and the hub-admin mapping. `ensure_tenant` is insert-only for `aps_app_ref` and `onboarding_status` — the shard assignment is immutable and a second admin must not reset the first admin's progress. `add_user` accepts only `hub_admin`. |
| `acc-connector/backend/repositories/state/ssa_repository.py` | One robot per hub. Stores a SecretStore ref, never the PEM. Robot counts are derived with `COUNT(*)` rather than a stored counter that could drift. |
| `acc-connector/backend/repositories/state/connection_repository.py` | Connections plus their Databricks SP credential ref and bootstrap state. `list_due_for_cdc` joins the credential table so the scheduler can never pick up a connection that has no service principal. |
| `acc-connector/backend/repositories/state/connection_sync_repository.py` | Per-connection run history and watermarks. Owns `has_in_flight_run` (the FR-05 §10.3 state set) and `last_successful_timestamp`, which anchors the next window on the last success so a failed retry cannot shrink it. |

### Clients — `acc-connector/backend/clients/`

| Source File | Purpose |
|---|---|
| `acc-connector/backend/clients/__init__.py` | Empty package marker. |
| `acc-connector/backend/clients/acc_client.py` | Facade for the APS 3-legged OAuth client: builds the authorization URL, exchanges the code for access + refresh tokens, refreshes silently, and exposes the Data Management and Data Connector calls. Delegates to `clients/acc/`. |
| `acc-connector/backend/clients/databricks_client.py` | Databricks REST client. Thin GET/POST/PUT wrappers plus the Unity Catalog, Jobs, Pipelines, Files and SQL Warehouse operations the connector needs. |
| `acc-connector/backend/clients/acc/__init__.py` | Empty package marker. |
| `acc-connector/backend/clients/acc/constants.py` | APS endpoint bases and tuning constants: auth/DM/profile/Data Connector URLs, service-group lists, job poll intervals and waits, token refresh buffer, retry counts and delays. |
| `acc-connector/backend/clients/acc/http_client.py` | Shared HTTP plumbing for APS calls: `_get`, `_post`, `_get_all_pages`, retry and backoff behavior. |
| `acc-connector/backend/clients/acc/auth_client.py` | ACC token management. Caches 2-legged (`client_credentials`, `data:read`) tokens in memory and refreshes 3-legged user tokens, reading and writing the encrypted token rows it owns. |
| `acc-connector/backend/clients/acc/project_client.py` | Hub, project and folder listing. Merges the 2-legged hub list (hubs where the APS app is provisioned via ACC Admin) with the 3-legged user-visible list, with pagination. |
| `acc-connector/backend/clients/acc/data_connector_client.py` | ACC Data Connector API: create export requests, poll jobs, list result files. Wraps calls with one forced-token-refresh retry on 401. |
| `acc-connector/backend/clients/acc/ssa_client.py` | All Autodesk Secure Service Account HTTP: 2-legged admin token, create robot, create/list/delete RSA keys, and the JWT-bearer assertion exchange that mints a 3LO-equivalent ACC token. Pure client — no DB, no vault. Detects the 10-robot quota error as a typed `SsaQuotaExceeded`, and redacts key material, secrets and JWTs from every logged error body. |
| `acc-connector/backend/clients/acc/admin_client.py` | Answers "is this Autodesk user an account admin of this hub?" via the ACC/BIM 360 HQ Account Admin API. Needs a 2-legged token with `account:read`; a 403 means the Client ID is not whitelisted yet, so it raises `AccountAdminUnavailable` rather than reporting "not an admin" — the two are different product outcomes. |
| `acc-connector/backend/clients/dbx/__init__.py` | Package marker for the M2M-only Databricks clients. |
| `acc-connector/backend/clients/dbx/m2m_auth_client.py` | Mints a Databricks workspace token for a service principal via OAuth `client_credentials` at `/oidc/v1/token`. No refresh-token grant exists on this path — an expired token is re-minted from the SP secret. |

### Utilities and models

| Source File | Purpose |
|---|---|
| `acc-connector/backend/utils/__init__.py` | Empty package marker. |
| `acc-connector/backend/utils/auth.py` | Flask session helpers: `_current_user_id()` returns the session user or `None`, `_require_user_id()` aborts 401 — use it on JSON API routes. |
| `acc-connector/backend/utils/databricks_auth.py` | Cross-cutting Databricks token accessor. `get_valid_dbx_token` refreshes lazily behind a lock and is the only sanctioned way to obtain a workspace token. Sits above clients and repositories by design. |
| `acc-connector/backend/utils/tenant_auth.py` | Portal session and authorisation. `require_active_hub` for onboarding (which runs before a tenant row exists), `require_tenant` where a membership row must exist, `require_hub` for a hub named in a URL, `require_connection` for cross-tenant refusal. Separate from utils/auth.py, which is the U2M path's and stays untouched. |
| `acc-connector/backend/models/__init__.py` | Empty package marker. No models defined; persistence is dict-based through the repositories. |

### Multi-tenant M2M — `acc-connector/backend/services/m2m/`

Hub-scoped, headless path (FR-01…FR-05). Keyed by `hub_id` and `connection_id`, never by a
logged-in user. `connection_runner.py` is the coordinator and may call its siblings.

| Source File | Purpose |
|---|---|
| `acc-connector/backend/services/m2m/__init__.py` | Package marker documenting the hub/connection scoping rule and the sibling-call exception. |
| `acc-connector/backend/services/m2m/hub_admin_service.py` | Enforces the hub-admin-only policy. The role probe returns three outcomes, not two — admin, not_admin, and unverified (the ACC Admin API 403s until the Client ID is whitelisted, so "cannot tell yet" is a real state). `HUB_ADMIN_ENFORCEMENT` picks the policy for unverified; `require_conclusive_admin` is the gate that stops a non-admin burning a service-account slot. |
| `acc-connector/backend/services/m2m/aps_app_service.py` | Resolves which APS app a hub provisions under and guards the service-account ceiling. v1 runs a single Client ID at the APS default of 10 robots for 10 enterprises, so this is a capacity guard first: `precheck_provision` turns "enterprise 11" into a friendly panel instead of a raw APS `cs-16`, and ops is warned at 80%. `get_app_for_hub` always resolves via the immutable `tenants.aps_app_ref`. |
| `acc-connector/backend/services/m2m/ssa_provisioner.py` | Provisions exactly one SSA robot per hub, idempotently. Four layered guards, because a duplicate robot is lost quota rather than untidiness: CS-01 short circuit on an existing row; a cross-worker mutex (`tenants.provisioning_claimed_at`) so two gunicorn workers cannot each call `POST /service-accounts`; double-checked re-read inside the claim; and orphan adoption via `tenants.pending_service_account_id` when APS created the robot but the vault write or insert then failed. Also owns `rotate_key` — new key first, old key deleted last. |
| `acc-connector/backend/services/m2m/ssa_token_service.py` | The only way the M2M path gets an ACC token: minted per hub from that hub's robot key via JWT-bearer, cached in-process with a 120s re-mint buffer. `token_getter(hub_id)` returns the exact `get_token(refresh=False)` shape `data_connector_client._dc_get` already retries with, so the M2M path inherits the 401 recovery without editing any client. No refresh token exists on this path by design. |
| `acc-connector/backend/services/m2m/provisioning_probe.py` | Proves the customer's manual ACC steps, split by scope and credential: `verify_app_authorised` (Client ID in Custom Integrations — 2-legged, no robot, per hub) and `verify_robot_on_project` (robot invited + Data Connector rights — SSA token, **per project**). Supersedes FR-03 §8.2's single hub-level function, which cached a per-project answer per hub and so skipped the check on a customer's second project. |
| `acc-connector/backend/services/m2m/dbx_token_service.py` | The only way the M2M path obtains a Databricks token: resolves the connection's service principal, reads its secret from the SecretStore, mints via `client_credentials`, caches per connection behind a lock. `with_auth_retry` force re-mints and retries exactly once on 401/403 and never on anything else. |
| `acc-connector/backend/services/m2m/connection_identity.py` | Derives `connection_id` — the sha256 of `hub\|project\|workspace\|catalog` from FR-05 §7 — in one place, so routes and services cannot disagree and orphan a connection's state. Normalises the workspace URL so a trailing slash is not a different connection. |
| `acc-connector/backend/services/m2m/connection_service.py` | Makes setup re-entrant: `create_or_resume` is idempotent on the natural key, so re-running the wizard resumes rather than minting a second pipeline. Owns catalog exclusivity (claimed through the existing `catalog_claims` with owner `cnx:<id>`, which gives BR-11 *and* cross-path exclusivity with U2M for no schema change), the status machine that drives wizard resume, and the D-4/D-18 gate on `enable_cdc` — both a service principal and a live robot-on-project probe, refusing with the one action that would fix it. |
| `acc-connector/backend/services/m2m/connection_bootstrap.py` | The M2M bootstrap *driver* over `provisioning/bootstrap_steps.run_all` — it re-implements no provisioning step (D-1/D-2). Owns only what differs per path: which Databricks token (service principal first, the wizard's user token as the D-4 fallback), a `connection_id`-keyed progress sink the wizard polls, the catalog claim re-taken before any Databricks call, and persistence to `connection_bootstrap`. A mid-sequence failure leaves the connection retryable at `pending_bootstrap` with the reason. |
| `acc-connector/backend/services/m2m/connection_runner.py` | The M2M sync driver over `sync/sync_steps.run_export`. Supplies a `SyncPorts` built from the hub SSA token getter (so no `acc_tokens` row is ever read — BR-08), the connection's service principal, and the connection-keyed run/watermark tables, translating the shared run-state vocabulary onto the FR-05 §10.3 states. Also re-verifies the robot when a run fails with a permissions error (D-17), so a robot removed from a project does not stay green. |
| `acc-connector/backend/services/m2m/scheduler.py` | One CDC tick: picks every connection that is ready, CDC-enabled, has a service principal and is due, then runs each independently so one broken connection cannot stop the fleet. Claims `auto_cdc_next_run_at` *before* syncing, which both stops overlapping ticks double-running a connection and stops a permanently failing one becoming a hot retry loop. |

### Secret storage — `acc-connector/backend/secrets/`

A layer below the repositories. The state store persists secret *references* only; a secret
value exists only inside these modules. See `ADR.md` (Phase 1) and FR-05 §2.2, §3, §10.4.

| Source File | Purpose |
|---|---|
| `acc-connector/backend/secrets/__init__.py` | Entry point: `get_secret_store()` builds the backend named by `SECRET_STORE_BACKEND` (local, memory or aws) once per process, and re-exports the ref builders. Backend modules are imported lazily so a deployment without boto3 still runs. |
| `acc-connector/backend/secrets/secret_store.py` | The `SecretStore` Protocol (`get`/`put`/`delete`/`exists`) plus the AWS Secrets Manager path builders from FR-05 §3 — `ssa_private_key_ref`, `dbx_sp_secret_ref`, `aps_app_secret_ref`, `data_encryption_key_ref`. Refs are the SM path minus the leading slash, and that string is what a `*_ref` column stores. |
| `acc-connector/backend/secrets/local_store.py` | Development backend: one Fernet-encrypted file per ref under `SECRET_STORE_DIR`, reusing the `SECRET_KEY`-derived key from `state/encryption.py`. Ref slashes are flattened to `__` for a safe flat filename. |
| `acc-connector/backend/secrets/memory_store.py` | Volatile dict backend for unit tests, so SSA provisioning and token minting can be exercised without disk or AWS. |
| `acc-connector/backend/secrets/aws_store.py` | Production backend on AWS Secrets Manager. `boto3` is imported inside the constructor, so CI and the EC2/SQLite deployment never load it. |

### Databricks notebooks — `acc-connector/notebooks/`

These run inside the customer's Databricks workspace and must not import from `backend/`.

| Source File | Purpose |
|---|---|
| `acc-connector/notebooks/auto_cdc_pipeline.py` | Bronze AUTO CDC FROM SNAPSHOT pipeline over the Standard Data Connector CSV drops at `data_connector/<project>/<run>/*.csv` (`acc.dc_snapshot_path`). SCD Type 2 capable. |
| `acc-connector/notebooks/auto_cdc_cdc_pipeline.py` | Bronze AUTO CDC pipeline for the CDC-beta delta feeds at `data_connector_cdc/<project>/<run>/*.csv` (`acc.dc_cdc_path`). |
| `acc-connector/notebooks/acc_snapshot_pipeline.py` | Pipeline A — the snapshot-only service groups (16 at the time of writing; the notebook's own header comment says 10 and is stale — `notebooks/shared/service_groups_config.py` is the source of truth), via `create_auto_cdc_from_snapshot_flow()` for SCD Type 1 (latest row per PK). Skips every domain that has a CDC mirror; those belong to Pipeline B. Handles both legacy and v2 volume layouts. |
| `acc-connector/notebooks/acc_delta_cdc_pipeline.py` | Pipeline B — the 10 official `cdc*` service groups, one `create_auto_cdc_flow` per table. Legacy layout streams the project CDC root with `recursiveFileLookup` + `pathGlobFilter`; v2 layout uses Auto Loader over stable dated subfolders. Sync is incremental, Full Refresh sets `full_refresh=true`. |
| `acc-connector/notebooks/bulk_downloader.py` | Runs as a plain Databricks Job task inside the customer's workspace. Reads a manifest of (signed_url, target_volume_path) pairs written by the control plane and downloads Data Connector files straight into the UC Volume, then writes a `_SUCCESS` sentinel. DC signed URLs need no Authorization header, so the notebook never sees an ACC token. |
| `acc-connector/notebooks/seed_registry.py` | PK registry and `schema.json` seeder — a plain Spark Job task, not a declarative pipeline, because serverless SDP planning cannot reliably persist a Delta MERGE into `_meta_bronze_pk_registry`. Runs after the bulk downloads and before the snapshot pipeline, and runs the CDC PK audit so bad PKs are caught before `create_auto_cdc_flow`. |
| `acc-connector/notebooks/acc_pipeline_test.py` | Standalone test harness pipeline needing no bootstrap. Driven by `acc.test_mode`, `acc.catalog` and `acc.fixture_base` against hand-prepared CSV fixtures in the volume. |
| `acc-connector/notebooks/shared/acc_pipeline_common.py` | Shared bronze pipeline helpers — schema, PK, registry and bootstrap logic extracted from `auto_cdc_pipeline.py` for reuse across the snapshot and CDC pipelines. Includes `gate_table_common()`. |
| `acc-connector/notebooks/shared/pk_audit_logic.py` | PK audit: pure helpers plus Spark CSV checks, with no DLT dependency, so it works from both `seed_registry` (`%run`) and `acc_pipeline_common`. Status constants must stay in sync with `acc_pipeline_common.py`. |
| `acc-connector/notebooks/shared/schema_api_loader.py` | Parallel APS Schema API fetch for `seed_registry` (`%run`), with configurable parallelism and timeout, and detection of 3-level schema documents. |
| `acc-connector/notebooks/shared/service_groups_config.py` | The canonical split of ACC service groups into snapshot-only vs. CDC, matching the Data Connector `POST /requests` API. |

### Frontend — `acc-connector/static/`, `acc-connector/templates/`

| Source File | Purpose |
|---|---|
| `acc-connector/templates/index.html` | The U2M single page. Jinja template rendering the three-stage wizard and the dashboard. Loads Chart.js from CDN. The multi-tenant M2M portal is a separate page at `/portal`. |
| `acc-connector/static/app.js` | All frontend behavior: connection state machine (`_accConnected`, `_dbxBootstrapped`, …), wizard step navigation, status polling and dashboard charts. Talks to the backend only over the `routes/` HTTP surface. |
| `acc-connector/static/sync_button_state.js` | Pure functions deciding sync button enable/disable/label from polled status: `isRunTerminal`, `isRunActive`, `computeSnapshotBtnState`. Extracted so it can be unit tested under Node. |
| `acc-connector/static/app.css` | Stylesheet for the single page. |
| `acc-connector/templates/portal.html` | The M2M Hub Sync portal page (FR-06). Separate from index.html, which is the untouched U2M wizard. Screens toggle via `hidden`; Tailwind CDN with the FR-06 §2.1 palette; no icon library. |
| `acc-connector/static/portal/app.js` | All portal behaviour — routing, hub picker, dashboard, connections list, connection detail and the 5-step setup wizard — against the real `/api/*`. Single `m2mV2` global, one poller at a time. Renders the robot email and Client ID (the admin must paste them into ACC) and never a key or secret: a typed service-principal secret is POSTed once from a JS variable and never written into the DOM. |
| `acc-connector/static/portal/portal_state.js` | Pure display rules extracted for testing under Node: badge maps, hub and connection wizard resume steps, relative-time buckets, run-state pills (in-flight is never styled as a failure), the bootstrap checklist, the FR-06 §4.11 target-form gate, next-run labels, the 89-day key-age warning, and the Auto CDC gate that names the specific blocker rather than failing generically. |

### Schemas — `acc-connector/schemas/`

| Source File | Purpose |
|---|---|
| `acc-connector/schemas/*.json`, `acc-connector/schemas/*.html` | ~130 generated ACC schema descriptors, one pair per service group and per verb/column detail view (`activities*`, `cdc*`, `issues`, `cost`, `sheets`, …). Reference data captured from the APS Schema API; do not hand-edit. `schema.json` is the aggregate document. |
| `acc-connector/schemas/schema_create_postgres.sql` | Reference DDL for the **ACC data schema** (~9.7k lines of bronze entity tables) on PostgreSQL. Despite the name it contains **none** of the connector's state-store tables and no code reads it. The state store is created only by `init_db()` in `repositories/state/database.py`, which owns the DDL for both SQLite and Postgres — change the schema there, not here. |
| `acc-connector/schemas/schema_create_mssql.sql` | DDL creating the state-store schema on SQL Server. |

### Scripts, config and deployment

| Source File | Purpose |
|---|---|
| `acc-connector/scripts/smoke_check.py` | Offline smoke checks, run from `acc-connector/` as `python scripts/smoke_check.py`. Needs `SECRET_KEY` but no network. This is the gate CI runs. |
| `acc-connector/scripts/migrate_sqlite_to_pg.py` | One-shot SQLite → PostgreSQL migration. Creates the target schema via `init_db()` then copies rows. Driven by `CONN_STRING`. |
| `acc-connector/scripts/ci_deploy.sh` | Deploy script invoked by the GitHub Actions dev and staging jobs over SSH to EC2. |
| `acc-connector/config/job_templates.json` | Databricks job definition templates used during bootstrap. |
| `acc-connector/config/pk_config_template.json` | Primary-key configuration template for the PK registry. |
| `acc-connector/deploy/acc-connector.service` | systemd unit running the app under gunicorn on the EC2 hosts. |
| `acc-connector/deploy/nginx-acc-connector.conf` | nginx reverse-proxy config fronting gunicorn. |
| `acc-connector/start.bat`, `acc-connector/stop.bat` | Windows local dev helpers. `start.bat` requires `.env`, frees port 8000, launches `python app.py` in a new window; `stop.bat` kills the listener and closes the window. |
| `acc-connector/startup.txt` | The gunicorn command line used by the hosting platform. |
| `.github/workflows/acc-connector-ci.yml` | CI/CD: `py_compile` over eight core modules, then `scripts/smoke_check.py`, then optional dev/staging EC2 deploys gated on `vars.ENABLE_DEPLOY`. |

### Tests — `acc-connector/tests/`

| Source File | Purpose |
|---|---|
| `acc-connector/tests/test_acc_auth.py` | Unit tests for ACC U2M token refresh. |
| `acc-connector/tests/test_databricks_auth.py` | Unit tests for Databricks U2M token refresh. |
| `acc-connector/tests/test_sync_reconcile.py` | Tests for reconciling sync runs orphaned against real Databricks runs. |
| `acc-connector/tests/test_schema_init.py` | Runs `init_db()` against a temp SQLite file and asserts every FR-05 §6.1 uniqueness constraint actually fires (one tenant per hub, one robot per hub, no robot shared across hubs, one connection per quadruple), that the U2M tables are untouched, that no table has a column able to hold a secret value, and that the `aps_apps` seed is insert-only. |
| `acc-connector/tests/_dbharness.py` | Shared `TempDbTestCase` — points `database.DB_PATH` at a temp file and runs `init_db()` so repository tests never touch the dev database. Not `test_*.py`, so discovery skips it. |
| `acc-connector/tests/test_tenant_repos.py` | APS shards, tenants, hub-admin mappings and SSA rows. Pins that `ensure_tenant` never reassigns a hub's shard and that only `hub_admin` is storable. |
| `acc-connector/tests/test_connection_repos.py` | Connections, SP credential refs, bootstrap state, run history and watermarks — including that the in-flight guard is per connection, not per hub. |
| `acc-connector/tests/test_ssa_client.py` | Decodes the JWT assertion with the matching public key and asserts every claim and header; pins Basic-auth-only token exchange and typed quota errors. |
| `acc-connector/tests/test_dbx_m2m_token.py` | Service-principal minting, per-connection caching, and that a 401/403 causes exactly one forced re-mint and retry while other errors cause none. |
| `acc-connector/tests/test_hub_admin.py` | The three-way admin probe and each enforcement policy — the tests that stop an APS outage being reported to a real admin as "you are not an admin". |
| `acc-connector/tests/test_aps_capacity.py` | The 10-enterprise ceiling: the tenth hub fits, the eleventh is refused with friendly copy, ops is warned at 8/10, offboarding frees a slot, counts are derived not stored, and a hub always mints under the app it was provisioned with. |
| `acc-connector/tests/test_ssa_provisioner.py` | Counts APS *create calls*, not DB rows — the guarantee is "zero create calls when a robot exists", which a row-count assertion cannot see. Covers the four-admin race (exactly one robot at APS), stale claim recovery, capacity exhaustion leaving no partial tenant, the hub-admin gate blocking a slot, orphan adoption after a mid-provision failure, and key rotation. |
| `acc-connector/tests/test_ssa_token_service.py` | Pins that no human token row is ever read (BR-08), that the app is resolved from the tenant rather than a default, caching and near-expiry re-mint, and that the returned getter really works as `data_connector_client`'s TokenGetter. |
| `acc-connector/tests/test_portal_routes.py` | Drives the portal through Flask's test client: a project admin is refused with no rows left behind, a hub admin cannot reach another hub by editing the URL, "could not verify" never renders as a denial, and no secret appears in a response body. |
| `acc-connector/tests/test_provisioning_probe.py` | Pins the failure mapping, which is the probes' whole value: every refusal names the exact remediation, probe 1 mints no SSA token, an outage is never reported as a denial, and probes 2/3 re-run for a second project on an already-verified hub — the FR-03 §8.2 caching bug the redesign exists to fix. |
| `acc-connector/tests/test_tenant_auth.py` | Exercises the isolation decision itself: an unmapped user cannot act on a hub, membership is re-read every request so removing an admin takes effect at once, another hub's connection reads 404 rather than 403 so ids cannot be enumerated, and a hub switch clears the connection context. |
| `acc-connector/tests/test_onboarding_routes.py` | Status-code and copy contract for onboarding: capacity exhaustion is 409 with the `ssa_limit_reached` status, a permissions refusal 403, an APS outage 502, a probe answering "not done yet" is still 200, and no key material or app secret appears in any body. |
| `acc-connector/tests/test_connection_service.py` | The re-entrancy and exclusivity rules: the same quadruple resumes instead of duplicating and keeps its progress, a catalog held by another connection *or* a U2M user is refused by name with no row left behind, and `enable_cdc` refuses without either half of the D-4/D-18 chain while naming the missing one. |
| `acc-connector/tests/test_connection_bootstrap.py` | Pins that the driver stays a driver: it delegates the whole sequence to the shared steps, always creates the sync workflows, prefers the service principal over the wizard token, and on a mid-sequence failure leaves the connection retryable with no bootstrap row. |
| `acc-connector/tests/test_connection_runner.py` | The headless guarantees: the ACC token comes from the hub SSA and `acc_client.get_valid_token` is asserted never to be called, Databricks auth is the connection's service principal, a scheduled run refuses to borrow a human token, the state vocabulary translation is exhaustive, and a failed retry does not advance the window. |
| `acc-connector/tests/test_scheduler.py` | Tick behaviour under failure: an in-flight connection is skipped and retried next tick, one failure does not abort the pass, a failing connection still has its schedule advanced (no hot retry loop), and a connection without a service principal is never picked up. |
| `acc-connector/tests/test_connection_routes.py` | The API contract through Flask's test client: cross-hub access is 404, long work is 202 with the work off-request, a second start is 409, a service-principal secret round-trips to the vault and never appears in a body, scheduling refuses with an actionable reason, and the scheduler tick fails closed without its token. |
| `acc-connector/tests/portal_state.test.js` | Node test for the portal's pure display rules. Run with `node tests/portal_state.test.js`. |
| `acc-connector/tests/test_bootstrap_steps.py` | Equivalence net for the bootstrap extraction: records every Databricks call and progress message from the pre-refactor and shared paths and asserts the tapes are identical, with the download flag off and on, through the volume retry and on failure. |
| `acc-connector/tests/test_sync_steps.py` | Equivalence net for the sync extraction — same idea across snapshot, CDC, both download modes and two failure points, plus that watermarks never commit on failure. |
| `acc-connector/tests/test_connection_identity.py` | Pins the `connection_id` sha256 derivation from FR-05 §7 against a literal expected digest — if it drifts, every existing connection orphans its pipelines, bootstrap and watermarks. |
| `acc-connector/tests/test_secret_store.py` | Locks in the SecretStore contract: memory and local backends against a shared behaviour mixin, the exact FR-05 §3 ref strings, that the local backend's on-disk bytes never contain the plaintext PEM, and that selecting a non-aws backend never imports boto3. |
| `acc-connector/tests/sync_button_state.test.js` | Node test for `static/sync_button_state.js`. Run with `node tests/sync_button_state.test.js`, not via unittest. |

### Unclassified

| Source File | Purpose |
|---|---|
| `_dump_pipeline_errors.py` | One-shot diagnostic at the repo root: dumps ERROR events for a failed pipeline update, reusing the stored Databricks OAuth token and `DatabricksClient`. Its own docstring says it is safe to delete after use. |
| `_pipeline_events.py` | One-shot diagnostic at the repo root: fetches pipeline event-log entries for a failed run. Its own docstring says it is a local script to delete after use. |

> Both files above are self-declared throwaway diagnostics living outside `acc-connector/`.
> They are listed for completeness only — confirm with the user before relying on them,
> and prefer deleting them over maintaining them.
