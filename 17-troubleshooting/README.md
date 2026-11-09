# Troubleshooting

Start with container state, exit code and first meaningful application error. Check image, entrypoint, environment, permissions, network, storage and host daemon.

```bash
docker ps -a
docker logs --tail 200 CONTAINER
docker inspect CONTAINER
docker stats
docker events --since 15m
docker system df
```

Redact credentials, tokens, private hostnames and customer data before sharing logs.