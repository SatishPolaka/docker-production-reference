# Disk Space Full

Check `df -h`, `docker system df`, container logs and volume sizes. Identify the data owner before removing anything. Do not prune volumes or database data as a first response.

## First checks

```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker events --since 10m
```
