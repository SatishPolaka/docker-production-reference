#!/usr/bin/env bash
set -euo pipefail
: "${IMAGE:?Set IMAGE to the image reference to scan}"
trivy image --exit-code 1 --severity HIGH,CRITICAL "$IMAGE"
