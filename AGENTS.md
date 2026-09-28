
# ACC → Databricks Connector Agent Guide

## Objective
Maintain and extend the ACC → Databricks connector: a Flask web app that authenticates a
user against Autodesk Construction Cloud, provisions a Databricks workspace (Unity
Catalog schema, volume, jobs, pipelines), and syncs ACC Data Connector extracts into a
Bronze layer via AUTO CDC pipelines.

## Working Rules
Read the `.agents/workingrules.md` and strictly follow the rules.

## Project Folder Map
In case a folder does not exist, create the necessary folder as needed.

### Agent configuration
- `.agents/` : Coding agent configuration files, including the SKILL files.
- `.agents/workingrules.md` : the rules you must follow. Read first.
- `.agents/memory/` : your memories.
- `.agents/prompts/` : reusable prompts.
- `.agents/skills/` : SKILL files. Not tracked in git.

### Documentation
- `docs/` : project documentation.
- `docs/devenv.md` : instructions to set up the development environment for a new developer.
- `docs/implementation_plan.md` : phase wise implementation plan of this project.
- `docs/specifications/` : requirements and specification documents.
- `docs/specifications/specindex.md` : index of specification documents.
- `docs/design/` : architecture documents and design decision documents.
- `docs/design/ARCHITECTURE.md` : architecture rules and constraints.
- `docs/design/ADR.md` : architecture decision records.
- `docs/design/sourcemap.md` : index of every source file and its purpose.
- `acc-connector/docs/` : pre-existing implementation notes on the sync pipeline. Indexed
  from `docs/design/ADR.md`. Not yet consolidated into `docs/`.

### Application source
All application code lives under `acc-connector/`. Every command, relative path and CI
step assumes `acc-connector/` as the working directory.

- `acc-connector/app.py` : Flask entry point. Registers blueprints, serves the UI.
- `acc-connector/backend/config.py` : unified config accessor (env first, then DB).
- `acc-connector/backend/routes/` : HTTP route blueprints. The app's public API surface.
- `acc-connector/backend/services/` : business logic.
- `acc-connector/backend/services/sync/` : the sync pipeline orchestration.
- `acc-connector/backend/repositories/` : persistence.
- `acc-connector/backend/repositories/state/` : per-concern repository modules over one
  shared SQLite/Postgres connection.
- `acc-connector/backend/clients/` : outbound API clients.
- `acc-connector/backend/clients/acc/` : Autodesk Platform Services (APS) client split by concern.
- `acc-connector/backend/utils/` : cross-cutting helpers (session auth, Databricks token refresh).
- `acc-connector/notebooks/` : Databricks pipeline notebooks. These run inside the
  customer's Databricks workspace, never locally.
- `acc-connector/notebooks/shared/` : helpers shared between notebooks via `%run`.
- `acc-connector/schemas/` : generated ACC schema descriptors plus state-store DDL.
- `acc-connector/static/`, `acc-connector/templates/` : frontend (vanilla JS, Jinja).
- `acc-connector/tests/` : unit tests (stdlib `unittest`, plus one Node test).
- `acc-connector/scripts/` : operational scripts (smoke check, migration, CI deploy).
- `acc-connector/config/` : Databricks job and PK config templates.
- `acc-connector/deploy/` : systemd unit and nginx config for the EC2 deployment.
- `acc-connector/secrets/` : local credentials. Never read, write or commit these.

## Required Reading Before making any Changes
- Read coding agent configuration files from `.agents`.
- Read SKILL files as needed from `.agents/skills`.
- Read your memories from `.agents/memory` folder.
- Read `docs/implementation_plan.md` to understand the planned roadmap and timeline.
- Read `docs/specifications/specindex.md`, then all relevant specification files as needed.
- Follow `docs/design/ARCHITECTURE.md`.
- Follow decisions in `docs/design/ADR.md`.
- Use `docs/design/sourcemap.md` to decide which source files to load. Do not read all
  70+ source files.
