# FTN Secure Network Access & Brand System

## Brand Direction

The uploaded FTN Orbital Network Emblem is the primary visual reference for the platform brand.

### Brand language
- Futuristic enterprise networking
- Orbital / global mesh visual metaphor
- Precision, reliability, automation
- Blue + electric green + metallic silver visual system
- Dark infrastructure UI with high-contrast telemetry

### Logo usage
- Primary: full FTN Orbital Network Emblem
- Compact: FTN monogram / emblem mark
- Wordmark: FTN / Family Time Network
- Infrastructure services use the same master mark with service-specific labels, not unrelated logos.
- Preserve clear space and aspect ratio; never stretch, recolor, or distort the master logo.

## Secure Network Access Stack

### Modern VPN / Tunnel Layer
- WireGuard
- AmneziaWG
- OpenVPN 3
- Hysteria2
- Shadowsocks
- FTN Proxy Gateway
- Aether-Core transport/orchestration layer
- GRE Tunnel
- SSLH Multiplexer

### Compatibility / Legacy Layer
- PPTP — legacy compatibility only; isolated from the preferred secure access path and disabled by default where possible.

## FTN Access Architecture

```text
FTN Client / Edge
      │
      ▼
FTN Access Gateway
      │
      ├── WireGuard
      ├── AmneziaWG
      ├── OpenVPN 3
      ├── Hysteria2
      ├── Shadowsocks
      ├── FTN Proxy
      ├── GRE
      └── SSLH Multiplexer
      │
      ▼
Aether-Core Transport / Policy Layer
      │
      ├── Identity
      ├── PKI / Certificates
      ├── Policy
      ├── Routing
      ├── Health / Failover
      └── Telemetry
      │
      ▼
FTN Core / POP / Service Network
```

## Protocol Roles

| Component | Role | Security posture |
|---|---|---|
| WireGuard | Primary modern tunnel | Preferred |
| AmneziaWG | WireGuard-compatible transport profile | Controlled / policy-based |
| OpenVPN 3 | Cross-platform VPN | Supported |
| Hysteria2 | QUIC-based transport | Controlled edge use |
| Shadowsocks | Proxy transport | Controlled edge use |
| FTN Proxy | Application / service proxy | Policy-controlled |
| GRE | Network encapsulation | Private trusted links only; pair with encryption when required |
| SSLH | Protocol multiplexer | Edge utility |
| PPTP | Legacy compatibility | Deprecated / isolated |

## PKI Adjustment

PKI is a platform-wide security service, not a VPN-specific add-on.

- Root CA hierarchy
- Intermediate CA hierarchy
- Node certificates
- Service certificates
- Client certificates where required
- mTLS identity
- Certificate rotation
- Revocation / status handling
- Hardware-backed key integration where available
- Secrets separation
- Audit trail

## Control Plane Integration

Every access protocol is managed through the FTN Control Plane:

`Identity → Policy → Protocol Profile → Gateway → Route → Telemetry → Audit`

Protocol configuration must be declarative and versioned. Credentials and private keys must never be stored in application source code or ordinary repository configuration.

## Monitoring

Expose protocol-level telemetry for:
- Active sessions
- Handshake failures
- Connection latency
- Throughput
- Packet loss
- CPU / memory
- Gateway health
- Certificate expiry
- Reconnect rate
- Per-node / per-protocol errors

## Branding in Applications

Use the FTN master brand system consistently across:
- Web App Builder
- Android App Builder
- FTN Connect
- FTN Tunnel
- NOC Dashboard
- Control Panel
- Billing
- AI Call Center
- Network Access Gateway
- Monitoring / Grafana
- Documentation

Service names may be visually differentiated by typography or small labels, while retaining the FTN master emblem and visual language.
