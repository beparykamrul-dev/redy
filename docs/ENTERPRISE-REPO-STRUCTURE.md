# Enterprise Repository Structure

```text
redy/
├── apps/
│   ├── web/
│   ├── android/
│   ├── admin/
│   ├── customer/
│   └── call-center/
├── builders/
│   ├── web-builder/
│   └── android-builder/
├── cmd/
│   ├── redy-server/
│   ├── redy-node/
│   └── redy-worker/
├── kernel/
│   ├── runtime/
│   ├── scheduler/
│   ├── ipc/
│   ├── resources/
│   └── security/
├── services/
│   ├── control-plane/
│   ├── socket-gateway/
│   ├── api-gateway/
│   ├── ai-core/
│   ├── ai-billing/
│   ├── ai-call-center/
│   ├── billing/
│   ├── payment-gateway/
│   ├── network/
│   ├── dns/
│   ├── monitoring/
│   ├── notifications/
│   └── identity/
├── packages/
│   ├── api-contracts/
│   ├── socket-sdk/
│   ├── auth-sdk/
│   ├── database/
│   ├── events/
│   ├── telemetry/
│   └── ui/
├── database/
│   ├── migrations/
│   ├── schemas/
│   ├── seeds/
│   └── backup/
├── deploy/
│   ├── docker/
│   ├── k8s/
│   ├── systemd/
│   └── ci/
├── monitoring/
│   ├── prometheus/
│   ├── grafana/
│   ├── loki/
│   └── alerts/
├── security/
│   ├── pki/
│   ├── policies/
│   └── audit/
├── tests/
│   ├── unit/
│   ├── integration/
│   ├── contract/
│   ├── e2e/
│   ├── load/
│   └── recovery/
├── docs/
└── scripts/
```

## Dependency Direction

`apps → builders/packages → services → packages → database/kernel`

Infrastructure adapters remain behind service interfaces. UI applications do not access the database directly. Financial actions and infrastructure-changing AI actions pass through policy and approval boundaries.

## Production Gate

Each service must have: configuration contract, health endpoint, structured logs, metrics, authentication/authorization, error handling, tests, migration compatibility, container/deployment definition, and operational documentation before being marked production-ready.
