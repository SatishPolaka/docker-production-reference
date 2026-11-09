#!/usr/bin/env bash
# Run and inspect a disposable Nginx container.
# Run: bash nginx-container-demo.sh
# Uses host port 8087. Change HOST_PORT if it is already in use.

set -e

NAME="container-basics-nginx"
HOST_PORT="8087"
IMAGE="nginx:alpine"

cleanup() {
    echo
    echo "Removing demo container..."
    docker rm -f "$NAME" >/dev/null 2>&1 || true
}
trap cleanup EXIT

docker pull "$IMAGE"
docker rm -f "$NAME" >/dev/null 2>&1 || true

echo "Starting Nginx..."
docker run -d --name "$NAME" -p "${HOST_PORT}:80" "$IMAGE"

echo "Container status:"
docker ps --filter "name=^/${NAME}$"

echo "Published port:"
docker port "$NAME"

echo "Container logs:"
docker logs --tail 20 "$NAME"

echo
echo "Open http://localhost:${HOST_PORT} in your browser."
echo "Press Enter here to stop and remove the demo container."
read -r _
