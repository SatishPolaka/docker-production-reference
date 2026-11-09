#!/usr/bin/env bash
# Inspect a named running container.
# Run: bash inspect-running-container.sh [container-name]
# Default name: container-basics-inspect
# Creates a temporary Nginx container only if the requested one is absent.

set -e

NAME="${1:-container-basics-inspect}"
CREATED_BY_SCRIPT="false"

if ! docker container inspect "$NAME" >/dev/null 2>&1; then
    echo "Container '$NAME' does not exist. Creating a temporary Nginx container..."
    docker run -d --name "$NAME" nginx:alpine
    CREATED_BY_SCRIPT="true"
fi

cleanup() {
    if [ "$CREATED_BY_SCRIPT" = "true" ]; then
        echo
        echo "Removing temporary container..."
        docker rm -f "$NAME" >/dev/null 2>&1 || true
    fi
}
trap cleanup EXIT

if [ "$(docker inspect --format '{{.State.Running}}' "$NAME")" != "true" ]; then
    echo "Container '$NAME' exists but is not running. Start it before using docker exec."
    docker inspect --format 'Status: {{.State.Status}}' "$NAME"
    exit 1
fi

echo "=== Status ==="
docker inspect --format 'Name: {{.Name}}
Image: {{.Config.Image}}
Status: {{.State.Status}}
Started: {{.State.StartedAt}}' "$NAME"

echo
echo "=== Processes ==="
docker top "$NAME"

echo
echo "=== Resource usage snapshot ==="
docker stats --no-stream "$NAME"

echo
echo "=== Recent logs ==="
docker logs --tail 20 "$NAME"
