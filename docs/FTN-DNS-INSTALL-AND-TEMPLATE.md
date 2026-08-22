# FTN DNS Installation & Template Standard

This standard makes DNS deployment a first-class FTN platform capability and keeps DNS configuration declarative, versioned, observable, and controlled by the Control Plane.

## Supported Roles

| Role | Component | Purpose |
|---|---|---|
| Authoritative | PowerDNS | FTN zones and authoritative service |
| Recursive | Unbound | Recursive/cache resolver |
| Edge | dnsdist | DNS routing, health checks, load distribution |
| Cluster | CoreDNS | Service/cluster DNS and dynamic discovery |
| Optional enterprise edge | Technitium DNS | Alternative integrated DNS edge where required |

## Installation Profiles

- `authoritative`: PowerDNS + PostgreSQL backend
- `recursive`: Unbound
- `edge`: dnsdist
- `full`: PowerDNS + Unbound + dnsdist + CoreDNS integration

Use `deploy/dns/install-dns.sh` for the guarded host installation template. It performs a dry run unless `--apply` is explicitly supplied.

## Template Contract

`deploy/dns/dns-stack.template.yaml` defines:

- Listener address and TCP/UDP support
- Authoritative / recursive / edge / cluster roles
- Upstream resolvers
- Health checks
- DNSSEC policy
- Recursion ACL
- Zone-transfer ACL
- API binding policy
- PostgreSQL persistence
- Metrics, structured logs, and audit
- Control Plane and Socket event integration
- Backup-before-change behavior

## Production Rules

1. Do not expose recursive DNS to the public Internet unless intentionally designed and ACL-protected.
2. Zone transfers are allowlisted explicitly.
3. DNSSEC is enabled for authoritative zones where supported by the deployment policy.
4. Management APIs bind to loopback or authenticated mTLS interfaces.
5. Existing DNS configuration is backed up before an applied change.
6. DNS configuration is generated from versioned templates rather than edited ad hoc.
7. Every DNS node reports health, latency, query/error metrics, certificate status where applicable, and service state.
8. DNS changes are audited and can be approval-gated through the FTN Control Plane.
9. Recursive upstreams are configurable; example addresses in templates are placeholders and must be reviewed for the deployment.
10. A DNS node is not marked production-ready until validation, failover, rollback, and monitoring checks pass.

## FTN Integration

```text
FTN Control Plane
       │
       ├── DNS Policy
       ├── Zone / Resolver Configuration
       ├── Approval + Audit
       │
       ▼
FTN Socket / Event Fabric
       │
       ▼
DNS Gateway / dnsdist
   ┌───┼───────────────┐
   ▼   ▼               ▼
PowerDNS Unbound    CoreDNS
   │      │             │
   └──────┴──────┬──────┘
                  ▼
       PostgreSQL / Metrics
                  │
                  ▼
       Monitoring + AI Analysis
```

## Branding

DNS management screens, installers, generated configuration metadata, monitoring dashboards, and documentation use the FTN master brand system established in `docs/FTN-NETWORK-ACCESS-AND-BRANDING.md`. The brand reference uses the supplied FTN Orbital Network Emblem and its blue/electric-green/metallic-silver visual language. fileciteturn5file0L2-L2
