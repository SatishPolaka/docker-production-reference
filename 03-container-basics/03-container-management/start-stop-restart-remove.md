# Start, Stop, Restart, and Remove Containers

Create a container for this exercise:

```bash
docker run -d --name lifecycle-web nginx:alpine
```

## Stop a container

```bash
docker stop lifecycle-web
```

Docker sends the configured stop signal (normally SIGTERM), waits for the stop timeout, and then forcefully terminates the process if it has not exited.

## Start a stopped container

```bash
docker start lifecycle-web
```

## Restart a container

```bash
docker restart lifecycle-web
```

## Remove a stopped container

```bash
docker stop lifecycle-web
docker rm lifecycle-web
```

## Force-remove a container

```bash
docker rm -f lifecycle-web
```

This force-stops a running container and removes it. Use it only when that is the intended action.

## Verify the state

```bash
docker ps
docker ps -a
```

Removing a container does not automatically remove its image. Named volumes are also managed separately and are not removed by default.
