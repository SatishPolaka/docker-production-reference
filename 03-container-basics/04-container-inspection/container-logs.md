# View Container Logs

Use `docker logs` to read the standard output and standard error captured for a container.

## Start a container

```bash
docker run -d --name logs-demo nginx:alpine
```

## View logs

```bash
docker logs logs-demo
```

Follow logs continuously:

```bash
docker logs -f logs-demo
```

Show the most recent 50 lines:

```bash
docker logs --tail 50 logs-demo
```

Show timestamps:

```bash
docker logs --timestamps logs-demo
```

Combine options:

```bash
docker logs --follow --tail 100 --timestamps logs-demo
```

Press `Ctrl+C` to stop following logs. This does not stop the container.

## Important note

`docker logs` displays what the container process writes to standard output and standard error, subject to the configured logging driver. Applications that write only to files inside the container may not show those file contents in `docker logs`.

## Clean up

```bash
docker rm -f logs-demo
```
