#!/usr/bin/env bash
set -euo pipefail
IMAGE="${IMAGE:-local/demo-app}"
TAG="${TAG:-dev}"
docker build --pull -t "$IMAGE:$TAG" .
docker image inspect "$IMAGE:$TAG" --format='Image ID: {{.Id}}'
