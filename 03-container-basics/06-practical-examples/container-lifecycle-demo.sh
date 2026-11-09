#!/usr/bin/env bash
# Demonstrate create, start, stop, restart, inspect, and remove.
# Run: bash container-lifecycle-demo.sh
# Uses a dedicated Alpine container. No host ports or volumes are created.

set -e

NAME="container-lifecycle-lab"
IMAGE="alpine:3.20"

echo "Pulling image if required..."
docker pull "$IMAGE"

echo "Removing any previous lab container..."
docker rm -f "$NAME" >/dev/null 2>&1 || true

echo "Creating container (not started yet)..."
docker create --name "$NAME" "$IMAGE" sh -c 'while true; do sleep 30; done'

echo "State after create:"
docker inspect --format '{{.State.Status}}' "$NAME"

echo "Starting container..."
docker start "$NAME"

echo "State after start:"
docker inspect --format '{{.State.Status}}' "$NAME"

echo "Showing process list:"
docker top "$NAME"

echo "Stopping container..."
docker stop "$NAME"

echo "State after stop:"
docker inspect --format '{{.State.Status}}' "$NAME"

echo "Starting it again..."
docker start "$NAME"

echo "Restarting it..."
docker restart "$NAME"

echo "Removing container..."
docker rm -f "$NAME"

echo "Lifecycle demo completed."
