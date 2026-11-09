#!/usr/bin/env bash
# Common container lifecycle and inspection commands.
# This script uses a dedicated Nginx container name and host port 8082.
# Run: bash container-commands.sh
#
# It creates a container, prints its status/logs, then stops and removes it.
# It does not remove Docker images or volumes.

set -e

CONTAINER_NAME="getting-started-nginx"
HOST_PORT="8082"
IMAGE="nginx:alpine"

echo "1. Pull image (if it is not already local)"
docker pull "$IMAGE"

echo
echo "2. Remove an old container with the same name, if present"
if docker container inspect "$CONTAINER_NAME" >/dev/null 2>&1; then
    docker rm -f "$CONTAINER_NAME"
fi

echo
echo "3. Create and start the container"
docker run -d --name "$CONTAINER_NAME" -p "${HOST_PORT}:80" "$IMAGE"

echo
echo "4. Show running containers"
docker ps

echo
echo "5. Show container logs"
docker logs "$CONTAINER_NAME"

echo
echo "6. Inspect mapped ports"
docker port "$CONTAINER_NAME"

echo
echo "Open http://localhost:${HOST_PORT} in your browser."

echo
echo "7. Stop and remove the demo container"
docker stop "$CONTAINER_NAME"
docker rm "$CONTAINER_NAME"

echo
echo "Demo completed. The image remains available locally."
