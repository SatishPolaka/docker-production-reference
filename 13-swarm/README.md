# Docker Swarm

Swarm is Docker Engine's native cluster orchestration mode. It provides services, replica counts, overlay networking, rolling updates, secrets and placement constraints.

```bash
docker swarm init
docker node ls
docker service create --name web --replicas 3 -p 8080:80 nginx:stable
docker service ls
docker service ps web
docker service scale web=5
docker service rm web
```

Protect manager nodes and join tokens. Plan quorum, node maintenance, registry access, secrets, backups and monitoring. Compare Swarm with Kubernetes and managed container services before choosing a platform for a new system.