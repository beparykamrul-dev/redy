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
- Protocol Profile Manager

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
- DNS ↔ Control Plane
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
- AI DNS / Geo Routing Analysis
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
- Network Automation
- Auto Discovery
- Auto Provisioning

### 10 — FTN Secure Access / Tunnel Platform
- WireGuard — primary modern tunnel
- AmneziaWG — controlled WireGuard-compatible profile
- OpenVPN 3 — cross-platform VPN
- Hysteria2 — QUIC-based edge transport
- Shadowsocks — controlled proxy transport
- FTN Proxy Gateway
- Aether-Core — transport / policy orchestration layer
- GRE Tunnel — trusted network encapsulation
- SSLH Multiplexer — edge protocol multiplexer
- PPTP — legacy compatibility, isolated / deprecated
- Protocol Profile Manager
- Session Registry
- Route Policy
- Health / Failover
- Access Telemetry

### 11 — DNS / Global Mesh
- PowerDNS — authoritative / API-managed zones
- CoreDNS — service / cloud-native DNS
- Unbound — validating recursive resolver
- dnsdist — DNS traffic distribution / policy
- Hickory DNS — Rust authoritative / recursive DNS component
- Anycast
- Global DNS Mesh
- GeoIP-aware DNS policy
- Region / Country / ASN routing policy
- Health-based DNS failover
- DNS Provider Integrations
- DNSSEC
- DoT / DoH policy where supported
- DNS Health / Failover
- DNS Metrics / Query Logging

### 12 — GeoIP / Geo Routing Platform
- GeoIP Provider Abstraction
- Country / Region / City lookup
- ASN / Network lookup
- IPv4 / IPv6 support
- Local GeoIP cache
- Versioned GeoIP datasets
- Dataset integrity / provenance
- GeoIP API
- DNS Geo Steering
- POP selection
- CDN / Edge routing policy
- Failover-aware routing
- Privacy-aware retention
- AI-assisted routing analysis

### 13 — Unified Database Platform
- PostgreSQL
- TimescaleDB
- Redis
- Unified Database
- Object Storage
- Configuration Data
- Customer / Billing Data
- Network Inventory
- GeoIP Metadata / Dataset Version Metadata
- Metrics Data
- Event Data
- Audit Data
- AI Knowledge / Metadata
- Call Center Metadata
- Backup / Restore
- Replication
- Data Retention / Lifecycle

### 14 — Monitoring / Observability
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
- DNS Metrics
- Geo Routing Metrics
- Billing Metrics
- Payment Gateway Metrics
- Call Center Metrics
- VPN / Proxy Metrics
- Certificate / PKI Metrics
- AI Metrics
- AI Anomaly Detection
- SLO / SLA Monitoring
- Central Alerting

### 15 — FTN Applications
- FTN Connect
- FTN Tunnel
- IPTV
- Smart TV
- Customer App
- NOC App
- Billing App
- Support / Call Center App

### 16 — Portals
- Super Admin
- Admin
- Engineer
- Employee
- Reseller
- Partner
- User
- Call Center Agent
- Billing Operator

### 17 — Security / PKI
- Root CA
- Intermediate CA
- Node Certificates
- Service Certificates
- Client Certificates
- mTLS
- Certificate Rotation
- Revocation / Status
- TPM / HSM Integration
- Post-Quantum Cryptography
- RBAC
- Secrets Management
- Audit Log
- Security Policy
- Payment Security Boundary
- AI Permission Boundary
- Approval-first Actions

### 18 — DevOps / Deployment
- Docker
- Kubernetes / K3s
- CI/CD
- Auto Deploy
- Health Checks
- HA / Failover
- Backup / Restore
- Rolling Updates
- Service Versioning

### 19 — FTN Brand System
- Primary FTN Orbital Network Emblem
- FTN / Family Time Network Wordmark
- Blue + Electric Green + Metallic Silver visual system
- Dark Infrastructure UI
- Shared Web / Android Design System
- NOC / Monitoring Branding
- Billing / Call Center Branding
- Network Access Branding
- DNS / Geo Routing Branding
- Documentation Branding
- Logo clear-space / aspect-ratio rules

## Core Platform Relationships

FTN Kernel → FTN Core / OS → Control Plane → Socket / Event Fabric → Services

AI ↔ Control Plane ↔ Socket ↔ Network / Access / DNS / Geo Routing / Billing / Monitoring / Call Center

DNS Mesh ↔ dnsdist ↔ PowerDNS / CoreDNS / Unbound / Hickory DNS

GeoIP Engine → Geo Policy → DNS Steering → POP Selection → Health / Failover

Web App Builder ↔ API + Socket + Unified Database + Shared Brand System

Android App Builder ↔ API + Socket + Unified Database + Shared Brand System

Billing Gateway ↔ Billing Core ↔ Payment Providers ↔ Unified Ledger

AI Call Center ↔ Telephony Gateway ↔ Socket ↔ Customer / Billing / Network / Ticketing

Access Gateway ↔ Protocol Profiles ↔ Aether-Core Policy Layer ↔ FTN Core / POP Network

PKI ↔ Identity ↔ mTLS ↔ Control Plane ↔ Access / Services / Nodes

Monitoring → Metrics / Logs / Events → AI Diagnostics → Alerting → Approval-controlled Automation

Web + Android Builders share the same API, authentication, database, component, workflow, security, and Socket infrastructure.
