#!/usr/bin/env bash
set -euo pipefail
docker stack deploy -c 13-swarm/stack.yaml demo
docker stack services demo
docker service ps demo_web
