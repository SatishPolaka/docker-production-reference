# Inspect a Container

`docker inspect` returns detailed JSON information about a Docker object, including a container's configuration, state, network settings, mounts, and image reference.

## Create a test container

```bash
docker run -d --name inspect-demo nginx:alpine
```

## Inspect the full object

```bash
docker inspect inspect-demo
```

## Extract selected values

```bash
# Container state
docker inspect --format '{{.State.Status}}' inspect-demo

# Image reference
docker inspect --format '{{.Config.Image}}' inspect-demo

# Container IP address, when available
docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' inspect-demo
```

A container IP is generally for container-network communication and may not be directly reachable from every host or network. Prefer service names and the intended network design for application-to-application communication.

## Clean up

```bash
docker rm -f inspect-demo
```
