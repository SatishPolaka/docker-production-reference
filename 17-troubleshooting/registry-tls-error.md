# Registry Tls Error

Check certificate validity, hostname, trust chain, system clock and proxy interception. Install the correct CA certificate. Do not disable TLS verification as a permanent workaround.

## First checks

```bash
docker ps -a
docker logs --tail 100 CONTAINER
docker inspect CONTAINER
docker events --since 10m
```
