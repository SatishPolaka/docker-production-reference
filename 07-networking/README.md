# Container networking

Docker networks provide connectivity between containers and external systems. For most Compose applications, use a user-defined bridge so containers can discover each other by service name.

- Bridge: common default for standalone containers.
- User-defined bridge: container-name DNS and network isolation.
- Host: shares the host network namespace; port publishing is not used normally.
- None: disables normal network connectivity.
- Overlay: connects services across Swarm nodes.

```bash
docker network ls
docker network create app-net
docker network inspect app-net
docker network connect app-net web-demo
docker port web-demo
```

Publish only ports that need to be reachable outside the container network.