# Development Environment Setup

Use this checklist when onboarding a new developer.

## 1. Review the stack

Read the Technology Stack section of `docs/design/ARCHITECTURE.md` first.

## 2. Prerequisites

| Tool | Version | Notes |
|---|---|---|
| Python | 3.11 | Matches `PYTHON_VERSION` in `.github/workflows/acc-connector-ci.yml`. Other 3.x versions are untested. |
| Node.js | any current LTS | Only needed to run `tests/sync_button_state.test.js`. |
| PostgreSQL | 14+ | **Optional.** Skip it — the default backend is SQLite with zero config. |
| Databricks workspace | — | Needed for anything beyond unit tests. Unity Catalog enabled, plus a SQL Warehouse. |
| ACC / APS app | — | Register at https://aps.autodesk.com/myapps/ for `APS_CLIENT_ID` / `APS_CLIENT_SECRET`. |

If something is missing: ask the developer whether it is already installed and where,
before guiding them through installing it.

## 3. Create the virtualenv and install dependencies

Everything runs from `acc-connector/`.

**Windows (PowerShell)**
```powershell
cd acc-connector
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

**Unix / Linux**
```bash
cd acc-connector
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

There is no build step and no `environment.bat` / `environment.sh` — do not create one.

## 4. Configure `.env`

```bash
cp .env.example .env      # from acc-connector/
```

Then, at minimum, set:

- `SECRET_KEY` — generate with
  `python -c "import secrets; print(secrets.token_hex(32))"`.
  This is the root key encrypting stored OAuth tokens. It is never stored in the database.
- `APS_CLIENT_ID`, `APS_CLIENT_SECRET`, `APS_REDIRECT_URI` (default
  `http://localhost:8000/callback`).
- `DATABRICKS_REDIRECT_URI` (default `http://localhost:8000/databricks/callback`).

Databricks OAuth client id, client secret and workspace URL are entered **per user** in
the Connect Databricks panel at runtime and stored in `app_secrets` — you do not need them
in `.env` for local dev. Every other variable in `.env.example` is optional and documented
inline there.

`.env` is never committed. Neither is anything under `acc-connector/secrets/`.

## 5. Verify the setup

Run both, from `acc-connector/` with the virtualenv active:

```bash
python scripts/smoke_check.py                 # offline; needs SECRET_KEY; this is what CI gates on
python -m unittest discover -s tests          # stdlib unittest, no pytest dependency
node tests/sync_button_state.test.js          # the one frontend test
```

If `smoke_check.py` fails, stop and fix that before anything else — it is the same gate CI
runs, so a local failure means CI will fail too.

## 6. Run the app

**Windows**
```powershell
.\start.bat        # frees port 8000, launches python app.py in a new window
.\stop.bat
```

**Unix / Linux**
```bash
python app.py                                          # dev
gunicorn --bind=0.0.0.0 --timeout 600 app:app          # as production runs it
```

Then open http://localhost:8000.

`start.bat` refuses to run without `.env`, which is the usual cause of it exiting
immediately.

## 7. Optional — PostgreSQL instead of SQLite

Set `CONN_STRING` in `.env` to a libpq key=value DSN; the database is created on startup
if it does not exist:

```
CONN_STRING=host=localhost port=5432 dbname=acc_connector user=postgres password=CHANGE_ME connect_timeout=10 sslmode=prefer
```

To carry existing local data over, run `python scripts/migrate_sqlite_to_pg.py`.

Any query you write must work on **both** backends — go through
`backend/repositories/state/database.py`.

## 8. What you cannot run locally

The notebooks under `acc-connector/notebooks/` execute inside a Databricks workspace, not
on your machine. To exercise them you need a real workspace; `notebooks/acc_pipeline_test.py`
is the standalone harness that runs without a full bootstrap, driven by `acc.test_mode`,
`acc.catalog` and `acc.fixture_base`.

## 9. Orientation

Use `docs/design/sourcemap.md` to find your way around. Do not read all 70+ source files.
