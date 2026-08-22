# REDY — FTN Enterprise Platform

REDY is the enterprise platform foundation for the FTN ecosystem.

## Architecture

- FTN Kernel / Foundation
- FTN Core / OS and node lifecycle
- Unified Control Plane
- Central Socket / Realtime Event Fabric
- AI Platform and approval-controlled automation
- Web App Builder
- Android App Builder
- ISP Network Automation
- DNS / Global Mesh
- Billing and Payment Gateway
- AI Billing
- AI Call Center
- Unified Database
- Monitoring / Observability
- Security / PKI / RBAC / Audit
- Docker / K3s / CI/CD / HA deployment

## Design Principles

1. Production-oriented architecture; no placeholder business logic presented as finished functionality.
2. Centralized APIs, identity, policy, events, and database contracts.
3. Socket is the realtime/event transport layer, not an isolated UI feature.
4. AI actions are approval-controlled where they can affect infrastructure, billing, payments, or customers.
5. Billing and payment operations require auditable transaction and ledger boundaries.
6. Monitoring covers kernel, services, network, database, socket, AI, billing, and call-center health.
7. Web and Android builders reuse the same API, authentication, component, workflow, and socket contracts.
8. Every production service must expose health, metrics, structured logs, configuration, and secure lifecycle controls.

## Project Map

See [`docs/FTN-PROJECT-MINDMAP.md`](docs/FTN-PROJECT-MINDMAP.md).

## Enterprise Completion Tracks

- Foundation and kernel contracts
- Service and repository boundaries
- Database schema and migrations
- API and Socket contracts
- Authentication / authorization / audit
- Network, DNS, billing, and call-center service contracts
- AI orchestration and approval policies
- Web / Android builder pipelines
- Monitoring and SLOs
- Automated tests and CI
- Containerization and deployment
- Backup, recovery, HA, and operational runbooks

## Status

Architecture baseline established. Implementation should proceed module-by-module with tests, security review, observability, and deployment validation before a component is considered production-ready.
