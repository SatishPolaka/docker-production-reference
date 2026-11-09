#!/usr/bin/env bash
# Inspect Docker Engine, images, and container information.
# Run: bash inspect-docker-components.sh [image] [container]
# Defaults: nginx:alpine and no container.
# This script is read-only.

set -e

IMAGE="${1:-nginx:alpine}"
CONTAINER="${2:-}"

echo "=== Docker version ==="
docker version

echo
echo "=== Docker Engine summary ==="
docker info

echo
echo "=== Local images ==="
docker image ls

echo
echo "=== Image metadata: ${IMAGE} ==="
if docker image inspect "$IMAGE" >/dev/null 2>&1; then
    docker image inspect "$IMAGE"
    echo
    echo "=== Image history: ${IMAGE} ==="
    docker image history "$IMAGE"
else
    echo "Image not found locally: ${IMAGE}"
    echo "Pull it first with: docker pull ${IMAGE}"
fi

if [ -n "$CONTAINER" ]; then
    echo
    echo "=== Container metadata: ${CONTAINER} ==="
    docker container inspect "$CONTAINER"
fi
