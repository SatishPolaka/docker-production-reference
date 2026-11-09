#!/usr/bin/env bash
# Demonstrate the Docker CLI-to-daemon connection.
# Run: bash docker-client-daemon-demo.sh
# This script only reads Docker information; it does not create resources.

set -e

echo "=== Active Docker context ==="
docker context show

echo
echo "=== Docker client and server ==="
docker version

echo
echo "=== Docker Engine information (summary) ==="
docker info --format 'Server Version: {{.ServerVersion}}
Operating System: {{.OperatingSystem}}
Architecture: {{.Architecture}}
Containers: {{.Containers}}
Images: {{.Images}}'
