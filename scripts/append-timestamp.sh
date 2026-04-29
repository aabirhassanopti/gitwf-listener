#!/usr/bin/env bash
set -euo pipefail

TIMESTAMP="$1"
DISPATCH_TYPE="$2"
AUTH_METHOD="$3"
RUN_ID="$4"

echo "[${TIMESTAMP}] dispatch_type=${DISPATCH_TYPE} auth=${AUTH_METHOD} run_id=${RUN_ID}" >> logs/activity.log
