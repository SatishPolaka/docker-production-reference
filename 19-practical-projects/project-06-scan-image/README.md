# Project 06 — Scan an image with Trivy

```bash
trivy image --severity HIGH,CRITICAL local/web-demo:1.0
```

For CI failure on selected severities, add `--exit-code 1`. Agree on policy and exception handling with the security team.