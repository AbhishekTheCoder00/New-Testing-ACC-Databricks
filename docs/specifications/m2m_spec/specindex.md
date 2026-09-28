# Index of Specification Documents

This is an index of the specification documents for the ACC → Databricks connector.
The index format is:

- `<relative document path>` : {{short 2-3 lines description of the document content}}

## How to use this file

- Use this file to determine which specification documents to load.
- Do not load all specification documents every time.
- Update this index whenever you add a new specification document.
- Name every new document `FR-NN-<topic>.md`, continuing the numbering below.

## Overview

The application is an **ACC → Databricks connector**. A user signs in to Autodesk
Construction Cloud, picks a hub and project, connects a Databricks workspace, and the
connector provisions Unity Catalog artifacts and syncs ACC Data Connector extracts into a
Bronze layer using AUTO CDC pipelines. There is also a headless Machine-to-Machine path
for unattended operation.

The specification set below describes the **next phase**, not the shipped POC: replacing
the single-user, global-credential M2M path with a production multi-tenant model where
the **Forma/ACC hub is the isolation boundary** — one SSA robot per hub, one connection
per (hub + project + Databricks workspace + catalog), and scheduled sync that never
depends on a human's refresh token.

## Specifications Index

Read in this order. FR-01 and FR-02 set the model; everything else depends on them.

### Foundation

- `./FR-01-multi-tenant-identity.md` : the founding architecture decision record.
  Establishes `hub_id` (not `acc_account_id`) as the tenant boundary, defines the
  identifier cheat sheet (`aps_user_id` / `acc_account_id` / `hub_id` / `project_id` /
  `connection_id`), the entity model, the master onboarding decision tree, and the
  uniqueness constraints that make provisioning idempotent.
- `./FR-02-business-requirements.md` : business requirements derived from FR-01.
  Hub-admin-only access policy, objectives BO-01–08, functional requirements FR-01–FR-30,
  business rules BR-01–BR-12, six user scenarios A–F, NFRs, POC migration table.
  Status is still **Draft for review** — §19 lists five unresolved product decisions and
  §20 is an unsigned approval table.

### Implementation

- `./FR-03-m2m-ssa-workflow.md` : the production server-side M2M workflow. Phases A–F
  (vendor APS app setup, automated SSA provisioning, manual hub whitelist + verify
  probes, SSA JWT-bearer token minting, Databricks service-principal tokens,
  connection-scoped sync), backend API surface, idempotency and concurrency guards,
  key rotation, risk register, and an extended Q&A. Supersedes the POC
  `m2m_service.py` / `m2m_routes.py` / `m2m_repository.py` and all `m2m_*` tables.
- `./FR-04-aps-client-sharding.md` : how to live within the APS quota of 10 service
  accounts per Client ID. Registry of APS app shards, deterministic shard selection at
  first provision, immutable per-hub assignment, capacity pre-check, hub-11 and
  hub-revisit flows, ops alerting at 80%, and its own TC-01–TC-10 test list.
  Child document of FR-03.
- `./FR-05-database-schema.md` : production RDS PostgreSQL schema with a SQLite subset
  for local dev. Storage tiers T0–T6, AWS Secrets Manager naming and the
  RDS-holds-refs-only rule, all table definitions, uniqueness constraints and indexes,
  `connection_id` computation, onboarding status enums, the `SecretStore` protocol,
  POC migration phases, and the full DDL.

### UI

- `./FR-06-portal-ui.md` : UI design specification for the M2M Hub Sync portal
  (epic ACC-M2M-001). Login → hub picker → app shell (Dashboard / Connections /
  Setup wizard / Help), Tailwind design system, screen-by-screen layout, ASCII
  wireframes, form-validation matrix, edge cases, and a verbatim copy bank.
  **Caveat:** written against a client-side mock (`static/m2m_v2/`) that is not present
  in this repository, and §14 forbids a backend. Treat it as the visual and behavioural
  target to be wired to the real API, not as a build-a-mock instruction.

### Verification

- `./FR-07-test-cases.md` : 89 test cases traced back to FR-02 — auth and access control,
  session and hub switching, user↔hub mapping, SSA provisioning, whitelist gating,
  connections, sync, concurrency, E2E journeys A–F, security/NFR, POC migration.
  P0/P1/P2 prioritized, with a requirements traceability matrix.
  Does **not** yet cover FR-04 sharding.

## Renamed documents

These documents were renamed to the `FR-NN-<topic>.md` convention. Their **contents were
left unchanged**, so they still refer to each other by the old names in prose,
traceability tables and section citations (e.g. "`DATABASE.md` §2",
"`M2M_SSA_IMPLEMENTATION.md` §6.2", "`BUSINESS_REQUIREMENTS.md` §4.2", "`M2M_req 1.md`").
Resolve any such reference through this table. Markdown links have already been repointed.

| Referred to as | Actual file |
|---|---|
| `M2M_req 1.md`, `M2M_req` | `./FR-01-multi-tenant-identity.md` |
| `BUSINESS_REQUIREMENTS.md` | `./FR-02-business-requirements.md` |
| `M2M_SSA_IMPLEMENTATION.md` | `./FR-03-m2m-ssa-workflow.md` |
| `M2M_SSA_APS_CLIENT_SHARDING.md` | `./FR-04-aps-client-sharding.md` |
| `DATABASE.md` | `./FR-05-database-schema.md` |
| `UI_DESIGN.md`, `UI.md`, `M2M-NEW-UI-Design.md` | `./FR-06-portal-ui.md` |
| `TEST_CASES.md` | `./FR-07-test-cases.md` |

## Referenced but missing

These are cited by the specifications above and do **not** exist anywhere in the repo.
Do not go looking for them.

| Document | Cited by | What is therefore unspecified |
|---|---|---|
| `SECURITY.md` | FR-03 §13, §17 | Route-level RBAC, vault layout, key-rotation policy |
| `PLATFORM.md` | FR-01 §"Auth paths", FR-03 §17 | Full platform architecture |
| `CREDENTIAL_STORAGE_SPEC` | FR-05 header, §Traceability | Upstream source of the T0–T6 credential tiers |

## Notes

- `acc-connector/docs/pipeline.md` is implementation notes for the **shipped** Bronze
  sync pipeline, not approved requirements for this phase.
- FR-04 uses its own `TC-01`…`TC-10` identifiers, which are unrelated to the `TC-<AREA>-NN`
  identifiers in FR-07.

Constraints Points
  note : 1. Dont touch U2M related to code anywhere.it should work as is.
  2. existing M2M related code should be first commented and this spec should write a fresh new implementation .
  3. Existing m2M related code should not be used as refrence instead rely completely on specs.
