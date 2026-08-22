# FTN Unified Enterprise Platform — Project Mindmap

## Root
**FTN Unified Enterprise Platform**

### 01 — FTN Core / OS
- Main Node
- POP Node
- Client Node
- Backup Node
- Service Orchestrator

### 02 — Control Plane
- Unified Control Panel
- API Gateway
- Policy Engine
- Service Discovery
- Auto Balance
- Configuration Manager
- Approval Engine

### 03 — FTN Socket / Realtime Layer
- Socket Gateway
- WebSocket
- Internal TCP / Unix Socket
- Node ↔ Node
- Client ↔ Edge
- AI ↔ Control Plane
- Event Bus
- Connection Registry
- Heartbeat / Health Check
- Auto Reconnect / Backoff
- Backpressure
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
- Authentication
- RBAC
- Workflow Builder
- AI → Web App Generation
- Preview
- Build
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

### 07 — Network Platform
- MikroTik
- OLT / ONU
- PPPoE
- VLAN
- BGP
- NetFlow
- eBPF / XDP
- WireGuard
- Network Automation

### 08 — DNS / Global Mesh
- PowerDNS
- CoreDNS
- Unbound
- dnsdist
- Anycast
- DNS Mesh
- DNS Provider Integrations

### 09 — Data Platform
- PostgreSQL
- TimescaleDB
- Redis
- Unified Database
- Object Storage
- Metrics
- Logs
- Events

### 10 — Monitoring / Observability
- Prometheus
- Grafana
- Loki
- SNMP
- SmokePing
- Alertmanager
- NetFlow
- AI Anomaly Detection

### 11 — FTN Applications
- FTN Connect
- FTN Tunnel
- IPTV
- Smart TV
- Customer App
- NOC App

### 12 — Portals
- Super Admin
- Admin
- Engineer
- Employee
- Reseller
- Partner
- User

### 13 — Security
- mTLS / PKI
- TPM / HSM
- Post-Quantum Cryptography
- RBAC
- Secrets Management
- Audit Log
- Security Policy

### 14 — DevOps / Deployment
- Docker
- Kubernetes / K3s
- CI/CD
- Auto Deploy
- Health Checks
- HA / Failover
- Backup / Restore

## Core Platform Relationship

FTN AI → Web App Builder → Android App Builder → FTN Socket → FTN API → Unified Database → Deployment

The Socket layer is the unified real-time communication fabric for node-to-node, control-plane, AI, monitoring, and client-facing realtime events. Web and Android builders share the same API, authentication, database, component, workflow, and Socket infrastructure.
