# Volume Permission Denied

Check host path ownership, container UID/GID, SELinux/AppArmor policy and read-only mount settings. Avoid `chmod 777`; assign the narrowest required ownership and permissions.

## First checks

```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker events --since 10m
```
