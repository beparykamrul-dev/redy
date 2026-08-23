# FTN Final Integration Contract

This document defines the production integration boundary for the FTN control plane.

## Mesh domains

1. **FTNDNS Global Mesh** — authoritative/recursive DNS, Anycast, provider DNS federation, health and failover.
2. **FTN Server/Service Mesh** — nodes, services, gateways, storage, databases, AI and application workloads.

The two domains share the control plane and service registry but retain separate failure domains and policies.

## Provider integration

Provider integrations are adapter-based. Only officially exposed APIs, public/open-source software, documented protocols, or explicitly authorized network services may be integrated. Provider private databases, credentials, private CA keys, or internal traffic are never assumed to be accessible.

Each provider profile may define:

- DNS adapter
- API adapter
- CDN/edge adapter
- cloud/storage adapter
- telemetry/flow adapter
- CA/trust profile
- TLS/mTLS policy
- health checks
- rate limits
- license and version metadata

## PKI / trust plane

FTN PKI is the internal trust plane for node, device, gateway and service identity. Provider trust chains remain provider-specific. ACME is used only for authorized certificate issuance/renewal. Private CA keys remain protected by appropriate key-management/HSM controls.

## Routing and traffic

BGP automation uses an explicit peer registry containing authorized peer address, ASN, authentication mode, prefix policy and route filters. GoBGP/BFD/ECMP may be used where supported. Control-plane API communication uses mTLS; BGP authentication is provider/router capability dependent.

No unknown peer is automatically established and no unapproved prefix is advertised.

## Data plane

- PostgreSQL: transactional/business data
- CockroachDB: distributed control/state where required
- TimescaleDB: time-series metrics
- ClickHouse: high-volume logs, flow and analytics retention
- Kafka/Flink: streaming and real-time processing
- GlusterFS/MooseFS/BeeGFS: workload-specific distributed file/storage fabric

Databases are not blindly placed on distributed filesystems; storage is selected by workload and consistency requirements.

## Observability and discovery

Node discovery combines MAC/IP information with DHCP/ARP/ND, LLDP, SNMP, router APIs and certificate identity where available. IP geolocation is approximate metadata, not physical-location proof.

Flow telemetry uses authorized NetFlow/IPFIX/sFlow sources and is processed through the FTN telemetry pipeline.

## Automated lifecycle

`DISCOVER -> REGISTER -> MEASURE -> POLICY -> CONFIGURE -> VERIFY -> MONITOR -> REBALANCE`

Every automated configuration change must pass validation, dependency checks, health verification and rollback handling.

## Security

Wazuh, eBPF/XDP, firewall policy, TPM-backed key protection, secret management, audit logging and signed artifacts are integrated as security controls rather than bypasses.

## Implementation rule

New providers, protocols, databases or storage engines must be added through versioned adapters/contracts rather than rewriting the FTN core. Existing services must remain backward compatible during migration.
