# Docker Client

The Docker client is the interface used to send commands to the Docker Engine. The most common client is the `docker` command-line interface (CLI).

## What does the client do?

When you enter a command such as:

```bash
docker run -d --name web -p 8080:80 nginx:alpine
```

the CLI parses the command and sends a request to the Docker Engine API. The daemon performs or coordinates the requested operation and returns a result to the client.

The CLI is not itself the container runtime. It is the user-facing client.

## Common client commands

```bash
docker version
docker info
docker pull nginx:alpine
docker image ls
docker ps -a
docker run hello-world
```

## Client and daemon locations

The CLI and daemon often run on the same machine. They can also be separated: a client can connect to a remote Docker daemon through a configured Docker context or another supported connection.

Check the active context:

```bash
docker context ls
docker context show
```

Inspect the active context:

```bash
docker context inspect
```

Be careful when changing contexts. A command may affect a remote host rather than the local machine.

## Key points

- The CLI sends requests; the daemon manages Docker resources.
- `docker version` shows both client and server information when the Engine is reachable.
- A CLI installation alone does not mean a Docker Engine is running.
