# Container Port Mapping

A container port is not automatically published on the host. Use `-p` to map a host port to a port inside the container.

## Run Nginx with a published port

```bash
docker run -d --name port-demo -p 8089:80 nginx:alpine
```

The syntax is:

```text
-p HOST_PORT:CONTAINER_PORT
```

In this example:

- Host port: `8089`
- Container port: `80`

Open:

```text
http://localhost:8089
```

## Inspect published ports

```bash
docker port port-demo
docker ps
```

## Bind to a specific host interface

To publish only on the local loopback interface:

```bash
docker run -d --name local-only-nginx -p 127.0.0.1:8090:80 nginx:alpine
```

This limits the published port to local connections on the host, subject to the host platform's networking behaviour.

## Clean up

```bash
docker rm -f port-demo local-only-nginx
```

## Security note

Publishing a port can make a service reachable beyond the host, depending on the bind address, firewall, and network configuration. Expose only the ports that are required.
