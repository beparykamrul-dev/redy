# FTN SiLK / Flow Collection Integration

## Supported flow formats

FTN flow ingestion supports adapters for IPFIX, NetFlow v5 and NetFlow v9. Collection is limited to FTN-owned or explicitly authorized exporters.

## Pipeline

```text
Router / Gateway
      |
 IPFIX / NetFlow v5/v9
      |
  rwflowpack / YAF adapter
      |
  SiLK / NetSA tooling
      |
  Flow normalization
      |
 ClickHouse + analytics
      |
 FTN AI / NOC
```

## SiLK ecosystem adapters

The integration boundary can accommodate NetSA/SiLK tooling, `certcc/SiLK`, `rwflowpack`, `netsa/lib/yaf`, `dpacketplugin`, and `cmusei/silk_analysis` where their licenses, build requirements and maintained versions permit. These are adapters/tools, not automatically vendored source code.

Perl and Python are supported for legacy analysis, glue automation and specialized analytics; new core control-plane logic should prefer the FTN supported backend languages.

## Platform compatibility

- Linux: primary production target
- OpenBSD: security/network edge compatibility target where supported
- Solaris: compatibility target for legacy collectors/tooling where supported
- Cygwin: development/legacy utility compatibility, not a primary production target

## Network transport adapters

- VXLAN: overlay/L2 extension use cases
- IPsec tunnel: standards-based encrypted site-to-site transport where required
- WireGuard/AmneziaWG: FTN mesh transport where policy permits

These transports remain separate from the flow analytics layer.

## Distribution and packaging

TurnKey-style appliance packaging may be used for reproducible deployment images. OpenRC is supported as an init integration for compatible environments; systemd remains the default on distributions where FTN targets it.

jsDelivr may be used only for public frontend/static assets where appropriate and where supply-chain pinning/integrity requirements are satisfied. It is not a backend dependency for critical control-plane operation.

## Operational rule

Flow collection, tunnel configuration and routing changes must be explicitly scoped to authorized FTN infrastructure. No provider's private traffic or internal telemetry is collected without authorization.
