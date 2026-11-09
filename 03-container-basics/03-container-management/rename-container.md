# Rename a Container

A container can be renamed without rebuilding its image.

## Create a container

```bash
docker run -d --name old-web-name nginx:alpine
```

## Rename it

```bash
docker rename old-web-name new-web-name
```

## Verify

```bash
docker ps
docker inspect --format '{{.Name}}' new-web-name
```

## Clean up

```bash
docker rm -f new-web-name
```

Renaming changes the container's name, not the image or application inside it. Check scripts, monitoring configuration, and automation that refer to the old name before renaming a container used by other workflows.
