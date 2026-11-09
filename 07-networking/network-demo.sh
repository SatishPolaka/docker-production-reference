#!/usr/bin/env bash
set -euo pipefail
docker network create demo-net
docker run -d --name demo-web --network demo-net nginx:stable
docker run --rm --network demo-net busybox:1.36 wget -qO- http://demo-web
docker rm -f demo-web
docker network rm demo-net
