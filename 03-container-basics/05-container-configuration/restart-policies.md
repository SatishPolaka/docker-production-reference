# Docker Container Restart Policies

A restart policy tells Docker whether to restart a container when it exits or when the Docker daemon restarts.

## Available policies

| Policy | Behaviour |
|---|---|
| `no` | Do not automatically restart the container. This is the default. |
| `on-failure` | Restart when the container exits with a non-zero exit code. |
| `always` | Always restart the container when it exits, subject to Docker's restart behaviour. |
| `unless-stopped` | Restart unless the container was explicitly stopped by the user or Docker control action. |

## Examples

No automatic restart (default):

```bash
docker run -d --name restart-no --restart no nginx:alpine
```

Restart on failure, with a maximum of five attempts:

```bash
docker run -d --name restart-failure --restart on-failure:5 alpine:3.20 sh -c 'exit 1'
```

Always restart:

```bash
docker run -d --name restart-always --restart always nginx:alpine
```

Unless stopped:

```bash
docker run -d --name restart-unless-stopped --restart unless-stopped nginx:alpine
```

## Inspect the policy

```bash
docker inspect --format '{{.HostConfig.RestartPolicy.Name}}' restart-unless-stopped
```

## Clean up

```bash
docker rm -f restart-no restart-failure restart-always restart-unless-stopped
```

## Important considerations

- A restart policy is not an application health check.
- A container can be running while the application inside it is unhealthy.
- Restart loops can hide an application configuration error; inspect logs and exit codes.
- For multi-host scheduling, desired-state management, and service recovery, use an appropriate orchestrator.
