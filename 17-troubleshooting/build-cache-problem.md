# Build Cache Problem

Inspect Dockerfile layer order and build context. Use `--no-cache` only to diagnose a suspected cache issue. Check whether required files are excluded by `.dockerignore`.

## First checks

```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker events --since 10m
```
