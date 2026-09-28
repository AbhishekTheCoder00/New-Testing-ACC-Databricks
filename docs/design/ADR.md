# Architecture Decision Record (ADR) Index

This is an index of key architecture decision records. The index format has two types:

1. `<relative document path>` : {{short 2-3 lines description of the document content}}
2. {{decision description for short decisions}}

## How to use this file

- Remember ADRs are high level design decisions that impact multiple packages or source
  files.
- Do not document low level design decisions like class design or method design here.
- Add a decision here before implementing anything that contradicts
  `ARCHITECTURE.md`, and update `ARCHITECTURE.md` in the same change.

## ADR Index

Decisions below were read off the existing code and its inline documentation. They are
recorded here so agents stop re-deciding them. **Nothing here has been ratified by the
project owner yet** — review and correct before treating any line as binding.

- `acc-connector/notebooks/` must not import from `acc-connector/backend/`. The two tiers
  run on different machines; parameters cross the boundary as `acc.*` Spark conf keys.
- No ACC customer data is written to the connector's local disk or database. ACC data goes
  ACC API → Unity Catalog Volume. Local storage holds config, encrypted tokens and run
  state only.
- `SECRET_KEY` is never stored in the database. It is the root key that encrypts stored
  OAuth tokens, so it must live outside the thing it protects.
- ~~The M2M / headless path is a parallel implementation, not a shared one. `m2m_service.py`
  and `m2m_repository.py` re-implement bootstrap and sync and touch only `m2m_*` tables,
  so changes to the user-mode path cannot regress it. Accepted cost: duplicated logic.~~
  **SUPERSEDED (Phase 1, 2026-09-01).** Duplicated orchestration drifts — a fix lands in one
  copy and not the other. Bootstrap and sync now have **one** implementation, parameterised:
  token-agnostic step libraries in `services/provisioning/bootstrap_steps.py` and
  `services/sync/sync_steps.py`, driven by a thin per-path driver that supplies only what
  genuinely differs (which token getter, which progress sink, which repository). The POC
  modules `m2m_service.py`, `m2m_routes.py` and `m2m_repository.py` were deleted.
- Ingestion uses Data Connector exports plus AUTO CDC / AUTO CDC FROM SNAPSHOT flows.
  There is no per-entity REST ingest. Zerobus is diagnostics-only, behind `ENABLE_ZEROBUS`.
- PK registry seeding happens in a plain Spark Job task (`notebooks/seed_registry.py`),
  not inside a declarative pipeline, because serverless SDP planning cannot reliably
  persist a Delta MERGE into `_meta_bronze_pk_registry`.
- Signed-URL downloads run inside the customer's workspace
  (`notebooks/bulk_downloader.py`) so the notebook never handles an ACC token and the
  control plane keeps the long-lived secret. The Flask-proxied path in
  `services/sync/download_service.py` is legacy, retained one release behind
  `ENABLE_NOTEBOOK_DOWNLOAD=false`.
- Databricks artifact names are catalog-scoped, resolved through
  `services/pipeline_naming.py`, rather than fixed workspace-global names.
- Unity Catalog ownership is claimed atomically via a partial unique index on
  `(workspace_key, catalog_name) WHERE released_at IS NULL`, so concurrent bootstraps race
  on INSERT and exactly one wins.
- The state store supports SQLite (default, zero config) and PostgreSQL (when
  `CONN_STRING` is set). Every query must work on both, via
  `repositories/state/database.py`.
- Four upward imports violate strict layering and are accepted, not bugs. They are
  tabulated in `ARCHITECTURE.md` under "Known layering exceptions". Two are
  function-local imports whose only job is keeping the module-import graph acyclic; keep
  them inside their functions. (A fifth went away with `m2m_repository.py`.)

### Phase 1 — multi-tenant M2M (added 2026-09-01)

Source of truth: `docs/specifications/specindex.md` (FR-01…FR-07). These decisions were
taken while planning Phase 1 and reviewed with the project owner.

- **`hub_id` is the tenant boundary**, not `acc_account_id` and not `aps_user_id`. One SSA
  robot per hub; `acc_account_id` is used only for Data Connector URL paths and optional org
  grouping. Idempotency key for provisioning is `hub_id`. (FR-01, FR-02 BR-01/BR-02)
- **v1 targets 10 enterprises, so there is exactly one APS Client ID.** Ten hubs is precisely
  the APS default of 10 service accounts per Client ID, so FR-04's multi-shard *selection*
  (hub 11 → app_b, TC-03/TC-05/TC-10) is **out of scope**. What stays in scope is the capacity
  *ceiling*: pre-check before provisioning, ops alert at 80% (8/10), and a friendly
  `SsaCapacityExhausted` at 10/10 driving FR-06 §4.8's `cs-16` quota-blocked panel — enterprise
  11 must be told "capacity reached, support notified", never a raw APS error.
  The `aps_apps` registry table and the immutable `tenants.aps_app_ref` are kept anyway: they
  are already built, they are where the Client ID and its secret ref have to live regardless,
  and they mean growing past ten is an INSERT plus a vault secret rather than a migration.
  Because there is one Client ID, customer documentation names one Client ID to whitelist, and
  the "which shard did they whitelist?" problem does not arise.
- **`tenants.aps_app_ref` is immutable after insert.** The APS Client-ID shard a hub is
  assigned at first `ensure_ssa` is the shard it mints tokens on forever; reassignment would
  strand the robot. Robot counts are **derived** from `COUNT(ssa_credentials)`, never stored
  in a counter column that can drift. (FR-04 §4.2, §5.2)
- **Secrets live behind a `SecretStore` port in `backend/secrets/`**, a new layer below
  repositories. Backends: `local` (Fernet files, reusing `state/encryption.py`), `memory`
  (tests), `aws` (Secrets Manager). The state store persists `*_ref` paths only — never a
  PEM, an APS client secret or a Databricks SP secret.
- **The new production tables are named `connection_sync_runs` and `connection_watermarks`**,
  not the `sync_runs` / `watermarks` that `FR-05` §5.8–5.9 specify. Those two names are
  already taken by load-bearing user-scoped U2M tables, and SQLite has no schemas to separate
  them into.
- **One catalog, one connection — enforced by reusing `catalog_claims`.** The M2M path claims
  with `owner_user_id = f'cnx:{connection_id}'`, so the existing partial unique index on
  `(workspace_key, catalog_name) WHERE released_at IS NULL` also prevents a U2M bootstrap and
  an M2M connection provisioning the same catalog. No second exclusivity index. (FR-02 BR-11)
- **`services/m2m/` gets the same sibling-call exception as `services/sync/`**:
  `connection_runner.py` is the coordinator and may call its siblings, and the package may
  import the pure helpers `services/pipeline_naming.py` and `services/sync/pipeline_config.py`.
- **A Databricks service principal is required for *scheduled* sync only.** Databricks U2M
  OAuth may complete the wizard and drive manual sync, but `connections.cdc_enabled` cannot be
  set without `connection_dbx_credentials`. This reconciles FR-02 FR-26/BR-08 (SP mandatory)
  with FR-06 §4.8 (SP optional) without ever letting a human refresh token run a scheduled job.
- **Scheduling uses `connections.auto_cdc_next_run_at`, not a cron expression.** FR-03 §11.4's
  tick evaluates no cron, so a stored cron string would be decorative and parsing one would
  add a dependency. Mirrors the existing `acc_config.auto_cdc_next_run_at` on the U2M path.
- **`USE_SHARED_STEPS` is a temporary kill switch with a mandatory expiry.** It defaults to
  false (pre-refactor U2M code path) so the shared-step extraction can be rolled back. It is
  deleted, along with the pre-refactor path, once one snapshot sync and one CDC cycle pass on
  staging with both download modes exercised. While it exists, both copies carry paired
  cross-reference comments — a fix to one must be made to the other.
- **Hub-admin verification is a probe with three outcomes, not a boolean.** The ACC HQ
  Account Admin API is the only surface exposing the role. It needs a **2-legged** token with
  `account:read`, and it returns 403 until the hub admin has whitelisted our Client ID in
  Custom Integrations — so 403 means "cannot tell yet", not "not an admin". The probe returns
  `admin` / `not_admin` / `unverified` and the caller applies policy.
  Default policy is **strict**: `unverified` is denied, but with its own reason so the UI says
  "finish the Custom Integration step" rather than "you are not an admin". This is safe
  because the product documentation makes whitelisting a prerequisite completed *before* first
  sign-in, so the probe is answerable by the time a user reaches the connector.
  `provisional` remains available for deployments where that onboarding order cannot be relied
  on. `require_conclusive_admin` gates robot provisioning either way, so a user we have not
  positively confirmed can never consume one of the ten service-account slots. (FR-02 FR-01a)
- **The whitelist probe does not need a robot.** FR-03 §8.2 runs all three provisioning probes
  with an SSA token, which would require the robot to exist first — but FR-06 §4.8 puts
  Whitelist at wizard step 1 and Service Account at step 2. Probe 1 (Custom Integration) gets
  the same 403 signal from a 2-legged app token, so it runs at step 1 with no robot; probes 2
  and 3 (robot on project, Data Connector authorisation) need the SSA token and run at step 3,
  per new connection, before bootstrap. Both specs are satisfied.

### Referenced documents

- `acc-connector/docs/pipeline.md` : the sync pipeline design as built — volume layouts,
  service groups, and the snapshot vs. CDC split.
- `acc-connector/docs/pipeline_implementation.md` : implementation notes for the pipeline
  notebooks and the bootstrap sequence.
- `acc-connector/docs/FIXES_AND_CHANGES.md` : running log of fixes and behavior changes.
- `./packagedesign.md` : *(not written yet)* package/module design and dependencies in
  mermaid.js format. Create it when module dependencies next change.
