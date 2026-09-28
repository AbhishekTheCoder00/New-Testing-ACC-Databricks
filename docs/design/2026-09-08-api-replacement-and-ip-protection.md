# API Replacement Map & Business-Logic IP Protection

**Date:** 2026-09-08  
**Status:** proposed — review before implementation  
**Related:** `2026-09-04-move-databricks-work-to-connector-design.md`, `databricks-runtime.md`, `ARCHITECTURE.md`

This document lists **what notebook logic is replaced by control-plane APIs and services**,
and defines **what must never be shipped to or callable from the customer's Databricks
workspace** so core business logic and connector IP stay on our servers only.

---

## 1. Goal

| Objective | How we achieve it |
|---|---|
| Replace duplicated notebook logic | Move tenant-invariant work to `backend/services/` and call it during sync orchestration or via internal APIs |
| Keep business logic private | Sensitive algorithms, ACC integration, schema/PK policy, and orchestration decisions run only in the Flask control plane |
| Notebooks stay thin | Customer workspace receives **execution stubs** (Spark/DLT I/O) plus **opaque artifacts** (JSON plans, conf keys) — not implementation source |

---

## 2. IP protection rules (non-negotiable)

These rules apply to every change in this migration.

### 2.1 What never goes to the customer workspace

The following must **only** exist under `acc-connector/backend/` (control plane). They must
**not** appear in `acc-connector/notebooks/` after migration, and must **not** be returned
in API response bodies in a form that reconstructs the algorithm.

| Category | Examples | Why it is IP / sensitive |
|---|---|---|
| ACC / APS integration | OAuth flows, token refresh, Data Connector export requests, signed-URL minting, Schema API fetch strategy | Connector secret sauce + credentials |
| Schema resolution policy | APS-first vs ZIP fallback, cache/TTL, merge of 40 service groups, two/three-level shape detection | Duplicated today; central policy must not drift per tenant |
| PK registry policy | Which `pk_config.json` rows win, `explicit_pk_config` vs `auto_position_1`, MERGE conditions, hash gating | Operational rules we curate centrally |
| Sync orchestration | Export windows, watermark math, rate limits, workflow DAG, pipeline conf assembly | Multi-tenant orchestration logic |
| Service-group taxonomy source | Canonical list of ACC `serviceGroups` enums | Single source of truth; notebook keeps routing predicates only |
| Portal / tenant auth | Session validation, hub scoping, SSA JWT-bearer, service-principal minting | Security boundary |
| Error remediation text | Detailed operator messages for quota, whitelist, robot-on-project | Product UX we control centrally |

### 2.2 What never crosses the tier boundary (customer data)

Per `ADR.md` and `ARCHITECTURE.md`:

- **No ACC CSV row content** through the control plane (disk, DB, or API payloads).
- **No PK audit row samples** (duplicate key examples with values) in API responses.
- **No signed URLs** logged or stored in the connector DB after the manifest is written to the volume.
- **No ACC tokens** in notebooks when using the notebook download path (`bulk_downloader` uses unsigned URL fetch only by design).

PK audit that reads CSV rows **stays in Databricks** — moving it would expose customer data
to our servers, which is forbidden even though it would “hide” the audit algorithm.

### 2.3 What the data plane may still contain (and why that is OK)

| Allowed in notebooks | Rationale |
|---|---|
| DLT decorators (`dlt.create_auto_cdc_*`) | Must run inside Spark pipeline context; no API substitute |
| Spark reads of volume CSV headers / rows for gating and PK audit | Must touch customer data locally |
| Schema evolution against live Unity Catalog columns | Needs `spark.catalog` in workspace |
| Thin download loop (stream URL → volume file) | Customer bytes never transit control plane |
| Reading `_sync_plan.json`, `schema.json`, `_manifest.json` | Opaque inputs produced by control plane; notebook does not re-derive policy |
| Service-group **routing** predicates (`is_snapshot_only_schema`, etc.) | Small, stable routing table; canonical enum list lives in control plane |

### 2.4 API exposure limits

Internal and portal APIs expose **outcomes and metadata**, not **implementations**:

| API may return | API must not return |
|---|---|
| `{schema, table, last_run_status, last_error_message}` | Full PK audit Spark queries or pandas-style logic |
| `{plan_version, tables: [{action: "skip", skip_reason: "..."}]}` | Python source of `gate_table_common` |
| `{schema_path, config_hash}` | Raw APS Schema API responses for all 40 groups (large + re-playable) |
| `{ok: true, run_id}` heartbeat | Connector `SECRET_KEY`, APS client secrets, SSA PEM refs |

All `/internal/dataplane/v1/*` routes require a **short-lived run JWT** minted at workflow
start. They are not public and not documented to customers.

---

## 3. Replacement map: notebook code → control plane

Legend:

- **Replace (Phase A)** — control plane runs during `sync_steps.run_export()` before the Job starts; notebook code **deleted**
- **Replace (API)** — optional runtime call from Job task; notebook gets thin HTTP client
- **Stay** — remains in notebook (Spark/DLT/customer data)
- **Delete** — remove dead code only

### 3.1 Files removed from customer workspace entirely

| Notebook file | Lines | Replaced by | Exposure after migration |
|---|---:|---|---|
| `notebooks/shared/schema_api_loader.py` | 111 | `backend/services/dataplane/schema_publish_service.py` | **Not shipped** — deleted from workspace upload |
| `notebooks/auto_cdc_pipeline.py` | 1,237 | `acc_snapshot_pipeline.py` (already production) | **Not shipped** — deleted |
| `notebooks/auto_cdc_cdc_pipeline.py` | 1,196 | `acc_delta_cdc_pipeline.py` (already production) | **Not shipped** — deleted |

### 3.2 `seed_registry.py` — replacements

| Notebook function / block | ~Lines | Control-plane replacement | API / artifact | Notebook after |
|---|---:|---|---|---|
| `_load_schema_doc_from_api()` | 15 | `schema_publish_service.fetch_merged_schema()` | Phase A: writes `schema.json` to volume | **Removed** |
| `_ensure_schema_json()` | 60 | `schema_publish_service.ensure_schema_on_volume()` | Phase A artifact on volume | **Removed** |
| `_load_schema_from_zip()` | 65 | `schema_service._load_schema_doc_from_zip()` (existing) | Phase A | **Removed** |
| `_write_schema_to_volume()` | 30 | `schema_publish_service` + `dbx.put_file()` | Phase A | **Removed** |
| `_seed_pk_registry()` | 90 | `registry_seed_service.seed_from_pk_config()` | Phase A via SQL warehouse | **Removed** |
| `_is_three_level_schema_doc()` / `_is_two_level_schema_doc()` | 25 | `schema_service` (existing) | Phase A | **Removed** |
| `DC_ALL_SERVICE_GROUPS` (40 strings) | 10 | `backend/clients/acc/constants.py` | Phase A conf key | **Removed** |
| `_run_cdc_pk_audit()` | 55 | — | — | **Stay** (reads customer CSV rows) |
| `_discover_cdc_csv_paths()` | 60 | `sync_plan_service` (paths only, no row data) | Phase A `_sync_plan.json` | **Shrink** — read plan or minimal list |

**Net:** `seed_registry.py` drops from ~560 lines to ~120 (PK audit + status MERGE only).

### 3.3 `shared/acc_pipeline_common.py` — replacements

| Notebook function / block | ~Lines | Control-plane replacement | Notebook after |
|---|---:|---|---|
| `_seed_pk_registry_from_config()` | 140 | `registry_seed_service.seed_from_pk_config()` | **Removed** |
| `_bootstrap_schema_json()` | 60 | Connector-published `schema.json` on volume | **Removed** |
| `_load_schema_doc_from_zip_bytes()` | 35 | `schema_service._load_schema_doc_from_zip()` | **Removed** |
| `_merge_per_domain_schemas()` | 20 | `schema_publish_service.merge_per_domain()` | **Removed** |
| `_apply_table_documentation()` | 45 | `bootstrap_steps.create_meta_tables()` COMMENT DDL | **Removed** |
| `_delta_upsert_config_version()` (pk/schema hash) | 30 | `registry_seed_service.record_config_hash()` | **Removed** |
| `prepare_shared_bootstrap()` | 70 | Calls above moved out; reads volume artifacts | **Stay** — slim orchestration |
| `gate_table_common()` | 90 | `sync_plan_service.gate_table()` pre-computes plan | **Stay** — applies plan + local header read |
| `_build_evolved_schema()` | 55 | — | **Stay** (live catalog) |
| `read_csv_df()`, DLT helpers | 200+ | — | **Stay** |

**Net:** ~440 lines removed from shipped notebook; core gating/evolution execution stays.

### 3.4 `bulk_downloader.py` — mostly stays (by design)

| Notebook function | Replace? | Reason |
|---|---|---|
| Manifest read + parallel download | **Stay** | ACC bytes must not pass through control plane |
| Retry/backoff policy | **Config only** | Constants passed via `acc.download_*` conf keys from control plane — not algorithm source in notebook |
| `_SUCCESS` sentinel + failure cleanup | **Stay** | Volume-side I/O |

Control plane already owns manifest **creation** in `download_service._phase2_via_notebook()`.
The notebook remains a dumb executor of `(signed_url → volume path)` pairs.

### 3.5 Pipeline notebooks (`acc_snapshot_pipeline.py`, `acc_delta_cdc_pipeline.py`)

| Logic | Replace? | Control-plane role |
|---|---|---|
| `dlt.create_auto_cdc_from_snapshot_flow()` | **Stay** | CP passes `acc.dc_snapshot_path`, `acc.sync_plan_path` |
| `dlt.create_auto_cdc_flow()` + streaming | **Stay** | CP passes CDC paths + plan |
| `_register_*_table()` orchestration | **Stay** | Plan artifact lists which tables to register/skip |
| `audit_table_pk()` in Pipeline B | **Stay** | Row-level audit cannot move without customer data export |

### 3.6 New control-plane modules (where replaced logic lives)

| New / extended module | Absorbs notebook logic |
|---|---|
| `backend/services/dataplane/schema_publish_service.py` | APS Schema API parallel fetch, ZIP fallback, volume publish, hash row |
| `backend/services/dataplane/registry_seed_service.py` | PK registry MERGE from `pk_config.json` (unify with `registry_service`) |
| `backend/services/dataplane/sync_plan_service.py` | Per-run `_sync_plan.json` — table list, skip reasons, paths (no row data) |
| `backend/services/dataplane/table_status_service.py` | Read `_meta_bronze_table_status` for portal |
| `backend/routes/dataplane_routes.py` | Optional internal heartbeat (metadata only) |
| `backend/services/sync/schema_service.py` | **Existing** — ZIP parser (single copy after migration) |
| `backend/services/sync/registry_service.py` | **Existing** — SQL MERGE (single copy after migration) |
| `backend/services/sync/download_service.py` | **Existing** — manifest builder |
| `backend/services/provisioning/bootstrap_steps.py` | **Extended** — UC table comments (one-time) |

---

## 4. API and artifact surface (what replaces direct notebook logic)

### 4.1 Phase A — orchestration-time (primary; no notebook HTTP)

These run inside `sync_steps.run_export()` **before** the Databricks Job is triggered.
Notebooks only read the results from the volume or Spark conf.

| Step | Control-plane function | Output to data plane | Replaces notebook |
|---|---|---|---|
| 1 | `download_service._phase2_via_notebook()` | `_manifest.json` on volume | Manifest policy (already CP) |
| 2 | `schema_publish_service.ensure_schema_on_volume()` | `{volume}/schema.json` + hash in `_meta_bronze_schema_versions` | `seed_registry` schema blocks + `acc_pipeline_common._bootstrap_schema_json` |
| 3 | `registry_seed_service.seed_from_pk_config()` | Rows in `_meta_bronze_pk_registry` via SQL WH | `seed_registry._seed_pk_registry`, `acc_pipeline_common._seed_pk_registry_from_config` |
| 4 | `sync_plan_service.publish_sync_plan()` | `{volume}/_sync_plan.json` | Pre-computed gating/skip decisions |
| 5 | `bootstrap_steps.create_meta_tables()` (extended) | UC COMMENT metadata | `_apply_table_documentation()` |

Spark conf keys passed to pipelines (extended, backward compatible):

| Key | Set by | Notebook uses |
|---|---|---|
| `acc.catalog` | sync_steps | unchanged |
| `acc.dc_snapshot_path` / `acc.dc_cdc_path` | sync_steps | unchanged |
| `acc.sync_plan_path` | sync_steps | **new** — optional plan file |
| `acc.service_groups_snapshot` / `acc.service_groups_cdc` | sync_steps from `constants.py` | **new** — JSON allowlists |

### 4.2 Phase B — internal APIs (optional; metadata only)

| Endpoint | Replaces | Request body | Response body | Customer data? |
|---|---|---|---|---|
| `POST /internal/dataplane/v1/runs/{id}/heartbeat` | Ad-hoc notebook logging only | `{task, state, message, metrics}` | `{ok, run_id}` | **No** |
| `GET /api/connections/{id}/tables` | Manual Databricks SQL for status | — | Table status rows | **No** — status metadata only |

**Not exposed as APIs (stay in notebooks):**

- DLT table registration
- PK row-level audit
- CSV streaming reads
- Schema evolution against live bronze tables

---

## 5. Before / after: what the customer can see

| Asset | Before migration | After migration |
|---|---|---|
| Notebook source uploaded to workspace | ~5,900 lines incl. schema API, registry MERGE, legacy pipelines | ~3,000 lines — Spark/DLT I/O + thin orchestration |
| Outbound APS Schema API calls from workspace | 40 per sync | **0** |
| Implementations of schema ZIP parser | 2 (notebook + backend) | **1** (backend only) |
| Implementations of PK registry MERGE | 2 | **1** (backend only) |
| Copies of ACC service-group enum list | 3 | **1** canonical + conf passthrough |
| Connector OAuth / DC export logic in workspace | Never (already CP) | Never |
| `_sync_plan.json` in volume | N/A | Opaque plan — **no Python source** |

A customer admin with workspace access can still read **remaining** notebook source (DLT
registration, PK audit). They **cannot** read control-plane Python modules unless they
have access to our EC2 deployment or git repo.

---

## 6. Verification checklist (business logic not exposed)

Use this checklist during code review for every PR in this migration:

- [ ] No new `import` from `backend/` in any file under `notebooks/`
- [ ] No APS Schema API URL or parallel fetch logic in notebooks after Phase 3
- [ ] No `pk_config.json` MERGE SQL or Delta MERGE for registry in notebooks after Phase 4
- [ ] No duplicate `_load_schema_doc_from_zip` in notebooks — only `schema_service.py`
- [ ] `bootstrap_steps.upload_notebooks()` no longer uploads deleted files
- [ ] API responses contain no CSV rows, no signed URLs, no tokens, no schema API raw dumps
- [ ] Logs redact signed URLs, JWTs, and APS error bodies (existing SSA client pattern)
- [ ] `_sync_plan.json` lists decisions, not algorithm code
- [ ] Unit tests assert sync_steps runs schema publish + registry seed **before** workflow trigger
- [ ] `scripts/smoke_check.py` notebook list matches uploaded set

---

## 7. Implementation sequence (replacement order)

| Order | Change | Lines removed from workspace | IP win |
|---|---|---:|---|
| 1 | Delete legacy `auto_cdc_*` notebooks | ~2,433 | Removes dead monolithic pipeline IP |
| 2 | Move UC comments to bootstrap | ~45 | Removes repeated DDL logic |
| 3 | Connector publishes `schema.json` (delete `schema_api_loader.py`) | ~330 | Removes APS fetch + parsers from workspace |
| 4 | Connector seeds PK registry (shrink `seed_registry`) | ~200 | Removes MERGE policy from workspace |
| 5 | Single service-group taxonomy via conf | ~10 | Removes hardcoded 40-group list |
| 6 | Publish `_sync_plan.json` | ~0 net (moves gating policy) | Decisions pre-computed in CP |
| 7 | Portal table status API | 0 notebook | No change to workspace; UI reads CP |

---

## 8. Explicit non-replacements (do not API-ify)

Attempting to replace these with control-plane APIs would either **break ADR** or **fail
technically**:

| Notebook responsibility | Why it is not replaced |
|---|---|
| `bulk_downloader` byte streaming | Would route customer data through control plane |
| `audit_pk_csv()` row scans | Would export customer data to control plane |
| `dlt.create_auto_cdc_*` | DLT requires in-pipeline Python decorators |
| `_build_evolved_schema()` | Requires live Unity Catalog column types in Spark |
| ACC OAuth / DC job creation | Already control plane only — no change |

---

## 9. Approval

Review this document and confirm:

1. Phase A (artifact-based replacement) is acceptable for v1.
2. Phase B internal heartbeat API is optional.
3. Remaining notebook code (~3k lines) is an acceptable minimum for Spark/DLT execution.

After approval, implementation follows `2026-09-04-move-databricks-work-to-connector-design.md`
sequencing with the additions in §7 above.
