# FTN Enterprise Implementation Baseline

This document turns the architecture map into an implementation contract. It is deliberately explicit about boundaries so modules can be implemented independently without creating hidden coupling.

## 1. Platform Layers

```text
Kernel / Runtime
      ↓
Node Runtime + Identity
      ↓
Control Plane
      ↓
API Gateway ───── Socket / Event Fabric
      ↓                    ↓
Domain Services       Realtime Events
      ↓                    ↓
Unified Data Layer ← Observability
      ↓
Web / Android / Builder Applications
```

## 2. Mandatory Service Contracts

Every production service must define:

- `config` — typed configuration and secure defaults
- `health` — liveness/readiness checks
- `metrics` — Prometheus-compatible metrics
- `logs` — structured JSON logs with correlation IDs
- `auth` — identity and authorization boundary
- `events` — published/consumed event contracts
- `errors` — stable error model
- `version` — API/schema compatibility information
- `shutdown` — graceful lifecycle handling
- `tests` — unit, integration, and contract coverage appropriate to risk

## 3. Core Domains

### Identity
Node, service, user, device, and application identities. Certificate-backed machine identity is preferred for infrastructure communication.

### Control Plane
Central policy, configuration, service discovery, approval, orchestration, and audit coordination.

### Socket Fabric
Secure realtime transport for node, service, AI, monitoring, billing, and application events. Transport adapters must remain replaceable; business logic must depend on message contracts rather than a concrete transport.

### Billing / Payments
Invoices, plans, usage rating, ledger, payment intents, provider adapters, webhooks, reconciliation, receipts, and notifications. Financial state transitions must be idempotent and auditable.

### AI
Model gateway, tool registry, context/knowledge layer, workflow execution, policy evaluation, and approval-controlled actions. AI output is not trusted as authorization.

### Call Center
Telephony adapter, call routing, IVR, queues, AI assistance, account lookup, ticketing, human handoff, call metadata, and audit.

### Network / Access
Network inventory and management adapters, DNS orchestration, tunnel/access profiles, routing policy, health checks, and telemetry. Legacy protocols remain isolated from the modern security boundary.

### Builders
Web and Android generators consume the same versioned API, authentication, component, workflow, and Socket SDK contracts as first-party applications.

## 4. Data Ownership

- PostgreSQL: transactional source of truth
- TimescaleDB: time-series metrics and network telemetry where appropriate
- Redis: cache, ephemeral coordination, and short-lived state; never the authoritative financial ledger
- Object storage: artifacts, exports, recordings, backups, and large immutable objects
- Audit store: append-oriented security and financial audit records

Applications must access domain data through service APIs or approved SDKs; direct UI-to-database access is prohibited.

## 5. Event Envelope

All cross-service events should carry a common envelope containing:

- event ID
- event type
- schema version
- occurred-at timestamp
- producer identity
- correlation ID
- causation ID when applicable
- tenant/domain scope where applicable
- payload

Consumers must be idempotent for retryable events.

## 6. Security Boundaries

- mTLS for infrastructure/service communication where applicable
- RBAC/ABAC at authorization boundaries
- secrets never embedded in source
- certificate rotation and revocation
- audit trail for privileged actions
- approval required for high-impact AI actions
- explicit payment authorization boundaries
- isolated handling for legacy/insecure access protocols
- dependency, container, and configuration security checks in CI

## 7. Production Readiness Gate

A module is **Production Ready** only after:

1. implementation exists in the repository;
2. API/database/event contracts are versioned;
3. tests pass;
4. security controls are applied;
5. health, metrics, and structured logs exist;
6. failure and retry behavior is defined;
7. backup/recovery implications are documented where stateful;
8. container/deployment configuration exists;
9. operational documentation exists;
10. an end-to-end validation path is available.

Architecture documents are not counted as implementation completion.
