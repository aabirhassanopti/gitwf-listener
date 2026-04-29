#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
LOG_FILE="${REPO_ROOT}/logs/activity.log"
ORIGINAL_CONTENT=$(cat "$LOG_FILE")

cleanup() {
  echo "$ORIGINAL_CONTENT" > "$LOG_FILE"
}
trap cleanup EXIT

bash "$SCRIPT_DIR/append-timestamp.sh" "2026-04-29T10:00:00Z" "repository_dispatch" "pat" "999"

LAST_LINE=$(tail -n 1 "$LOG_FILE")
EXPECTED="[2026-04-29T10:00:00Z] dispatch_type=repository_dispatch auth=pat run_id=999"

if [ "$LAST_LINE" = "$EXPECTED" ]; then
  echo "PASS: append-timestamp.sh wrote the correct line"
else
  echo "FAIL: expected:"
  echo "  $EXPECTED"
  echo "got:"
  echo "  $LAST_LINE"
  exit 1
fi
