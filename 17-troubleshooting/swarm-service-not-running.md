# Swarm Service Not Running

Use `docker service ps --no-trunc SERVICE`. Check node availability, image pull access, placement constraints, ports, secrets, resources and overlay network connectivity.

## First checks

```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker events --since 10m
```
