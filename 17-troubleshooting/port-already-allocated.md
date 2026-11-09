# Port Already Allocated

Check `docker ps` and host processes listening on the requested port. Choose an unused host port or stop the service that owns it. The mapping is HOST_PORT:CONTAINER_PORT.

## First checks

```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker events --since 10m
```
