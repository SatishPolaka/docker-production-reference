# Docker Daemon (`dockerd`)

The Docker daemon is the background service that provides the Docker Engine API and manages Docker objects.

## Main responsibilities

Depending on the requested operation and configuration, the daemon coordinates tasks such as:

- Building, pulling, and managing images.
- Creating and managing containers.
- Managing Docker networks and volumes.
- Exposing the Docker Engine API to clients.
- Coordinating with containerd for container lifecycle operations.

## Common commands

On Ubuntu systems using systemd:

```bash
sudo systemctl status docker
sudo systemctl start docker
sudo systemctl stop docker
sudo systemctl restart docker
```

Check whether the process is running:

```bash
ps -ef | grep '[d]ockerd'
```

View recent service logs:

```bash
sudo journalctl -u docker --since "15 minutes ago"
```

On Docker Desktop, the Engine is managed by Docker Desktop; do not assume the Linux systemd commands apply to the host operating system.

## Docker daemon configuration

On many Linux installations, daemon configuration is stored in:

```text
/etc/docker/daemon.json
```

Do not overwrite an existing configuration without reviewing it. Invalid JSON or unsupported options can prevent the daemon from starting. Back up the file and validate changes in a test environment.

## Security note

Control of a rootful Docker daemon is highly privileged. Restrict access to the Docker API and socket. Never expose an unauthenticated Docker API endpoint to an untrusted network.
