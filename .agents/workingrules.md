# Coding Agent Working Rules
Strictly follow these rules. DO NOT VIOLATE UNDER ANY CIRCUMSTANCES.

# Working Rules
- Make small, focused changes.
- Preserve behavior unless the task explicitly requires a change.
- **Do not change public APIs** unless instructed. In this project the public API surface
  is the HTTP route contract in `acc-connector/backend/routes/` (the frontend in
  `acc-connector/static/app.js` depends on it) and the notebook pipeline parameters
  (`acc.*` Spark conf keys) consumed by `acc-connector/notebooks/`.
- Follow existing project patterns before introducing new ones.
- Generate the "plan" BEFORE making any changes, updating any documents or generating any code/tests.
- Show the plan to me (the user) and get my confirmation.
- Write the unit tests before making any changes. Tests use the stdlib `unittest` module
  (there is no pytest dependency) and live in `acc-connector/tests/`.
- Run the unit tests and ensure that all tests are passing after making any changes.
- Modify files in `docs/` folder only when explicitly told by user. Do not modify on your own. Exceptions are `sourcemap.md` and `packagedesign.md`
- Store your memories in `.agents/memory/` folder.

### DO NOT
- implement anything that conflicts with approved specs or architecture decisions.
- Rewrite large parts of the codebase unless explicitly asked.
- Reformat unrelated files.
- Remove TODOs/comments without addressing their intent.
- Assume undocumented behavior is safe to change.
- Generate or modify files that I did not explicitly ask and are not part of generated plan
- Write ACC customer data to the connector's local disk or database. ACC data goes
  ACC API -> Unity Catalog Volume only. Local storage holds config, tokens and run state.
- Commit anything under `acc-connector/secrets/`, `.env`, or a real `SECRET_KEY`.

### When Unsure
- Ask for clarification instead of guessing.
- Briefly state trade-offs in review notes.

## Code Generation Instructions
- Analyze the changes in specifications and design documents using version control diff, identify required code changes/additions/deletions, and implement only those changes in source code.
- Follow this project's coding guidelines and `docs/design/ARCHITECTURE.md` layering rules.

### Generating new source code file.
- Add the "Purpose" code comment to start of any new source code file that you generate. Describe what is the purpose of this file or class implemented/declared in this file.
- Add an entry for the new source code file in `docs/design/sourcemap.md`. The entry must contain the name of the source code file (path relative to project root) and the purpose of the file.

### Purpose Comment
- "Purpose" comment is short (maximum 4-5 lines)
- "Purpose" comment describes need, what is implemented, any particular algorithms or data structures used.
- **Bad Purpose Comment**
    - This file implements FeatureCache class
- **Good Purpose Comment**
    - A feature cache is required for improving the performance. FeatureCache class implements it. FeatureCache class uses LRU algorithm for caching and uses custom dictionary implementation.

### Modifying the existing files
- Use information from `sourcemap.md` to decide which existing files to modify.

## Code Review Instructions
- Check the change against the layering rules in `docs/design/ARCHITECTURE.md` and the
  decisions in `docs/design/ADR.md` before reviewing anything else.
- Follow this project's review guidelines.

## Executing Commands with Environment Configuration

There is no `environment.bat` / `environment.sh` in this project. The environment is a
Python virtualenv plus an `.env` file, both rooted at `acc-connector/`. Activate the
virtualenv before running any command. See `docs/devenv.md` for first-time setup.

Do not create an `environment.bat` / `environment.sh` for this project — `start.bat` and
`stop.bat` already cover the run path, and `.env` covers configuration.

### Windows (PowerShell/pwsh)
```powershell
# Everything runs from acc-connector/ with its virtualenv active
cd acc-connector
.\.venv\Scripts\Activate.ps1

# Examples:
python -m unittest discover -s tests
python scripts/smoke_check.py      # offline smoke check, same one CI runs
.\start.bat                        # run the Flask app on http://localhost:8000
.\stop.bat
```

### Unix/Linux (Bash)
```bash
cd acc-connector
source .venv/bin/activate

# Examples:
python -m unittest discover -s tests
python scripts/smoke_check.py
gunicorn --bind=0.0.0.0 --timeout 600 app:app
```

### Best Practices
- **Always run from `acc-connector/`**: every relative path in the app, the tests and
  `.github/workflows/acc-connector-ci.yml` assumes that working directory.
- **`SECRET_KEY` must be set** before the app or `smoke_check.py` will start. Local dev
  reads it from `acc-connector/.env`; CI passes a dummy value.
- **Frontend test** `tests/sync_button_state.test.js` runs under Node, not pytest:
  `node tests/sync_button_state.test.js`.
- **Notebooks under `acc-connector/notebooks/` do not run locally.** They execute inside
  the customer's Databricks workspace. Do not add local imports to them.
