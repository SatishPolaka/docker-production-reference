# Docker architecture

The Docker CLI sends requests to the Docker Engine API. The daemon manages images, containers, networks and volumes. The container runtime creates and runs isolated processes. Registries store and distribute images.

- Client: the `docker` command.
- Daemon: manages Docker objects.
- Image: read-only template made from filesystem layers and metadata.
- Container: created or running instance of an image.
- Registry: stores and distributes images.
- Volume: Docker-managed persistent storage.
- Network: connectivity between containers and external systems.

Access to the Docker daemon socket is highly privileged and should be restricted.