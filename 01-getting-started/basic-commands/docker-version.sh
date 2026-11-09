#!/usr/bin/env bash
# Display Docker CLI and Engine versions.
# Run: bash docker-version.sh

set -e

echo "=== Docker CLI version ==="
docker --version

echo
echo "=== Docker client and server versions ==="
docker version
