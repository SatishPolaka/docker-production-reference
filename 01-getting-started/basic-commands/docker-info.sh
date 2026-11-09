#!/usr/bin/env bash
# Display Docker Engine information.
# Run: bash docker-info.sh
# Note: the Docker Engine must be running and your user must have permission.

set -e

echo "=== Docker Engine information ==="
docker info
