# Commands and cleanup

```bash
docker ps -a
docker images
docker network ls
docker volume ls
docker stats
docker system df
docker container prune
docker image prune
docker builder prune
```

Prune commands remove unused objects. `docker system prune --volumes` can remove unused volumes and permanently delete data. Identify ownership and verify backups before cleanup on shared or production hosts.