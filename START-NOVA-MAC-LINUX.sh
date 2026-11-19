#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
echo "Starting NOVA API on 127.0.0.1:8000"
python3 backend/server.py &
API_PID=$!
cleanup(){ kill "$API_PID" 2>/dev/null || true; }
trap cleanup EXIT INT TERM
echo "Starting web server on 127.0.0.1:5500"
python3 -m http.server 5500 --bind 127.0.0.1
