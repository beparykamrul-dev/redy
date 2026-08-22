# FTN Unified Enterprise Platform — Project Mindmap

## Root
**FTN Unified Enterprise Platform**

### 00 — FTN Kernel / Foundation
- FTN Kernel
- Hardware Abstraction
- Process / Service Manager
- Resource Scheduler
- Memory / CPU / Storage Manager
- Network Stack Integration
- Security Boundary
- IPC / Internal Socket
- Kernel Events
- Health / Watchdog
- Node Identity
- Configuration / Policy Runtime

### 01 — FTN Core / OS
- Main Node
- POP Node
- Client Node
- Backup Node
- Service Orchestrator
- Node Lifecycle
- HA / Failover

### 02 — Control Plane
- Unified Control Panel
- API Gateway
- Policy Engine
- Service Discovery
- Auto Balance
- Configuration Manager
- Approval Engine
- Workflow Orchestrator
- Secrets / Identity

### 03 — FTN Socket / Realtime Layer
- Socket Gateway
- WebSocket
- Internal TCP / Unix Socket
- Node ↔ Node
- Client ↔ Edge
- AI ↔ Control Plane
- Billing ↔ Gateway
- Call Center ↔ Customer / Agent
- Monitoring ↔ Control Plane
- Event Bus
- Connection Registry
- Heartbeat / Health Check
- Auto Reconnect / Backoff
- Backpressure
- Message Routing
- Request / Response
- Pub/Sub Events
- mTLS
- RBAC

### 04 — FTN AI Platform
- FTN AI Core
- AI Agent
- AI Network Operations
- AI Monitoring
- AI Diagnostics
- AI Automation
- AI Knowledge Base
- AI Workflow Engine
- AI Code Assistant
- AI Web App Builder Agent
- AI Android App Builder Agent
- AI Billing Agent
- AI Customer Support Agent
- AI Call Center Agent
- AI Approval Layer

### 05 — Web App Builder
- Visual App Builder
- Drag & Drop UI
- Page Builder
- Component Builder
- Form Builder
- Dashboard Builder
- API Connector
- Database Connector
- Socket Connector
- Authentication
- RBAC
- Workflow Builder
- AI → Web App Generation
- Preview
- Build
- Test
- Deploy
- Versioning

### 06 — Android App Builder
- Android Project Generator
- UI / Page Builder
- Component Library
- API Integration
- Socket Integration
- Authentication
- Push Notification
- Offline / Sync
- AI → Android App Generation
- APK / AAB Build
- Signing
- Version Management
- Deployment

### 07 — Billing & Payment Gateway
- FTN Billing Core
- Customer / Subscriber Management
- Packages / Plans
- Invoice Engine
- Recurring Billing
- Usage / Bandwidth Rating
- Due / Suspension / Reactivation
- Reseller Billing
- Employee / Commission Rules
- Payment Gateway Abstraction
- bKash Integration
- Nagad Integration
- Merchant / Paybill
- Payment Webhooks
- Transaction Reconciliation
- Refund / Adjustment
- Ledger
- Receipts
- Billing Notifications
- AI Billing Assistant
- AI Payment / Fraud Anomaly Detection
- Approval-required Financial Actions

### 08 — AI Call Center
- AI Call Center Core
- Voice / Telephony Gateway
- Call Routing
- IVR Integration
- Queue Management
- Agent Console
- AI Voice Agent
- Customer Identification
- Account / Billing Lookup
- Network Status Lookup
- Ticket Creation
- Troubleshooting Workflow
- Call Summary
- Transcript / Metadata
- Callback Workflow
- SMS / Notification Integration
- Human Handoff
- Approval / Escalation Policy
- Audit Log

### 09 — Network Platform
- MikroTik
- OLT / ONU
- PPPoE
- VLAN
- BGP
- NetFlow
- eBPF / XDP
- WireGuard
- Network Automation
- Auto Discovery
- Auto Provisioning

### 10 — DNS / Global Mesh
- PowerDNS
- CoreDNS
- Unbound
- dnsdist
- Anycast
- DNS Mesh
- DNS Provider Integrations
- DNS Health / Failover

### 11 — Unified Database Platform
- PostgreSQL
- TimescaleDB
- Redis
- Unified Database
- Object Storage
- Configuration Data
- Customer / Billing Data
- Network Inventory
- Metrics Data
- Event Data
- Audit Data
- AI Knowledge / Metadata
- Call Center Metadata
- Backup / Restore
- Replication
- Data Retention / Lifecycle

### 12 — Monitoring / Observability
- Prometheus
- Grafana
- Loki
- SNMP
- SmokePing
- Alertmanager
- NetFlow
- Node Metrics
- Kernel Metrics
- Socket Metrics
- Database Metrics
- Billing Metrics
- Payment Gateway Metrics
- Call Center Metrics
- AI Metrics
- AI Anomaly Detection
- SLO / SLA Monitoring
- Central Alerting

### 13 — FTN Applications
- FTN Connect
- FTN Tunnel
- IPTV
- Smart TV
- Customer App
- NOC App
- Billing App
- Support / Call Center App

### 14 — Portals
- Super Admin
- Admin
- Engineer
- Employee
- Reseller
- Partner
- User
- Call Center Agent
- Billing Operator

### 15 — Security
- mTLS / PKI
- TPM / HSM
- Post-Quantum Cryptography
- RBAC
- Secrets Management
- Audit Log
- Security Policy
- Payment Security Boundary
- AI Permission Boundary
- Approval-first Actions

### 16 — DevOps / Deployment
- Docker
- Kubernetes / K3s
- CI/CD
- Auto Deploy
- Health Checks
- HA / Failover
- Backup / Restore
- Rolling Updates
- Service Versioning

## Core Platform Relationships

FTN Kernel → FTN Core / OS → Control Plane → Socket / Event Fabric → Services

AI ↔ Control Plane ↔ Socket ↔ Network / Billing / Monitoring / Call Center

Web App Builder ↔ API + Socket + Unified Database

Android App Builder ↔ API + Socket + Unified Database

Billing Gateway ↔ Billing Core ↔ Payment Providers ↔ Unified Ledger

AI Call Center ↔ Telephony Gateway ↔ Socket ↔ Customer / Billing / Network / Ticketing

Monitoring → Metrics / Logs / Events → AI Diagnostics → Alerting → Approval-controlled Automation

Web + Android Builders share the same API, authentication, database, component, workflow, security, and Socket infrastructure.
