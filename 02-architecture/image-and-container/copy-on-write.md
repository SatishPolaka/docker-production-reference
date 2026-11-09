# Copy-on-Write and the Container Writable Layer

Container images are made from read-only layers. When a container is created, the storage driver provides a writable layer for that container.

With copy-on-write behaviour, a file from a lower read-only layer can be copied into the container's writable layer when the container needs to modify it. The exact implementation depends on the storage driver and platform.

## Simplified concept

```text
Container
+-------------------------------+
| Writable container layer      |  <- Changes made by this container
+-------------------------------+
| Read-only image layer 3       |
+-------------------------------+
| Read-only image layer 2       |
+-------------------------------+
| Read-only image layer 1       |
+-------------------------------+
```

This is a conceptual view, not a diagram of every storage driver's internal implementation.

## What happens to changes?

- Changes made in the container's writable layer are associated with that container.
- Removing the container removes its writable layer.
- The underlying image layers remain unless separately removed.
- A named volume or bind mount stores data outside the container writable layer and can persist after container removal.

## Try inspecting storage usage

```bash
docker system df
docker ps -a
docker inspect <container-name>
```

## Important recommendation

Do not store important database files or user uploads only in a container writable layer. Use an appropriate volume or external storage service and plan backups.

Detailed volume configuration is covered in the repository's storage section.
