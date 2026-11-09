#!/usr/bin/env bash
set -euo pipefail
docker run -d --name log-demo \
  --log-driver json-file \                  # Use Docker's local JSON log driver
  --log-opt max-size=10m \                  # Rotate each log file at 10 MB
  --log-opt max-file=3 \                    # Keep at most three rotated files
  busybox:1.36 sh -c 'while true; do date; sleep 5; done'
docker logs --tail 20 log-demo
docker stats log-demo
