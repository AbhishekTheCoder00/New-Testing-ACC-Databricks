"""
Purpose: gunicorn settings for the Databricks Apps deployment, loaded explicitly by app.yaml
(`gunicorn -c databricks_gunicorn.conf.py app:app`). Binds to the platform-assigned
DATABRICKS_APP_PORT, exits inside the 15 s SIGTERM window, and keeps one worker because
timers, locks and token caches are in-process. Not named gunicorn.conf.py so EC2 never loads it.
"""
import os

bind = f"0.0.0.0:{os.environ.get('DATABRICKS_APP_PORT', '8000')}"

# One process: U2M daily CDC timers, refresh locks and progress dicts live in memory,
# and a second worker would rehydrate the timers again and double-run each sync.
workers = 1
threads = 8

# Matches startup.txt — bootstrap and export calls can hold a request for minutes.
timeout = 600

# Databricks Apps sends SIGKILL 15 s after SIGTERM.
graceful_timeout = 10

# Databricks captures stdout/stderr as the app log.
accesslog = '-'
errorlog = '-'
