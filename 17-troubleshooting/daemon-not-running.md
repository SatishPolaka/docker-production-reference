# Daemon Not Running

On Linux, check `systemctl status docker` and `journalctl -u docker`. Check daemon configuration syntax, disk space, storage driver and recent changes.

## First checks

```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker events --since 10m
```
