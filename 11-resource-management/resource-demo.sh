#!/usr/bin/env bash
set -euo pipefail
docker run -d --name limited-web \
  --memory=256m \                           # Maximum memory for this container
  --cpus=1.0 \                              # CPU quota equivalent to one CPU
  --pids-limit=200 \                        # Limit process/thread count
  --restart unless-stopped \                # Restart unless explicitly stopped
  nginx:stable
docker stats limited-web
