# Container Cannot Resolve Name

Check that both containers are attached to the same user-defined network. Use the Compose service name rather than a changing container IP. Check whether the service listens on its container port.

## First checks

```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker events --since 10m
```
