# Resource management

Set CPU and memory limits based on measured application requirements. Monitor throttling, OOM kills and latency.

```bash
docker run -d --name api-demo --memory=512m --cpus=1.5 nginx:stable
docker stats
docker inspect --format='{{.State.OOMKilled}}' api-demo
```

Restart policies do not replace health checks or orchestration. A health check reports status; it does not automatically repair a broken application.