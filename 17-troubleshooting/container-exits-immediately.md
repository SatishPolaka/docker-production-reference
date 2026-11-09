# Container Exits Immediately

Check `docker ps -a`, `docker logs CONTAINER` and `docker inspect CONTAINER`. Review the configured command, entrypoint, required environment, mounted files and exit code. A container stops when its main process exits.

## First checks

```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker events --since 10m
```
