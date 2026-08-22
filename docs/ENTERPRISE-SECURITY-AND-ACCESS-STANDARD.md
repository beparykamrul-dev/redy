# FTN Enterprise Security & Access Standard

## 1. Security Architecture

Security is enforced as a platform boundary across kernel, nodes, APIs, sockets, applications, network access, billing, AI, and call-center services.

```text
Identity → Authentication → Authorization → Policy → Action → Audit
                         ↘ Socket / API / Service Boundary
```

## 2. Identity and PKI

- Root CA kept offline where operationally practical
- Intermediate CA for platform/service domains
- Unique certificate identity for nodes and services
- Short-lived workload certificates where supported
- mTLS for service-to-service and privileged node communication
- Certificate rotation and revocation
- CRL/OCSP strategy where applicable
- Secure key storage with TPM/HSM integration where available
- Secrets never embedded in source code

## 3. Access Profiles

### User Access
- Super Admin
- Admin
- Engineer
- Employee
- Reseller
- Partner
- Customer
- Call Center Agent

### Machine Access
- Control Plane
- Socket Gateway
- Network Node
- Monitoring Agent
- AI Worker
- Billing Worker
- Call Center Worker

Every identity receives least-privilege permissions and an explicit scope.

## 4. Network Access Profiles

Supported protocol adapters are isolated behind a common access interface:

- WireGuard
- AmneziaWG
- OpenVPN 3
- Hysteria2
- Shadowsocks
- GRE
- SSLH multiplexer
- PPTP legacy adapter
- Proxy gateway

Protocol selection is policy-driven. Legacy protocols must be isolated, explicitly enabled, monitored, and never treated as the default security profile.

## 5. Socket Security

- Authenticated handshake
- Certificate or workload identity
- Authorization before privileged operations
- Request IDs and correlation IDs
- Replay protection where protocol semantics require it
- Rate limits
- Message-size limits
- Backpressure
- Connection lifecycle controls
- Structured security events
- Graceful revocation of compromised identities

## 6. AI Action Boundary

AI is an orchestrator and advisor, not an unrestricted privileged principal.

### Read Operations
Examples:
- inspect metrics
- inspect customer/account state
- inspect network state
- diagnose service health

### Approval-Controlled Operations
Examples:
- network configuration changes
- customer suspension/reactivation
- payment or ledger adjustments
- credential rotation
- production deployment
- destructive data operations

High-impact actions require policy evaluation and, where configured, explicit human approval before execution.

## 7. Billing Security

- Immutable transaction identifiers
- Double-entry-compatible ledger boundary
- Webhook signature verification
- Idempotent payment processing
- Reconciliation
- Separation of payment credentials from application data
- Financial audit events
- Approval workflow for manual adjustments

## 8. Call Center Security

- Agent authentication
- Role-based access
- Customer identity verification before sensitive disclosure
- Minimal access to billing/network records
- Call metadata audit
- Human escalation
- AI action restrictions
- Retention policy for transcripts and metadata

## 9. Observability

Security and operational telemetry must cover:

- Kernel
- Nodes
- API
- Socket
- Network tunnels
- DNS
- Database
- Billing/payment
- AI
- Call center
- Authentication and authorization

## 10. Production Security Gate

A service cannot be marked production-ready until it has:

- Authentication and authorization
- Secure configuration handling
- Secret management
- Audit events for privileged actions
- Health and metrics endpoints
- Structured logs
- Unit/integration/contract tests as appropriate
- Dependency/container security checks
- Backup/recovery considerations
- Documented failure behavior

## 11. Branding Rule

The FTN master visual identity is applied consistently across platform UI, Web Builder templates, Android Builder templates, NOC dashboards, billing interfaces, call-center interfaces, network access profiles, documentation, and generated application metadata.

Branding must not alter security semantics, protocol identifiers, or standards-compliant interoperability.
