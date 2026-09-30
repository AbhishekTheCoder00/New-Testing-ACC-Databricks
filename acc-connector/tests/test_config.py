"""
Purpose: Pins config precedence across both hosts. On EC2 an env var still beats the per-user
DB row for every key. Inside a Databricks App the platform injects its own service principal
as DATABRICKS_CLIENT_ID/SECRET, which must not shadow each user's Databricks OAuth app; only
the explicit CONNECTOR_* override may. Also pins the Databricks App gunicorn port and shutdown.
"""

from __future__ import annotations

import os
import runpy
import sys
import unittest
from pathlib import Path
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from backend import config  # noqa: E402

_MANAGED_VARS = (
    'DATABRICKS_APP_NAME',
    'DATABRICKS_CLIENT_ID',
    'DATABRICKS_CLIENT_SECRET',
    'CONNECTOR_DATABRICKS_CLIENT_ID',
    'CONNECTOR_DATABRICKS_CLIENT_SECRET',
    'APS_CLIENT_ID',
)

_DB_ROWS = {
    'DATABRICKS_CLIENT_ID':     'user-oauth-cid',
    'DATABRICKS_CLIENT_SECRET': 'user-oauth-secret',
    'APS_CLIENT_ID':            'db-aps-cid',
}


def _env(**values: str) -> dict:
    """os.environ minus every var these tests reason about, plus ``values``."""
    env = {k: v for k, v in os.environ.items() if k not in _MANAGED_VARS}
    env.update(values)
    return env


class GetConfigPrecedenceTests(unittest.TestCase):
    def setUp(self):
        config.invalidate_config_cache()
        patcher = patch.object(
            config.db, 'get_secret', side_effect=lambda uid, name: _DB_ROWS.get(name),
        )
        patcher.start()
        self.addCleanup(patcher.stop)
        self.addCleanup(config.invalidate_config_cache)

    def test_outside_databricks_app_env_still_wins(self):
        with patch.dict(os.environ, _env(DATABRICKS_CLIENT_ID='env-cid'), clear=True):
            self.assertEqual(
                config.get_config('DATABRICKS_CLIENT_ID', user_id='u1'), 'env-cid',
            )

    def test_outside_databricks_app_falls_back_to_db(self):
        with patch.dict(os.environ, _env(), clear=True):
            self.assertEqual(
                config.get_config('DATABRICKS_CLIENT_ID', user_id='u1'), 'user-oauth-cid',
            )

    def test_databricks_app_ignores_injected_service_principal(self):
        env = _env(
            DATABRICKS_APP_NAME='acc-connector',
            DATABRICKS_CLIENT_ID='app-sp-cid',
            DATABRICKS_CLIENT_SECRET='app-sp-secret',
        )
        with patch.dict(os.environ, env, clear=True):
            self.assertEqual(
                config.get_config('DATABRICKS_CLIENT_ID', user_id='u1'), 'user-oauth-cid',
            )
            self.assertEqual(
                config.get_config('DATABRICKS_CLIENT_SECRET', user_id='u1'),
                'user-oauth-secret',
            )

    def test_databricks_app_injected_value_never_used_as_default(self):
        env = _env(DATABRICKS_APP_NAME='acc-connector', DATABRICKS_CLIENT_ID='app-sp-cid')
        with patch.dict(os.environ, env, clear=True):
            # No session user and no user_id: must return the default, not the app's SP.
            self.assertEqual(config.get_config('DATABRICKS_CLIENT_ID', 'dflt'), 'dflt')

    def test_databricks_app_honours_connector_override(self):
        env = _env(
            DATABRICKS_APP_NAME='acc-connector',
            DATABRICKS_CLIENT_ID='app-sp-cid',
            CONNECTOR_DATABRICKS_CLIENT_ID='global-cid',
            CONNECTOR_DATABRICKS_CLIENT_SECRET='global-secret',
        )
        with patch.dict(os.environ, env, clear=True):
            self.assertEqual(
                config.get_config('DATABRICKS_CLIENT_ID', user_id='u1'), 'global-cid',
            )
            self.assertEqual(
                config.get_config('DATABRICKS_CLIENT_SECRET', user_id='u1'), 'global-secret',
            )

    def test_databricks_app_leaves_other_keys_env_first(self):
        env = _env(DATABRICKS_APP_NAME='acc-connector', APS_CLIENT_ID='env-aps-cid')
        with patch.dict(os.environ, env, clear=True):
            self.assertEqual(
                config.get_config('APS_CLIENT_ID', user_id='u1'), 'env-aps-cid',
            )


class DatabricksGunicornConfigTests(unittest.TestCase):
    _CONF = ROOT / 'databricks_gunicorn.conf.py'

    def _load(self, **env: str) -> dict:
        with patch.dict(os.environ, _env(**env), clear=True):
            return runpy.run_path(str(self._CONF))

    def test_binds_all_interfaces_on_platform_port(self):
        self.assertEqual(self._load(DATABRICKS_APP_PORT='8123')['bind'], '0.0.0.0:8123')

    def test_exits_inside_platform_sigterm_window(self):
        # Databricks Apps SIGKILLs 15 s after SIGTERM.
        self.assertLess(self._load(DATABRICKS_APP_PORT='8123')['graceful_timeout'], 15)

    def test_single_worker(self):
        # In-process timers, locks and token caches assume exactly one process.
        self.assertEqual(self._load(DATABRICKS_APP_PORT='8123')['workers'], 1)


if __name__ == '__main__':
    unittest.main()
