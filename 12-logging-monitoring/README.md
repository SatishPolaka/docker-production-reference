# Logging and monitoring

Applications should write operational logs to stdout and stderr. Configure a log driver and rotation policy appropriate to the host. Centralise logs when required.

```bash
docker logs --tail 100 api-demo
docker logs --since 10m api-demo
docker stats
docker events --since 10m
docker system df
```

Monitor host disk, CPU, memory, restarts, health status, latency and application errors. Do not rely on `docker logs` as a long-term archive.