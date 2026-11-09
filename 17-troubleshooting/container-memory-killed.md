# Container Memory Killed

Check container state, `docker stats`, host memory and application memory use. Increase the limit only after measuring expected use. Look for leaks or unexpectedly large workloads.

## First checks

```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker events --since 10m
```
