# FTN Completion Gate

This is the final acceptance contract for the FTN platform. A module is not marked production-ready merely because its architecture or documentation exists.

## Required gates

1. Contract/schema exists and is versioned.
2. Implementation exists or has an explicit adapter boundary.
3. Configuration is reproducible.
4. Secrets are external to source control.
5. Authentication/authorization is enforced.
6. Health checks and telemetry exist.
7. Failure handling and rollback exist.
8. Automated tests cover the critical path.
9. CI validates the changed component.
10. Deployment acceptance is recorded.

## Core completion domains

- FTNDNS Global Mesh
- FTN Server/Service Mesh
- Provider Registry/Adapters
- GoBGP/BFD/ECMP
- PKI/ACME/mTLS
- Gateway/traffic policy
- Node/service auto-discovery
- PostgreSQL/CockroachDB/TimescaleDB/ClickHouse
- Kafka/Flink
- SiLK/IPFIX/NetFlow telemetry
- Storage abstraction
- AI/service automation
- Wazuh/security/audit
- Control-panel reconciliation

## DNS acceptance

DNS nodes must register, reconcile configuration, pass health checks and fail over without changing the existing FTN DNS contract. New providers are added through adapters.

## Routing acceptance

Only authorized peers and prefixes may be configured. Route filters and policy must be evaluated before advertisements. BFD/ECMP changes require health verification.

## Traffic analytics acceptance

Only authorized FTN exporters may feed flow collectors. IPFIX/NetFlow records must be normalized before analytics. SiLK/ClickHouse data must retain source and collection metadata.

## Automation acceptance

The standard lifecycle is:

`DISCOVER -> REGISTER -> MEASURE -> POLICY -> CONFIGURE -> VERIFY -> MONITOR -> REBALANCE`

Automations must be idempotent and auditable. Destructive or externally impactful actions require explicit authorization unless a previously approved policy permits them.

## Production declaration

The FTN project may be declared production-ready only after these gates pass for the specific deployed scope. Documentation-only completion must never be reported as runtime completion.
