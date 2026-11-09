# Docker Engine

Docker Engine is the core platform used to build and run containers. It is commonly described through its client-server architecture.

## Main parts

- **Docker CLI:** The command-line client used by a person or automation.
- **Docker daemon (`dockerd`):** The background service that exposes the Engine API and manages Docker resources.
- **Docker Engine API:** The interface used by clients and tools to request operations.
- **Supporting runtime components:** Docker Engine works with components such as containerd to manage container execution.

The term **Docker Engine** describes the platform as a whole; it should not be treated as another separate process alongside `dockerd`, containerd, and runc.

## Example workflow

A user runs:

```bash
docker run -d --name web -p 8080:80 nginx:alpine
```

At a high level:

1. Docker CLI sends a request to the Engine API.
2. Docker daemon handles the request.
3. The image is located locally or pulled from a registry.
4. The daemon coordinates container creation with the runtime stack.
5. The container starts and the CLI receives the result.

See the architecture diagrams for the simplified flow.

## Inspect Engine information

```bash
docker version
docker info
```

`docker version` reports client and server version details. `docker info` reports Engine configuration and runtime information.
