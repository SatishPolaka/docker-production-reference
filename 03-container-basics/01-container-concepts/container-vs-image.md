# Container vs Image

A Docker image is a template. A container is an instance created from that image.

## Simple example

```bash
# Download an image
docker pull nginx:alpine

# Create and start a container from that image
docker run -d --name nginx-one nginx:alpine

# Create another container from the same image
docker run -d --name nginx-two nginx:alpine
```

Both containers use the same image, but they are separate container instances with independent runtime state and writable layers.

List them:

```bash
docker ps
```

Clean up:

```bash
docker rm -f nginx-one nginx-two
```

## Comparison

| Image | Container |
|---|---|
| Template | Instance |
| Immutable image layers | Image layers plus a container writable layer |
| Can be shared by many containers | Has its own name/ID and runtime state |
| Pulled or built | Created, started, stopped, and removed |

## Important point

A container is not an image, and stopping a container does not delete its image. Removing a container does not normally remove the image either.
