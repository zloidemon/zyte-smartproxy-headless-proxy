#!/bin/sh
set -eu

PROJECT_DIR="$(git rev-parse --show-toplevel)"
CA_FILE="${PROJECT_DIR}/ca.crt"
PRIV_FILE="${PROJECT_DIR}/private-key.pem"
OUTPUT_FILE="${PROJECT_DIR}/proxy/certs.go"

cat > "$OUTPUT_FILE" <<EOF
package proxy
// autogenerated by $(basename "$0") on $(date -Ru)

// DefaultCertCA is hardcoded TLS CA certificate
var DefaultCertCA = []byte(\`$(cat "$CA_FILE")\`)

// DefaultPrivateKey is hardcoded TLS private key
var DefaultPrivateKey = []byte(\`$(cat "$PRIV_FILE")\`)
EOF
