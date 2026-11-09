# Docker Compose

Compose describes an application made of multiple services. It is useful for local development and integration tests. For multi-host production orchestration, compare platforms such as Kubernetes, Docker Swarm and managed container services.

```bash
docker compose config
docker compose up -d
docker compose ps
docker compose logs -f
docker compose exec web sh
docker compose down
```

`docker compose down -v` also removes declared named volumes. Use it only when deleting persistent data is intended. Keep real secrets outside Compose files and Git.