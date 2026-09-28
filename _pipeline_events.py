"""Fetch pipeline event log entries for the failed run.
Local diagnostic script - delete after use.
"""
from __future__ import annotations

import json
import sys

sys.path.insert(0, 'acc-connector')
# from backend import state_store as db

from backend.repositories import state_store as db
from backend.databricks_client import DatabricksClient

PIPELINE_ID = '6283abfe-3916-4c75-9600-7ed3f9472069'
UPDATE_ID = '84673e27-cb56-42ed-8130-66dafebc9755'


def latest_user_id() -> str | None:
    import sqlite3, os
    db_path = os.path.join('acc-connector', 'connector.db')
    if not os.path.exists(db_path):
        return None
    con = sqlite3.connect(db_path)
    con.row_factory = sqlite3.Row
    row = con.execute(
        'SELECT user_id FROM dbx_tokens ORDER BY updated_at DESC LIMIT 1'
    ).fetchone()
    con.close()
    return row['user_id'] if row else None


uid = latest_user_id()
if not uid:
    print('No Databricks tokens in connector.db — cannot query API.')
    sys.exit(1)

tok = db.get_dbx_tokens(uid)
if not tok:
    print(f'No tokens row for user {uid}')
    sys.exit(1)

dbx = DatabricksClient(tok['workspace_url'], tok['access_token'])

# Pull events for this pipeline, filtering on the failed update.
# Databricks Pipelines events API:
# GET /api/2.0/pipelines/{pipeline_id}/events
resp = dbx.get(
    f'/api/2.0/pipelines/{PIPELINE_ID}/events'
    f'?max_results=200&filter=update_id%20%3D%20%27{UPDATE_ID}%27'
)
events = resp.get('events', [])
print(f'Fetched {len(events)} events for update {UPDATE_ID}')
print()

# Show only ERROR / FAILED / fatal entries first, then any flow_progress
# transitions to FAILED state.
errors = [
    e for e in events
    if e.get('level') in ('ERROR', 'WARN', 'METRICS')
    or 'fatal' in (e.get('error') or {})
    or e.get('event_type') in ('update_progress', 'flow_progress')
]

# Sort newest first (events list usually newest-first already, but ensure it).
errors.sort(key=lambda e: e.get('timestamp') or '', reverse=True)

print('=== ERROR / WARN events (newest first) ===\n')
shown = 0
for ev in errors:
    if shown >= 30:
        break
    level = ev.get('level', '?')
    etype = ev.get('event_type', '?')
    msg = ev.get('message', '')
    err = ev.get('error') or {}
    ts = ev.get('timestamp', '')
    if level not in ('ERROR', 'WARN') and not err:
        continue
    print(f'[{ts}] {level} {etype}')
    print(f'  {msg}')
    if err:
        for ex in err.get('exceptions', [])[:2]:
            cls = ex.get('class_name', '')
            m = ex.get('message', '')
            print(f'  EX [{cls}]: {m[:500]}')
    print()
    shown += 1

if shown == 0:
    print('No ERROR/WARN events with details — printing all events compactly:')
    for ev in events[:40]:
        ts = ev.get('timestamp', '')
        lvl = ev.get('level', '?')
        et = ev.get('event_type', '?')
        msg = ev.get('message', '')[:200]
        print(f'[{ts}] {lvl:5s} {et:25s} {msg}')
