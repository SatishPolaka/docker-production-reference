# Run Your First Docker Container – hello-world

The `hello-world` image is a small test image used to confirm that Docker can download an image and run a container.

## Step 1 – Run the container

```bash
docker run hello-world
```

What happens:

1. Docker checks whether the `hello-world` image exists locally.
2. If it is missing, Docker pulls it from the configured registry (normally Docker Hub).
3. Docker creates a container from the image.
4. The program inside the container prints a confirmation message.
5. The program exits, so the container stops.

## Step 2 – Understand the output

The exact output can vary, but it includes a message similar to:

```text
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

## Step 3 – Find the container

```bash
docker ps
```

The container may not appear because it has already exited.

List all containers:

```bash
docker ps -a
```

You should find a `hello-world` container with an `Exited` status.

## Step 4 – Find the image

```bash
docker images
```

You should see `hello-world` in the local image list.

## Step 5 – Run it again

```bash
docker run hello-world
```

Docker creates a new container from the local image. Running the same command again does not restart the previous container; it creates another container.

## Useful variation

Give the container a name:

```bash
docker run --name hello-test hello-world
```

If you run this command again while a container named `hello-test` still exists, Docker reports that the name is already in use. Remove the old container first:

```bash
docker rm hello-test
```

## Key learning

- An image is a template.
- A container is an instance created from an image.
- A container can stop after its main process exits.
- Stopped containers remain until they are removed.

## Exercise

Run `hello-world` twice, then use `docker ps -a` to compare the two container entries. Notice that the image is shared, but each run creates a separate container.
