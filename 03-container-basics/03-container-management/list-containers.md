# List Docker Containers

Use `docker ps` to list running containers.

## Common commands

```bash
# Running containers
docker ps

# All containers, including stopped ones
docker ps -a

# Only container IDs
docker ps -q

# Only running container IDs
docker ps -q --filter status=running

# Show the latest created container
docker ps -l

# Show containers matching a name
docker ps --filter name=nginx
```

## Useful formatted output

```bash
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
```

## Understand the columns

| Column | Meaning |
|---|---|
| CONTAINER ID | Short container identifier |
| IMAGE | Image used to create the container |
| COMMAND | Main command configured for the container |
| CREATED | Time since container creation |
| STATUS | Current state and, where relevant, uptime |
| PORTS | Published or exposed port information |
| NAMES | Container name |

`docker ps` is a quick operational check. Use `docker inspect` when you need detailed configuration or state information.
