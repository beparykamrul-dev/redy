# FTN Runtime Completion Matrix

This matrix separates architecture completion from runtime completion.

| Domain | Contract | Runtime requirement | Acceptance evidence |
|---|---|---|---|
| DNS Global Mesh | Yes | DNS node agent + reconciliation | health/failover test |
| Server/Service Mesh | Yes | node/service agent | registration/recovery test |
| Backend | Yes | API + state adapters | integration tests |
| Backbone | Yes | routing/transport agents | route/failover test |
| BGP | Yes | GoBGP/BFD policy agent | authorized peer test |
| PKI | Yes | issuance/renewal/revocation | certificate lifecycle test |
| Gateway | Yes | gateway reconciliation | traffic health test |
| Flow/SiLK | Yes | authorized IPFIX/NetFlow collector | flow ingestion test |
| Metrics | Yes | TimescaleDB pipeline | metric query test |
| Logs/Analytics | Yes | ClickHouse pipeline | retention/query test |
| Streaming | Yes | Kafka/Flink jobs | replay/backpressure test |
| Storage | Yes | selected storage adapters | failover/recovery test |
| AI | Yes | decision workflow | deterministic policy test |
| Security | Yes | Wazuh/secret/audit controls | security CI |
| Control Panel | Yes | desired-state reconciliation | end-to-end test |

## Release rule

A row becomes runtime-complete only when its implementation, tests, deployment configuration and operational evidence exist. A contract or documentation commit alone does not satisfy the runtime gate.

## Shared control loop

`DISCOVER -> REGISTER -> MEASURE -> POLICY -> CONFIGURE -> VERIFY -> MONITOR -> REBALANCE`

## Safety rule

Automation acts only on FTN-owned or explicitly authorized infrastructure and provider interfaces. Credentials, private CA keys and unapproved routing data are never generated or assumed by the system.
