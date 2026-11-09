#!/usr/bin/env bash
# Create, inspect, and remove a disposable Nginx container.
# Run: bash image-container-demo.sh
# Uses host port 8085 and a dedicated container name.
# If port 8085 is already in use, change HOST_PORT below.

set -e

CONTAINER_NAME="architecture-nginx-demo"
HOST_PORT="8085"
IMAGE="nginx:alpine"

cleanup() {
    echo
    echo "Cleaning up demo container..."
    docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
}
trap cleanup EXIT

echo "=== Pull image ==="
docker pull "$IMAGE"

echo
echo "=== Remove any previous demo container ==="
docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true

echo
echo "=== Run container ==="
docker run -d --name "$CONTAINER_NAME" -p "${HOST_PORT}:80" "$IMAGE"

echo
echo "=== Container status ==="
docker ps --filter "name=^/${CONTAINER_NAME}$"

echo
echo "=== Image history ==="
docker image history "$IMAGE"

echo
echo "=== Container configuration summary ==="
docker inspect --format 'Name: {{.Name}}
Image: {{.Config.Image}}
Status: {{.State.Status}}
Ports: {{json .NetworkSettings.Ports}}' "$CONTAINER_NAME"

echo
echo "Try opening http://localhost:${HOST_PORT}"
echo "The container will be removed automatically when this script exits."
