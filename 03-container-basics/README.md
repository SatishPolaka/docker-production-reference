# 03 – Container Basics

This section explains how to create, run, inspect, manage, and troubleshoot Docker containers. The examples use Nginx and Alpine Linux so you can practise the commands without building an application first.

> **Scope:** This section focuses on working with containers. Image creation and Dockerfiles are covered in `05-dockerfile/`; networking, volumes, Compose, security hardening, and resource management have dedicated sections later in this repository.

## Learning objectives

By completing this section, you should be able to:

- Explain what a container is and how it differs from an image.
- Create and run foreground and background containers.
- List, inspect, start, stop, restart, and remove containers.
- Execute commands inside a running container.
- Read container logs and view container processes.
- Map a host port to a container port.
- Pass environment variables to a container.
- Understand container exit codes and restart policies.
- Troubleshoot common container errors.

## Folder structure

```text
03-container-basics/
├── README.md
├── 01-container-concepts/
│   ├── container-vs-image.md
│   └── container-lifecycle.md
├── 02-running-containers/
│   ├── run-foreground-background.md
│   ├── run-nginx-container.md
│   └── run-alpine-container.md
├── 03-container-management/
│   ├── list-containers.md
│   ├── start-stop-restart-remove.md
│   └── rename-container.md
├── 04-container-inspection/
│   ├── inspect-container.md
│   ├── container-logs.md
│   ├── execute-command.md
│   └── container-processes-and-stats.md
├── 05-container-configuration/
│   ├── port-mapping.md
│   ├── environment-variables.md
│   └── restart-policies.md
├── 06-practical-examples/
│   ├── container-lifecycle-demo.sh
│   ├── nginx-container-demo.sh
│   └── inspect-running-container.sh
└── 07-troubleshooting/
    └── common-container-errors.md
```

## 1. What is a container?

A container is an isolated process created from an image. It runs the application or command defined by that image, with configuration such as environment variables, port mappings, mounts, and resource limits.

A container has its own writable layer, but it shares the host kernel. A container is not a lightweight virtual machine with a separate guest operating system.

## 2. Image vs container

| Image | Container |
|---|---|
| Read-only template | Created instance of an image |
| Used to create containers | Runs an application or command |
| Can be used to create many containers | Has its own runtime state and writable layer |
| Example: `nginx:alpine` | Example: `web-demo` |

## 3. Create and run containers

Run a simple test container:

```bash
docker run hello-world
```

Run an Alpine container interactively:

```bash
docker run -it --name alpine-lab alpine:3.20 sh
```

Inside the container, try:

```sh
cat /etc/os-release
hostname
exit
```

Run Nginx in the background:

```bash
docker run -d --name web-demo -p 8086:80 nginx:alpine
```

Open `http://localhost:8086` in your browser.

## 4. Container management commands

```bash
# List running containers
docker ps

# List all containers, including stopped ones
docker ps -a

# Stop a running container
docker stop web-demo

# Start an existing stopped container
docker start web-demo

# Restart a container
docker restart web-demo

# Remove a stopped container
docker rm web-demo

# Force-stop and remove a container (use intentionally)
docker rm -f web-demo
```

## 5. Inspect and troubleshoot containers

```bash
# View container configuration and state
docker inspect web-demo

# View logs
docker logs web-demo

# Follow logs continuously
docker logs -f web-demo

# Execute a command inside a running container
docker exec -it web-demo sh

# Show processes running in the container
docker top web-demo

# Show live resource usage
docker stats web-demo
```

Use `sh` rather than `bash` for minimal images that do not include Bash.

## 6. Configure containers

### Port mapping

```bash
docker run -d --name web-demo -p 8086:80 nginx:alpine
```

The format is `HOST_PORT:CONTAINER_PORT`. Here, host port 8086 forwards to port 80 inside the container.

### Environment variables

```bash
docker run --rm -e APP_ENV=development alpine:3.20 printenv APP_ENV
```

Do not put passwords or long-lived secrets directly in command history, README files, or source control. Use an appropriate secrets mechanism for sensitive values.

### Restart policy

```bash
docker run -d --name restart-demo --restart unless-stopped nginx:alpine
```

Restart policies are not a substitute for application health checks or an orchestrator. Read `05-container-configuration/restart-policies.md` for details.

## 7. Practical scripts

Run from this folder:

```bash
bash 06-practical-examples/container-lifecycle-demo.sh
bash 06-practical-examples/nginx-container-demo.sh
bash 06-practical-examples/inspect-running-container.sh
```

The scripts use dedicated demo container names. Read each script before running it. The Nginx demo uses host port 8087; change the variable in the script if that port is already occupied.

## 8. Recommended learning sequence

1. Read the container concepts.
2. Run the foreground and background examples.
3. Practise start, stop, restart, and remove operations.
4. Use `docker exec`, `docker logs`, and `docker inspect`.
5. Experiment with port mapping and environment variables.
6. Run the practical scripts.
7. Review the troubleshooting guide.

## Production considerations

- Use a trusted and controlled image version.
- Run only the process the container needs.
- Avoid storing important data only in the container writable layer.
- Do not expose ports unless required.
- Do not put credentials in command lines or image layers.
- Configure health checks, resource limits, logging, monitoring, and persistent storage according to the workload.
- Test restart behaviour; a restart policy alone does not guarantee application availability.

## Official documentation

- [Docker run](https://docs.docker.com/reference/cli/docker/container/run/)
- [Docker container commands](https://docs.docker.com/reference/cli/docker/container/)
- [docker exec](https://docs.docker.com/reference/cli/docker/container/exec/)
- [docker logs](https://docs.docker.com/reference/cli/docker/container/logs/)
- [Restart policies](https://docs.docker.com/engine/containers/start-containers-automatically/)
