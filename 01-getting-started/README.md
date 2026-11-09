# 01 – Getting Started with Docker

This section introduces Docker, explains the basic terminology, guides you through installation, and helps you run your first containers.

> **Scope:** This folder covers the fundamentals. Detailed Docker architecture, Dockerfiles, networking, volumes, Compose, security, and CI/CD are covered in later sections of this repository.

## Learning objectives

By the end of this section, you should be able to:

- Explain what Docker is and why teams use containers.
- Understand the difference between an image and a container.
- Install Docker Desktop on Windows or Docker Engine on Ubuntu.
- Verify that the Docker client and engine are working.
- Run the `hello-world` and Nginx containers.
- Use basic commands to inspect, stop, start, and remove containers.
- Recognise common first-time Docker errors.

## Folder structure

```text
01-getting-started/
├── README.md
├── installation/
│   ├── windows-installation.md
│   ├── ubuntu-installation.md
│   └── verify-installation.md
├── first-container/
│   ├── hello-world.md
│   └── nginx-container.md
├── basic-commands/
│   ├── docker-version.sh
│   ├── docker-info.sh
│   └── container-commands.sh
└── troubleshooting/
    └── common-errors.md
```

## Recommended learning order

1. Read [What is Docker?](#what-is-docker).
2. Install Docker using the guide for your operating system:
   - [Windows installation](installation/windows-installation.md)
   - [Ubuntu installation](installation/ubuntu-installation.md)
3. [Verify the installation](installation/verify-installation.md).
4. Run your [first `hello-world` container](first-container/hello-world.md).
5. Run an [Nginx web server](first-container/nginx-container.md).
6. Practise the scripts in `basic-commands/`.
7. Refer to [common errors](troubleshooting/common-errors.md) when needed.

## What is Docker?

Docker is a platform for building, packaging, distributing, and running applications in containers. A container packages an application and its required runtime dependencies so it can run consistently across supported environments.

For example, a Python application may need a particular Python version and set of libraries. A Docker image can package those dependencies with the application, reducing differences between a developer's laptop, a test environment, and a server.

Docker containers share the host operating system's kernel. They are generally lighter and start faster than full virtual machines, but they are not the same as virtual machines and do not provide an identical isolation boundary.

## Why use Docker?

Without a consistent runtime environment, an application may work on one machine but fail on another because of differences in operating system packages, runtime versions, or dependencies.

Docker helps teams:

- Package applications with their runtime dependencies.
- Run multiple isolated application environments on one host.
- Use consistent images across development, testing, and deployment.
- Scale application instances more easily.
- Automate build and deployment workflows.
- Reduce environment-related deployment surprises.

Docker does not automatically make an application highly available, secure, or production-ready. Those outcomes require appropriate architecture, configuration, monitoring, access control, and operational practices.

## Common Docker terminology

| Term | Meaning |
|---|---|
| Docker Engine | The software that builds and runs containers on a host. |
| Docker client | The `docker` command-line interface used to send requests to the Engine. |
| Image | A read-only template used to create containers. |
| Container | A runnable instance of an image. |
| Registry | A service that stores and distributes images, such as Docker Hub or a private registry. |
| Dockerfile | A text file containing instructions to build an image. |
| Volume | Docker-managed storage that can persist data beyond a container's lifecycle. |
| Port mapping | A rule that forwards traffic from a host port to a container port. |

## Docker image vs container

Think of an image as the application template and a container as an instance created from that template.

| Image | Container |
|---|---|
| Template used to create containers | Running or stopped instance of an image |
| Usually built or pulled from a registry | Created with `docker run` or related commands |
| Read-only image layers | Adds a writable container layer |
| Example: `nginx:alpine` | Example: `my-nginx` |

## Docker vs virtual machines

| Docker container | Virtual machine |
|---|---|
| Shares the host kernel | Runs a guest operating system with its own kernel |
| Usually starts quickly | Usually takes longer to boot |
| Typically uses fewer resources for comparable workloads | Usually has more operating-system overhead |
| Packages an application and its dependencies | Packages a full operating-system environment and applications |
| Isolation depends on container runtime and host configuration | Isolation is provided by the hypervisor and VM configuration |

The right choice depends on workload, isolation requirements, operating-system needs, and infrastructure design.

## Installation

Choose the guide that matches your environment:

- **Windows:** [Install Docker Desktop](installation/windows-installation.md). Docker Desktop commonly uses the WSL 2 backend.
- **Ubuntu:** [Install Docker Engine](installation/ubuntu-installation.md) using Docker's official APT repository.

Then follow [Verify installation](installation/verify-installation.md).

## First practical exercises

### Exercise 1 – Run hello-world

```bash
docker run hello-world
```

This downloads the image if it is not already present, creates a container, runs its test program, prints a confirmation message, and exits.

Full guide: [hello-world container](first-container/hello-world.md).

### Exercise 2 – Run Nginx

```bash
docker run -d --name my-nginx -p 8080:80 nginx:alpine
```

Open `http://localhost:8080` in a browser on the Docker host. You should see the Nginx welcome page.

Full guide: [Nginx container](first-container/nginx-container.md).

## Essential commands

| Command | Purpose |
|---|---|
| `docker --version` | Show the CLI version. |
| `docker version` | Show client and server/Engine version details. |
| `docker info` | Show Engine configuration and runtime information. |
| `docker ps` | List running containers. |
| `docker ps -a` | List all containers, including stopped ones. |
| `docker images` | List local images. |
| `docker pull nginx:alpine` | Download an image. |
| `docker logs my-nginx` | Display container logs. |
| `docker inspect my-nginx` | Display detailed container configuration. |
| `docker stop my-nginx` | Stop a running container. |
| `docker start my-nginx` | Start an existing stopped container. |
| `docker rm my-nginx` | Remove a stopped container. |

More examples are in the `basic-commands/` directory.

## Cleanup

After completing the Nginx exercise:

```bash
docker stop my-nginx
docker rm my-nginx
```

Optionally remove the downloaded image if you no longer need it:

```bash
docker image rm nginx:alpine
```

Do not remove images or volumes that are being used by other projects. Removing a container does not automatically remove separately managed named volumes.

## Troubleshooting

See [Common Docker errors](troubleshooting/common-errors.md) for issues such as:

- Docker daemon not running.
- `docker` command not found.
- Permission denied on Linux.
- Port 8080 already in use.
- Container name already in use.
- Image pull or network failures.

## Safety and production notes

- Do not put passwords, tokens, or other secrets directly into images or source control.
- Use trusted images and pin versions or digests for controlled deployments.
- Avoid running application containers as root when it is not required.
- Expose only the ports that the application needs.
- Configure resource limits, logging, health checks, backups, and monitoring for production workloads.
- Treat examples in this learning repository as starting points; adapt and test them for your environment.

## Official documentation

- [Docker documentation](https://docs.docker.com/)
- [Docker Desktop for Windows](https://docs.docker.com/desktop/setup/install/windows-install/)
- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Docker run reference](https://docs.docker.com/reference/cli/docker/container/run/)
