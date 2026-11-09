# Docker Client-Server Communication

Docker uses a client-server model. The CLI is a client of the Docker Engine API, and the daemon provides the API.

```mermaid
sequenceDiagram
    participant User
    participant CLI as Docker CLI
    participant API as Docker Engine API
    participant D as Docker daemon
    participant Runtime as containerd / OCI runtime

    User->>CLI: docker run nginx:alpine
    CLI->>API: Send container create/start request
    API->>D: Deliver API request
    D->>D: Check image and prepare configuration
    D->>Runtime: Coordinate container creation and start
    Runtime-->>D: Return execution result
    D-->>API: Return operation result
    API-->>CLI: Return response
    CLI-->>User: Display container ID or error
```

## Local communication

On many Linux systems, the CLI communicates with the daemon over a Unix socket:

```text
/var/run/docker.sock
```

The exact endpoint depends on the Docker context and configuration.

## Remote communication

A Docker client can connect to a remote daemon using a configured context and a secured transport. Remote daemon access must be protected with appropriate authentication, encryption, network controls, and least-privilege access.

## Inspect contexts

```bash
docker context ls
docker context show
docker context inspect
```

Before running commands, confirm that the active context points to the intended Docker host.
