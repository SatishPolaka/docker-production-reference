# 02 – Docker Architecture

This section explains how Docker components work together when you build an image, pull an image, or run a container. It combines architecture concepts, diagrams, command-line inspection, and small practical exercises.

> **Scope:** This is a conceptual guide to the common Docker Engine architecture. Exact implementation details can vary by Docker Engine version, operating system, and deployment mode.

## Learning objectives

After completing this section, you should be able to:

- Explain the Docker client-server architecture.
- Describe the roles of Docker CLI, Docker daemon, Docker Engine, containerd, and runc.
- Explain how an image is pulled and a container is started.
- Understand image layers and the container writable layer.
- Inspect Docker images, containers, and daemon information.
- Explain why access to the Docker socket is security-sensitive.

## Folder structure

```text
02-architecture/
├── README.md
├── components/
│   ├── docker-client.md
│   ├── docker-daemon.md
│   ├── docker-engine.md
│   ├── containerd.md
│   ├── runc.md
│   └── docker-registry.md
├── architecture-diagrams/
│   ├── docker-architecture.md
│   ├── image-to-container-flow.md
│   └── docker-client-server-communication.md
├── image-and-container/
│   ├── docker-image-layers.md
│   ├── container-lifecycle.md
│   └── copy-on-write.md
├── practical-examples/
│   ├── docker-client-daemon-demo.sh
│   ├── inspect-docker-components.sh
│   └── image-container-demo.sh
└── security/
    └── docker-socket-security.md
```

## 1. Docker architecture overview

Docker commonly uses a client-server architecture:

- **Docker CLI:** The command-line client through which a user runs commands such as `docker build`, `docker pull`, and `docker run`.
- **Docker daemon (`dockerd`):** A background service that exposes the Docker Engine API and manages Docker objects such as images, containers, networks, and volumes.
- **Docker Engine API:** The API used by clients and other tools to communicate with the daemon.
- **containerd:** A container runtime component that manages container lifecycle operations and image-related operations.
- **runc:** A low-level OCI runtime commonly used by containerd to create and run containers.
- **Registry:** A service used to store and distribute container images, for example Docker Hub or a private registry.

The Docker CLI and daemon may run on the same machine or communicate remotely. On Windows with Docker Desktop, the Linux Engine commonly runs in a managed Linux environment.

## 2. Component reference

| Component | Main responsibility |
|---|---|
| Docker CLI | Accepts commands from the user and sends API requests. |
| Docker daemon (`dockerd`) | Provides the Docker Engine API and manages Docker resources. |
| Docker Engine | The overall Docker platform/service, including the daemon, API, and supporting components. |
| containerd | Manages container lifecycle and image transfer/unpacking tasks. |
| runc | Creates and runs containers according to OCI runtime specifications. |
| Registry | Stores and distributes images. |

Read the detailed notes in `components/`.

## 3. Architecture diagrams

- [Docker architecture](architecture-diagrams/docker-architecture.md)
- [Image-to-container flow](architecture-diagrams/image-to-container-flow.md)
- [Client-server communication](architecture-diagrams/docker-client-server-communication.md)

These diagrams are simplified learning diagrams, not exhaustive process or API traces.

## 4. Image and container concepts

- [Docker image layers](image-and-container/docker-image-layers.md)
- [Container lifecycle](image-and-container/container-lifecycle.md)
- [Copy-on-Write](image-and-container/copy-on-write.md)

An image is a collection of read-only layers. A container created from an image normally adds a writable layer on top. Data that must survive container removal should be stored in a volume or another persistent storage service, not only in the container writable layer.

## 5. Practical inspection commands

```bash
# Show Docker client and Engine/server versions
docker version

# Show daemon and Engine configuration
docker info

# List local images
docker image ls

# Show how an image was built, layer by layer
docker image history nginx:alpine

# Inspect image metadata
docker image inspect nginx:alpine

# List all containers, including stopped containers
docker ps -a

# Inspect container configuration
docker container inspect <container-name>

# Show Docker disk usage
docker system df
```

Replace `<container-name>` with an actual container name or ID.

## 6. Practical scripts

Run scripts from this directory:

```bash
bash practical-examples/docker-client-daemon-demo.sh
bash practical-examples/inspect-docker-components.sh
bash practical-examples/image-container-demo.sh
```

The scripts are intended for a local learning environment. The image/container demo creates and removes a specifically named test container.

## 7. Security: Docker socket

On many Linux installations, the Docker CLI communicates with the daemon through `/var/run/docker.sock`. Access to this socket is highly privileged. A user who can control a rootful Docker daemon can commonly obtain root-level control of the host.

Read [Docker socket security](security/docker-socket-security.md) before mounting the socket into a container or granting users access to it.

## 8. Recommended learning sequence

1. Read the component descriptions.
2. Study the three architecture diagrams.
3. Learn image layers and container lifecycle.
4. Run the practical scripts.
5. Review Docker socket security.

## Official documentation

- [Docker architecture overview](https://docs.docker.com/get-started/docker-overview/)
- [Docker Engine](https://docs.docker.com/engine/)
- [Docker Engine API](https://docs.docker.com/reference/api/engine/)
- [containerd documentation](https://containerd.io/docs/)
- [Open Container Initiative runtime specification](https://github.com/opencontainers/runtime-spec)
- [Docker security](https://docs.docker.com/engine/security/)
