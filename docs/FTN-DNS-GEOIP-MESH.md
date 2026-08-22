# FTN DNS + GeoIP Mesh

## Purpose

Provide a provider-neutral DNS mesh architecture with Hickory DNS as an additional Rust-based authoritative/recursive component, alongside PowerDNS, CoreDNS, Unbound and dnsdist. Hickory DNS is designed as a Rust DNS client/server/resolver stack and provides authoritative and recursive capabilities. citeturn0search0turn0search8

## DNS Roles

| Component | FTN role |
|---|---|
| dnsdist | Edge traffic distribution, policy, health-aware routing |
| PowerDNS | Primary API-managed authoritative DNS |
| CoreDNS | Service-discovery / cloud-native DNS |
| Unbound | Validating recursive resolver |
| Hickory DNS | Rust-based authoritative / recursive DNS option |

Hickory DNS supports DNSSEC validation and modern server networking/metrics features; the project currently publishes stable releases in the 0.26 series while its main branch is developing 0.27. Pin the exact version during deployment rather than tracking an unpinned development branch. citeturn0search2turn0search4

## GeoIP Layer

The GeoIP layer is an abstraction, not a hard dependency on a single database vendor.

- IPv4 and IPv6 lookup
- Country / region / city classification where licensed data permits
- ASN / network classification where licensed data permits
- Versioned dataset metadata
- Local cache
- Dataset integrity checks
- Refresh lifecycle
- Provider adapter interface
- Privacy-aware retention

## Geo DNS Policy

`Client IP → GeoIP lookup → policy evaluation → healthy POP set → DNS response`

Policy dimensions may include:

- Country
- Region
- ASN
- Client network class
- POP health
- Latency / RTT measurements
- Capacity
- Maintenance state
- Explicit customer policy

GeoIP must be treated as a routing signal rather than an identity assertion. If lookup confidence is low or the dataset is unavailable, the resolver falls back to the normal global/health-based policy.

## Mesh Flow

```text
                    FTN Control Plane
                           |
                    Policy / Config API
                           |
                      Socket / Events
                           |
                    +------+------+
                    | GeoIP Engine |
                    +------+------+
                           |
                     Geo Policy
                           |
                    +------+------+
                    |   dnsdist   |
                    +------+------+
                           |
          +----------------+----------------+
          |                |                |
      PowerDNS          CoreDNS         Hickory DNS
          |                |                |
          +----------------+----------------+
                           |
                       Unbound
                           |
                    Recursive Internet
```

## Failure Behaviour

1. GeoIP unavailable → use health/latency policy.
2. One DNS backend unhealthy → remove it from the healthy set.
3. Control Plane unavailable → retain last known-good configuration.
4. Dataset update fails → retain the previous validated dataset.
5. DNSSEC validation failure → follow the configured secure-failure policy; never silently weaken validation.
6. Socket/event transport unavailable → DNS service remains independently resolvable using its last known-good state.

## Observability

Export:

- Query rate
- Response latency
- NXDOMAIN/SERVFAIL rate
- DNSSEC validation failures
- Backend health
- GeoIP lookup latency
- Geo policy match rate
- POP selection distribution
- Dataset version
- Dataset refresh status
- Cache hit/miss

## Security

- mTLS for Control Plane ↔ DNS management traffic
- RBAC for zone/policy changes
- Signed/audited configuration changes
- DNSSEC for authoritative zones where applicable
- No customer PII stored merely because GeoIP routing is performed
- Explicit retention policy for query and routing telemetry

## Versioning Rule

Do not hard-code a floating Hickory development version into production images. The deployment pipeline should pin and verify a tested release, then update it through a controlled dependency upgrade process. Current upstream release information should be checked at build time. citeturn0search2
