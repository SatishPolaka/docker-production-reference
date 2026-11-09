#!/usr/bin/env bash
set -euo pipefail
docker volume create demo-data
docker run --rm -v demo-data:/data busybox:1.36 sh -c 'echo "persistent sample" > /data/example.txt'
docker run --rm -v demo-data:/data busybox:1.36 cat /data/example.txt

# Remove the volume only after confirming the sample data is no longer needed.
# docker volume rm demo-data
