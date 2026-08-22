#!/usr/bin/env bash
set -Eeuo pipefail

# FTN DNS installer template.
# This script is intentionally guarded: it does not overwrite existing DNS
# configuration unless --apply is explicitly supplied.

PROFILE=""
APPLY="false"
DRY_RUN="true"

usage() {
  cat <<'EOF'
Usage:
  ./install-dns.sh --profile <authoritative|recursive|edge|full> [--apply]

Profiles:
  authoritative  PowerDNS authoritative DNS
  recursive      Unbound recursive resolver
  edge           dnsdist edge/load-balancing layer
  full           PowerDNS + Unbound + dnsdist + CoreDNS integration template

Safety:
  Without --apply the script only validates the host and prints the planned
  package/service changes. Existing DNS configuration is never replaced by
  default.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile) PROFILE="${2:?missing profile}"; shift 2 ;;
    --apply) APPLY="true"; DRY_RUN="false"; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 2 ;;
  esac
done

case "$PROFILE" in
authoritative|recursive|edge|full) ;;
*) echo "Invalid or missing --profile" >&2; usage; exit 2 ;;
esac

if [[ "$(id -u)" -ne 0 ]]; then
  echo "Run as root (or through sudo)." >&2
  exit 1
fi

if [[ ! -r /etc/os-release ]]; then
  echo "Unsupported host: /etc/os-release not found." >&2
  exit 1
fi

. /etc/os-release
case "${ID:-}" in
debian|ubuntu) ;;
*) echo "This template currently targets Debian/Ubuntu. Detected: ${ID:-unknown}" >&2; exit 1 ;;
esac

export DEBIAN_FRONTEND=noninteractive

packages=()
case "$PROFILE" in
  authoritative) packages=(pdns-server pdns-backend-pgsql) ;;
  recursive) packages=(unbound) ;;
  edge) packages=(dnsdist) ;;
  full) packages=(pdns-server pdns-backend-pgsql unbound dnsdist coredns) ;;
esac

echo "FTN DNS profile: $PROFILE"
echo "OS: ${PRETTY_NAME:-$ID}"
echo "Planned packages: ${packages[*]}"

if [[ "$DRY_RUN" == "true" ]]; then
  echo "DRY RUN: no package installation or service changes performed."
  echo "Re-run with --apply after reviewing deploy/dns/dns-stack.template.yaml."
  exit 0
fi

apt-get update
apt-get install -y --no-install-recommends "${packages[@]}"

backup_dir="/var/backups/ftn-dns/$(date -u +%Y%m%dT%H%M%SZ)"
mkdir -p "$backup_dir"
for path in /etc/powerdns /etc/unbound /etc/dnsdist /etc/coredns; do
  if [[ -e "$path" ]]; then
    cp -a "$path" "$backup_dir/"
  fi
done

echo "Packages installed. Existing DNS configuration was backed up to: $backup_dir"
echo "Next: render and validate the selected service configuration, then enable services through the FTN Control Plane."
