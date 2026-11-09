# Verify Docker Installation

Use this checklist after installing Docker Desktop on Windows or Docker Engine on Ubuntu.

## 1. Check the Docker CLI

```bash
docker --version
```

This prints the installed Docker CLI version. It does not by itself prove that the Docker Engine is running.

## 2. Check client and server

```bash
docker version
```

A working connection normally shows both **Client** and **Server** sections. If the server section reports that it cannot connect, the Docker Engine may not be running or the client may be pointed at the wrong context.

## 3. Check Engine information

```bash
docker info
```

This displays information such as the server version, storage driver, runtime, and number of containers and images.

On Ubuntu, check the service:

```bash
sudo systemctl is-active docker
sudo systemctl status docker
```

Expected active state:

```text
active
```

On Windows, open Docker Desktop and confirm that it reports the engine is running.

## 4. Run the test image

```bash
docker run hello-world
```

Docker downloads the image if necessary, creates a container, runs the test program, and prints a success message.

## 5. Check the container result

```bash
docker ps
docker ps -a
```

`docker ps` lists running containers. `docker ps -a` also lists containers that have exited. The `hello-world` container normally exits after printing its message, so it may appear only in `docker ps -a`.

## 6. Check downloaded images

```bash
docker images
```

You should see the `hello-world` image after the test has run.

## Verification checklist

- [ ] `docker --version` displays a version.
- [ ] `docker version` shows the client and server.
- [ ] `docker info` returns Engine information.
- [ ] Docker Desktop or the Ubuntu Docker service is running.
- [ ] `docker run hello-world` completes successfully.
- [ ] `docker ps -a` shows the exited test container.

If any check fails, use [Common Docker errors](../troubleshooting/common-errors.md).
