# Implementation Plan

This document describes the phase wise implementation plan for the ACC → Databricks
connector.

## Phase Implementation sequence

- Do not start the next phase until the previous phase is fully implemented and the user
  explicitly asks for implementation of the next phase.
- Follow `docs/design/ARCHITECTURE.md` and `docs/design/ADR.md` in all phases.
- Strictly follow the implementation sequence below.

## Implementation Phases

### Phase 0 — Existing baseline (shipped)

This project was not built phase-by-phase under this plan; Phase 0 records what already
works, so later phases are diffs against it rather than rewrites.

Shipped capability:

1. ACC 3-legged OAuth sign-in, hub/project/folder selection, session reset.
2. Databricks connect via OIDC or PAT, Unity Catalog listing and atomic catalog claim.
3. Workspace bootstrap: SQL Warehouse and metastore validation, bronze schema,
   `acc_bronze_volume`, the two `_meta_*` registry/status tables.
4. Snapshot sync — Data Connector Standard export → UC Volume → AUTO CDC FROM SNAPSHOT
   pipeline (Pipeline A, snapshot-only service groups).
5. CDC sync — Data Connector CDC-beta export → AUTO CDC pipeline (Pipeline B, the `cdc*`
   service groups).
6. In-workspace signed-URL download (`notebooks/bulk_downloader.py`) and PK registry
   seeding with CDC PK audit (`notebooks/seed_registry.py`).
7. Run state, watermarks anchored on last successful sync, and reconciliation of runs
   orphaned by worker restarts.
8. Dashboard with run history and record counts; sync button state derived from polled status.
9. Headless M2M path (SSA JWT-bearer for ACC, service principal for Databricks).
10. SQLite default with PostgreSQL support, Fernet-encrypted secrets at rest.
11. CI compile check plus offline smoke check; systemd + nginx deployment to EC2.

Known incomplete at Phase 0:
- `backend/routes/health_routes.py` is empty — no health/readiness endpoint.
- `docs/specifications/` now holds FR-01–FR-07, but they are not yet an approved
  baseline: FR-02 is still "Draft for review" with an unsigned approval table.
- `docs/design/packagedesign.md` does not exist.
- `services/sync/download_service.py` is legacy, awaiting removal after the notebook
  download path is validated.
- `_dump_pipeline_errors.py` and `_pipeline_events.py` are throwaway diagnostics still
  sitting at the repo root.

### Phase 1 — 

 Ref this "C:\Users\naroder\OneDrive - Autodesk\Desktop\Data-Bricks\ACC - Forma Spec driven\FormaDatabricksIntegration\docs\specifications\specindex.md"

### Phase 2 — {{not planned yet}}

{{Define scope here.}}

### Phase 3 — {{not planned yet}}

{{Define scope here.}}
