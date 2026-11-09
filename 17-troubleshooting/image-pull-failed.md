# Image Pull Failed

Check image name, tag, registry DNS, outbound connectivity, authentication, repository permissions and rate limits. Verify that the tag exists.

## First checks

```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker events --since 10m
```
