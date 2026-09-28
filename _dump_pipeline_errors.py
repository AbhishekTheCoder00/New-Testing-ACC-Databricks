"""One-shot diagnostic: dump ERROR events for the failed pipeline update.

Reuses the connector's stored Databricks OAuth token + DatabricksClient so
we don't have to copy creds around. Safe to delete after use.
"""

import sys

sys.path.insert(0, 'acc-connector')

from dotenv import load_dotenv
load_dotenv('acc-connector/.env')

# from backend import state_store as db
from backend.repositories import state_store as db
from backend.databricks_client import DatabricksClient

USER_ID     = 'ADBJ6M2HNFN28RHU'
PIPELINE_ID = '6283abfe-3916-4c75-9600-7ed3f9472069'
UPDATE_ID   = '411b3ff8-ea7a-408a-8533-6d0ab0d30bc9'

tok = db.get_dbx_tokens(USER_ID)
if not tok:
    raise SystemExit(f'No dbx_tokens for user {USER_ID}')

dbx = DatabricksClient(tok['workspace_url'], tok['access_token'])

# Pull events for this update; filter by ERROR level. The Pipelines events
# API returns the most recent first by default.
data = dbx.get(
    f'/api/2.0/pipelines/{PIPELINE_ID}/events',
    params={
        'filter':      f"update_id = '{UPDATE_ID}'",
        'max_results': 50,
        'order_by':    'timestamp desc',
    },
)
events = data.get('events', [])
print(f'--- {len(events)} events for update {UPDATE_ID} (newest first) ---\n')

for e in events:
    lvl = e.get('level')
    if lvl not in ('ERROR', 'WARN'):
        continue
    ts   = e.get('timestamp')
    typ  = (e.get('event_type') or '')
    msg  = (e.get('message') or '').strip()
    err  = (e.get('error', {}) or {})
    excs = err.get('exceptions') or []
    print(f'[{ts}] {lvl} ({typ})')
    print(f'  message: {msg[:600]}')
    for exc in excs[:3]:
        ec = (exc.get('class_name') or '')
        em = (exc.get('message') or '').strip()
        print(f'  exception: {ec}: {em[:600]}')
    print()
