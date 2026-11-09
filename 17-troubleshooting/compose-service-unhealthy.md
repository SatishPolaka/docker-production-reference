# Compose Service Unhealthy

Inspect `docker compose ps` and health status. Confirm the health check command exists in the image and tests the correct endpoint. Check startup time and application logs.

## First checks

```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker events --since 10m
```
