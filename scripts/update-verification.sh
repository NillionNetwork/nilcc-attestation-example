#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$SCRIPT_DIR/.."
COMPOSE_FILE="$ROOT_DIR/docker-compose.yaml"
VERIFICATION_FILE="$ROOT_DIR/verification-manifest.json"

if command -v sha256sum >/dev/null 2>&1; then
  DOCKER_COMPOSE_HASH=$(sha256sum "$COMPOSE_FILE" | awk '{print $1}')
elif command -v shasum >/dev/null 2>&1; then
  DOCKER_COMPOSE_HASH=$(shasum -a 256 "$COMPOSE_FILE" | awk '{print $1}')
else
  echo "Error: neither sha256sum nor shasum is available" >&2
  exit 1
fi

VCPUS=${VCPUS:-1}
NILCC_VERSION=${NILCC_VERSION:-0.2.1}
MANIFEST_KEY=${MANIFEST_KEY:-$NILCC_VERSION}
ALLOWED_DOMAINS='["nilcc.nillion.com", "github.com", "nilcc-attestation-example.vercel.app"]'

MEASUREMENT_HASH=$(
  docker run -v/tmp/nilcc-verifier-cache:/tmp/nilcc-verifier-cache --rm \
    ghcr.io/nillionnetwork/nilcc-verifier:latest \
    measurement-hash "$DOCKER_COMPOSE_HASH" "$NILCC_VERSION" --vm-type cpu --cpus "$VCPUS" \
  | tr -d '\r\n'
)

jq -n \
  --arg key "$MANIFEST_KEY" \
  --arg version "$NILCC_VERSION" \
  --arg measurement "$MEASUREMENT_HASH" \
  --arg compose "$DOCKER_COMPOSE_HASH" \
  --argjson cpus "$VCPUS" \
  --argjson allowedDomains "$ALLOWED_DOMAINS" \
  '{($key): {measurement_hash: $measurement, docker_compose_hash: $compose, cpus: $cpus, nilcc_version: $version, allowedDomains: $allowedDomains}}' \
  > "$VERIFICATION_FILE"