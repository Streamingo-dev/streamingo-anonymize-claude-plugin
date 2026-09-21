#!/usr/bin/env bash
# Asserts a URL is a live MCP endpoint whose OAuth discovery chain resolves.
# Usage: scripts/check-endpoint.sh https://host/mcp/mcp
set -uo pipefail

URL="${1:?usage: check-endpoint.sh <mcp-url>}"
fail() { echo "FAIL: $*" >&2; exit 1; }

# 1. An unauthenticated initialize must return 401 with a WWW-Authenticate header.
headers=$(curl -sS -i -m 15 -X POST "$URL" \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json, text/event-stream' \
  -d '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"smoke","version":"0"}}}' \
  2>&1) || fail "no response from $URL ($headers)"

grep -qi '^HTTP/[0-9.]* 401' <<<"$headers" \
  || fail "expected 401 from $URL, got: $(grep -i '^HTTP/' <<<"$headers" | head -1)"

# 2. The 401 must name its protected-resource metadata.
prm=$(grep -io 'resource_metadata="[^"]*"' <<<"$headers" | head -1 | cut -d'"' -f2)
[ -n "$prm" ] || fail "401 carried no resource_metadata in WWW-Authenticate"

# 3. That metadata must resolve and name an authorization server.
prm_body=$(curl -sS -m 15 "$prm") || fail "resource metadata unreachable: $prm"
as=$(grep -o '"authorization_servers":\["[^"]*"' <<<"$prm_body" | cut -d'"' -f4)
[ -n "$as" ] || fail "resource metadata listed no authorization_servers: $prm_body"

# 4. The authorization server must publish metadata with a registration endpoint,
#    which is what lets Claude clients register themselves during login.
as_body=$(curl -fsS -m 15 "${as%/}/.well-known/oauth-authorization-server" \
  || curl -fsS -m 15 "$(dirname "${as%/}")/.well-known/oauth-authorization-server/$(basename "$as")") \
  || fail "authorization server metadata unreachable for $as"
grep -q '"registration_endpoint"' <<<"$as_body" \
  || fail "authorization server advertises no registration_endpoint: $as_body"

echo "OK: $URL is live, PRM=$prm AS=$as"
