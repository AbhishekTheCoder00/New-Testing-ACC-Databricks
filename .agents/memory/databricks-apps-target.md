---
name: databricks-apps-target
description: acc-connector runs hybrid — EC2 for external hub admins, a Databricks App for internal users, with shared RDS and AWS Secrets Manager
metadata:
  type: project
---

Decided 2026-09-30, and recorded in `docs/design/ADR.md` under "Databricks Apps hosting — hybrid":
- **EC2** serves external hub admins. It runs with `ENABLE_U2M=false` and owns the scheduled-CDC cron.
- **The Databricks App** (`acc-connector/app.yaml`) serves internal users. It runs with `ENABLE_U2M=true`.
- Both deployments share RDS Postgres (`CONN_STRING`) and the `aws` SecretStore.
- `SECRET_KEY`, `SECRET_STORE_PREFIX` and `APP_ENV` must be identical on both.

**Why:** A Databricks App only admits users signed in to the hosting Databricks account. Its
local disk is also ephemeral, which kills SQLite and the local SecretStore.

**How to apply:**
- Never let both deployments run U2M, because the daily timers would double-run every sync.
- Inside an app, `DATABRICKS_CLIENT_ID/SECRET` belong to the platform. `config.py` reads
  `CONNECTOR_DATABRICKS_CLIENT_*` instead.
- Lakebase was deferred: its token-based password needs a refreshing pool.
