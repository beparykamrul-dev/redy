# FTN DNS + Backend + Backbone + SiLK Production Contract

## 1. Traffic domains

FTN separates two logical mesh domains:

- **FTNDNS Global Mesh**: authoritative/recursive DNS, cache, Anycast, DNS health and provider DNS adapters.
- **FTN Server/Service Mesh**: backend, gateway, storage, databases, AI, applications and node-to-node service traffic.

They share service discovery and policy through the control plane but have independent health/failure domains.

## 2. DNS

Supported engines are selected by workload rather than forced onto every node:

- PowerDNS
- Hickory DNS
- CoreDNS
- Technitium DNS
- Unbound
- dnsdist

DNS provider adapters use documented/public/authorized interfaces only. A new DNS provider is registered through the same provider contract; the existing FTNDNS architecture is not rebuilt.

## 3. Backend / backbone

The FTN control plane manages desired state for nodes and services. Main servers form the FTN service fabric. Connectivity may use WireGuard/AmneziaWG, GoBGP, BFD, ECMP and Aether-Core integration boundaries according to node policy and supported capabilities.

BGP automation requires an authorized peer registry containing peer address, ASN, authentication mode, prefix filters and route policy. No unknown peer or unapproved route is automatically established or advertised.

## 4. PKI

FTN PKI/mTLS protects control-plane, service-to-service, gateway and node identity. Provider CA/trust chains remain provider-specific. ACME is used only for authorized certificate issuance/renewal. Private keys are never stored in source control.

## 5. Flow telemetry / SiLK

The traffic analytics pipeline is:

`Router/Gateway -> NetFlow/IPFIX/sFlow -> collector -> SiLK/flow analytics -> ClickHouse -> FTN AI/NOC`

Flow collectors must only ingest traffic telemetry from authorized FTN-owned or explicitly authorized network devices. SiLK is an analytics/measurement layer, not a mechanism for obtaining another provider's private traffic.

## 6. Backend data plane

- PostgreSQL: transactional/business state
- CockroachDB: distributed control state where required
- TimescaleDB: time-series metrics
- ClickHouse: high-volume logs, flow records and analytics
- Kafka/Flink: streaming and real-time processing

Distributed filesystems such as GlusterFS, MooseFS and BeeGFS are selected by workload; databases are not blindly placed on a distributed filesystem.

## 7. Automation loop

`DISCOVER -> REGISTER -> MEASURE -> POLICY -> CONFIGURE -> VERIFY -> MONITOR -> REBALANCE`

Every automated change is validated, idempotent, auditable and rollback-capable.

## 8. Provider integration rule

Global providers may be integrated through their public/open-source software, documented APIs, public DNS/edge interfaces, approved peering/transit arrangements and other explicitly authorized services. Private provider credentials, internal databases, private CA keys and private traffic are never assumed or harvested.

## 9. Control-panel outcomes

The control panel exposes desired state and policy. Node agents reconcile configuration automatically and report health. Traffic is balanced across eligible FTN nodes according to capacity, latency, loss, route health and service priority.
