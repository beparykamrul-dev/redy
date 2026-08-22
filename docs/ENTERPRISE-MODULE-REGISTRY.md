# FTN Enterprise Module Registry

This registry defines the implementation order and ownership boundaries for the platform.

| Domain | Module | Primary boundary | Depends on |
|---|---|---|---|
| Foundation | Kernel Runtime | process/resource lifecycle | OS |
| Foundation | Node Runtime | node identity/lifecycle | Kernel |
| Platform | Identity | auth/RBAC/PKI | Kernel, DB |
| Platform | Control Plane | policy/config/orchestration | Identity, DB, Events |
| Platform | Socket Gateway | realtime transport/events | Identity, PKI |
| Data | Database | durable state | Storage |
| Data | Event Store | operational events | Database, Socket |
| Network | Network Adapter | router/OLT/device integration | Identity, Socket |
| Network | DNS Service | DNS orchestration | Control Plane, Network |
| Access | Tunnel Manager | protocol lifecycle/policy | Identity, Network, Socket |
| Billing | Billing Core | customers/plans/invoices/ledger | Identity, Database |
| Billing | Payment Gateway | provider adapters/webhooks | Billing Core, Security |
| AI | AI Core | inference/tool orchestration | Identity, Socket, Knowledge |
| AI | AI Policy | action authorization | Identity, Control Plane |
| AI | AI Billing | billing analysis/assistance | Billing, AI Core |
| Voice | Call Center | telephony/routing/agents | Identity, Socket |
| Voice | AI Call Center | support automation | Call Center, AI Core |
| Observability | Monitoring | metrics/logs/alerts | Socket, Database |
| Builders | Web Builder | web application generation | API, UI, Socket |
| Builders | Android Builder | Android generation/build | API, SDK, Socket |
| Apps | Admin | operations UI | Control Plane |
| Apps | Customer | customer services | Billing, Network, API |
| Apps | NOC | network operations | Monitoring, Network |

## Implementation Rule

Implement bottom-up along dependency boundaries. A higher-level module may consume a lower-level contract, but must not bypass its security, policy, database, or event boundary.

## Release Rule

Every module progresses through:

`Design → Contract → Implementation → Unit Test → Integration Test → Security Review → Observability → Deployment Test → Production Ready`

Documentation-only entries are architectural targets, not claims of completed implementation.
