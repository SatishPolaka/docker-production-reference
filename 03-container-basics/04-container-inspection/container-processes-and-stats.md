# View Container Processes and Resource Usage

Docker provides commands to inspect processes and observe current resource usage.

## Start a test container

```bash
docker run -d --name stats-demo nginx:alpine
```

## View processes inside the container

```bash
docker top stats-demo
```

This displays processes associated with the container from the host's perspective.

## View live resource usage

```bash
docker stats stats-demo
```

Press `Ctrl+C` to stop the live display.

For a one-time snapshot:

```bash
docker stats --no-stream stats-demo
```

## View container metadata

```bash
docker inspect stats-demo
```

## Clean up

```bash
docker rm -f stats-demo
```

## Notes

- `docker stats` is an operational snapshot, not a full monitoring and alerting platform.
- Resource values vary with workload and host operating system.
- For production, use monitoring that retains history, provides alerts, and covers the host and application.
