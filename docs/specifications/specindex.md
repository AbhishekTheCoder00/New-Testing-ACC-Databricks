# Index of Specification Documents

This is an index of the specification documents for the ACC → Databricks connector.
The index format is:

- `<relative document path>` : {{short 2-3 lines description of the document content}}

## How to use this file

- Use this file to determine which specification documents to load.
- Do not load all specification documents every time.
- Update this index whenever you add a new specification document.
- Name every new document `FR-NN-<topic>.md`, continuing the numbering below.

## Specifications Index

### Multi-tenant M2M (production portal)

Read the M2M specification set via [`m2m_spec/specindex.md`](./m2m_spec/specindex.md).
Covers hub-scoped identity, SSA provisioning, APS client sharding, database schema, portal UI,
and test cases (FR-01 through FR-07).

### Data plane migration

- [`./FR-08-dataplane-api-migration.md`](./FR-08-dataplane-api-migration.md) : refactor
  notebook-based business logic into control-plane services and APIs. Defines Phase A
  (orchestration-time volume artifacts) and Phase B (internal metadata APIs), the complete
  notebook → control-plane replacement map, API contracts, IP protection rules, implementation
  sequencing, and verification checklist. Supersedes the informal design notes in
  `docs/design/2026-09-04-move-databricks-work-to-connector-design.md` and
  `docs/design/2026-09-08-api-replacement-and-ip-protection.md` for implementation purposes.

## Related design documents (not specifications)

- `docs/design/ARCHITECTURE.md` — tier boundary and layering rules
- `docs/design/ADR.md` — architecture decision records
- `docs/design/2026-09-04-move-databricks-work-to-connector-design.md` — original design proposal
- `docs/design/2026-09-08-api-replacement-and-ip-protection.md` — IP protection map (input to FR-08)
