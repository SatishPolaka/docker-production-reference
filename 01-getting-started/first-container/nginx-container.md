# Run an Nginx Web Server in a Docker Container

In this exercise, you will run Nginx in a container and access its default web page from your browser.

## Prerequisites

- Docker Engine or Docker Desktop is running.
- Your machine can pull images from the configured registry.
- Host port `8080` is not already in use.

## Step 1 – Pull the Nginx image (optional)

```bash
docker pull nginx:alpine
```

The `alpine` tag is a lightweight Nginx image variant. For repeatable or production deployments, select and pin an approved image version or digest rather than relying on a moving tag.

## Step 2 – Create and run the container

```bash
docker run -d --name my-nginx -p 8080:80 nginx:alpine
```

Command explanation:

| Part | Meaning |
|---|---|
| `docker run` | Create and start a new container. |
| `-d` | Run in detached/background mode. |
| `--name my-nginx` | Assign a readable container name. |
| `-p 8080:80` | Map host port 8080 to container port 80. |
| `nginx:alpine` | Image and tag used to create the container. |

## Step 3 – Check the container

```bash
docker ps
```

Confirm that `my-nginx` is running and that the port mapping includes `0.0.0.0:8080->80/tcp` or an equivalent host binding.

## Step 4 – Open the website

On the Docker host, open:

```text
http://localhost:8080
```

You should see the default Nginx welcome page.

You can also test from a terminal:

```bash
curl http://localhost:8080
```

On Windows PowerShell, `curl` may be an alias; use `curl.exe http://localhost:8080` if needed.

## Step 5 – View logs

```bash
docker logs my-nginx
```

Follow new log entries:

```bash
docker logs -f my-nginx
```

Press `Ctrl+C` to stop following logs. This does not stop the container.

## Step 6 – Inspect the container

```bash
docker inspect my-nginx
```

For a compact status check:

```bash
docker container ls
```

## Step 7 – Stop, start, and remove

```bash
docker stop my-nginx
docker start my-nginx
docker restart my-nginx
```

Remove it when finished:

```bash
docker stop my-nginx
docker rm my-nginx
```

If it is already stopped, only `docker rm my-nginx` is needed.

## Troubleshooting

### Port 8080 is already allocated

Choose another host port, for example 8081:

```bash
docker run -d --name my-nginx -p 8081:80 nginx:alpine
```

Then open `http://localhost:8081`. If the name `my-nginx` is already in use, remove the previous container or choose a different name.

### Container exits immediately

Check its status and logs:

```bash
docker ps -a
docker logs my-nginx
```

### Browser cannot connect

- Confirm Docker is running.
- Confirm the container is running with `docker ps`.
- Confirm the host-to-container port mapping.
- Check local firewall or security software.
- Use the correct host port in the browser.

## Exercise

Run a second Nginx container named `nginx-test` using host port `8081`. Confirm that both web pages can be reached at ports 8080 and 8081. Remove both containers when finished.

## Production note

This is a local learning example. A production web service also needs a controlled image version, TLS termination, security hardening, resource limits, health monitoring, logging, and an appropriate deployment strategy.
