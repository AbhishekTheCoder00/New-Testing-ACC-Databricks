# ARCHITECTURE OF THE ACC → DATABRICKS CONNECTOR

## Key Architecture Guidelines

Always follow the decisions in `ADR.md`.

### Two independent tiers

The system is two tiers that never import each other:

1. **Control plane** — the Flask app under `acc-connector/`. Authenticates the user
   against ACC and Databricks, provisions workspace artifacts, requests Data Connector
   extracts, and launches Databricks jobs and pipelines.
2. **Data plane** — the notebooks under `acc-connector/notebooks/`. These execute inside
   the customer's Databricks workspace and read ACC extracts out of a Unity Catalog
   Volume.

**Rule: `notebooks/` must not import anything from `backend/`.** They run on a different
machine with a different interpreter. Parameters cross the boundary as Spark conf keys
(`acc.catalog`, `acc.dc_snapshot_path`, `acc.dc_cdc_path`, `acc.test_mode`, …), never as
Python calls. Code shared between notebooks goes in `notebooks/shared/` and is pulled in
with `%run`.

### Control plane layers

```
frontend (static/, templates/)
    |  HTTP only
routes/        <- blueprints, session handling, request/response shapes
    |
services/      <- business logic, orchestration, long-running work
    |
repositories/  clients/    <- persistence         outbound APIs
    |
config.py                  <- configuration accessor
```

- Modules in a higher layer may depend on lower layers.
- Modules in the **same** layer should not depend on each other. Exception: within
  `services/sync/`, `sync_orchestrator.py` is the coordinator and may call its siblings.
- The frontend talks to the backend only over the HTTP surface exposed by `routes/`.
  It never assumes a database shape.
- `routes/` holds no business logic. It validates the request, resolves the session user,
  delegates to a service, and shapes the response.
- No ACC customer data is ever written to the connector's local disk or database. ACC data
  goes ACC API → UC Volume. Local storage holds only configuration, encrypted tokens, and
  sync run state.

### Known layering exceptions

These are real upward imports in the current code. Do not "fix" them as drive-by cleanup,
and do not add new ones without recording the decision in `ADR.md`.

| Location | Upward import | Why it exists |
|---|---|---|
| `backend/repositories/state/database.py:456` | `backend.services.pipeline_naming` | Function-local import. Schema migration needs the catalog-scoped artifact names. Deferred to break an import cycle. |
| `backend/repositories/state/sync_repository.py:149` | `backend.services.sync.watermark_service` | Function-local import. Picking the last *successful* sync timestamp is watermark logic, not row storage. |
| `backend/clients/acc_client.py`, `backend/clients/acc/auth_client.py` | `backend.repositories.state_store` | Top-level and structural. The ACC OAuth clients read and write the encrypted token rows they refresh. |
| `backend/utils/databricks_auth.py` | `backend.config`, `backend.repositories`, `backend.clients` | `utils/` is not a leaf here. `databricks_auth.py` is a cross-cutting token-refresh helper that legitimately sits above clients and repositories. |

The first two are deferred (function-local) imports whose only purpose is to keep the
module-import graph acyclic. If you touch those call sites, keep the import inside the
function. (A third, in the deleted `m2m_repository.py`, went away with that file.)

### The two auth paths

Two paths reach the same Databricks work with different credentials and different scoping keys:

| | U2M (interactive) | M2M (headless, multi-tenant) |
|---|---|---|
| Entry | `/` — the three-stage wizard | `/portal` — the M2M Hub Sync portal |
| Scoping key | `user_id` | `hub_id` (tenant) + `connection_id` |
| ACC auth | 3-legged OAuth + refresh token | SSA JWT-bearer, one robot per hub |
| Databricks auth | U2M OAuth / PAT | Service principal `client_credentials` |
| State | `acc_config`, `bootstrap_state`, `sync_runs`, `watermarks` | `tenants`, `connections`, `connection_bootstrap`, `connection_sync_runs`, `connection_watermarks` |
| Session | required | ignored — scheduled runs load everything from the DB |

**They share their orchestration, and must keep sharing it.** The Databricks and ACC work —
the bootstrap step sequence, the DC export/download/pipeline sequence — lives once, in
`services/provisioning/bootstrap_steps.py` and `services/sync/sync_steps.py`. Those modules
take no identity: credentials arrive as token getters, progress as a callback, persistence as
ports. Each path contributes only a thin driver. Do not fix a bug in one path's driver that
belongs in the shared steps, and do not reintroduce a second copy of a step sequence.

`USE_SHARED_STEPS` temporarily selects the pre-refactor U2M code path; it and that path are
deleted after the staging soak. Until then a change to one copy must be made to both — they
carry paired cross-reference comments.

### The multi-tenant layer

```
routes/portal_routes.py, onboarding_routes.py, connection_routes.py
    |
services/m2m/            <- ssa_provisioner, ssa_token_service, dbx_token_service,
    |                       whitelist_probe, connection_service, connection_bootstrap,
    |                       connection_runner (coordinator), scheduler, aps_app_service
services/provisioning/   <- shared, identity-free bootstrap steps
    |
repositories/state/      clients/acc/ssa_client.py, clients/dbx/
    |
backend/secrets/         <- SecretStore port: local | memory | aws
```

- `backend/secrets/` is a new layer **below** repositories. The state store persists secret
  *references*; only the SecretStore ever holds a secret value.
- `services/m2m/` has the same sibling-call exception as `services/sync/`:
  `connection_runner.py` is the coordinator and may call its siblings. The package may also
  import the pure helpers `services/pipeline_naming.py` and `services/sync/pipeline_config.py`.
- Every repository read that can be tenant-scoped takes `hub_id` or `connection_id` as a
  **required** argument. There is no unscoped "list all" helper, so a route cannot leak
  another tenant's rows by omission.

### Implementation guidelines

- Long-running work (bootstrap, sync, pipeline polling) runs on a background thread
  started from a route and reports progress through state-store rows that the UI polls.
  Do not block a request on it.
- Databricks and ACC tokens are refreshed lazily behind the accessors in
  `backend/utils/databricks_auth.py` and `backend/clients/acc/auth_client.py`. Call those
  rather than reading token rows directly.
- Secrets at rest are Fernet-encrypted via `backend/repositories/state/encryption.py`,
  keyed off `SECRET_KEY`. `SECRET_KEY` itself is never stored in the database.
- The state store runs on either SQLite (default, zero config) or Postgres (when
  `CONN_STRING` is set). Every query must work on both — go through
  `backend/repositories/state/database.py`.
- Generate or update the package design diagram in `docs/design/packagedesign.md` when
  module dependencies change. Markdown file, mermaid.js diagrams.

## Technology Stack

- **backend** : Python 3.11, Flask 3.0, gunicorn (production), threading for background work
- **frontend** : Jinja templates + vanilla JavaScript, no framework, no build step
- **persistence** : SQLite by default; PostgreSQL via `psycopg` 3 when `CONN_STRING` is set
- **crypto / auth** : `cryptography` (Fernet) for secrets at rest, `PyJWT` for the SSA
  JWT-bearer flow, OAuth (3-legged for users, client_credentials for M2M)
- **external APIs** : Autodesk Platform Services (Data Management, Data Connector,
  Schema API), Databricks REST (Unity Catalog, Jobs, Pipelines, Files, SQL Warehouse)
- **data plane** : Databricks Lakeflow Declarative Pipelines (SDP), AUTO CDC and
  AUTO CDC FROM SNAPSHOT flows, Auto Loader
- **build tool** : none. `pip install -r requirements.txt`
- **unit test framework** : stdlib `unittest`. One frontend test runs under Node.
- **CI** : GitHub Actions, `.github/workflows/acc-connector-ci.yml` — compile check plus
  `scripts/smoke_check.py`, then optional EC2 deploy.

## Technology stack specific instructions

- Match the existing style: module-level `logger = logging.getLogger(__name__)`, type
  hints with `from __future__ import annotations` in newer modules, module docstring at
  the top of every file explaining its purpose.
- New dependencies go in `acc-connector/requirements.txt` with a pin, and only when the
  standard library genuinely cannot cover the need.
- Notebook files start with the `# Databricks notebook source` marker. Keep it.
- Anything added to the CI compile-check list in the workflow must actually be importable
  without Databricks or network access.

## Design Documents

- `docs/design/sourcemap.md` : list of source code files and their purpose. Use this to
  decide which files to modify during planning, code generation, bugfixes and feature
  implementation. Do not read every source file.
- `docs/design/ADR.md` : high-level architecture decisions.
- `acc-connector/docs/pipeline.md`, `acc-connector/docs/pipeline_implementation.md` :
  detailed notes on the sync pipeline as built.
