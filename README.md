# Docker Production Reference

A practical Docker reference for container work in development, CI/CD and production environments. The repository covers fundamentals, images, Dockerfiles, networking, storage, Compose, security, registries, Swarm, monitoring, backup, troubleshooting and hands-on projects.

## Sections

| Folder | Topics |
|---|---|
| 01-getting-started | Docker overview, installation and first container |
| 02-architecture | Client, daemon, images, containers and registries |
| 03-container-basics | Lifecycle, logs, exec, inspect and cleanup |
| 04-images-and-registries | Pull, tag, inspect, save, load and push |
| 05-dockerfile | Instructions, layers, cache, multi-stage builds |
| 06-build-and-publish | Repeatable builds and image tagging |
| 07-networking | Bridge, host, none, overlay, DNS and ports |
| 08-volumes-and-storage | Volumes, bind mounts, permissions and backup |
| 09-compose | Multi-container applications and health checks |
| 10-security | Non-root, secrets, capabilities and image scanning |
| 11-resource-management | CPU, memory, PIDs and restart policies |
| 12-logging-monitoring | Logs, drivers, metrics and operational checks |
| 13-swarm | Services, stacks, secrets and rolling updates |
| 14-registry-management | Docker Hub, private registries and Amazon ECR |
| 15-ci-cd | Jenkins build, scan, push and deployment |
| 16-production | Release checklist and rollback |
| 17-troubleshooting | Common Docker failures and checks |
| 18-commands-reference | Daily command reference |
| 19-practical-projects | End-to-end exercises |
| 20-architecture-diagrams | Mermaid diagrams |
| 21-screenshots | Add screenshots from your own environment |

## Suggested order

Start with 01–05. Build an image, then practise networking, volumes and Compose. Continue with security, registry publishing and CI/CD. Finish with Swarm, production deployment and troubleshooting.

## Before running examples

- Replace `CHANGE_ME`, sample image names, registry paths and ports.
- Read commands before running them, especially cleanup commands.
- Never commit passwords, access keys, private certificates or real `.env` files.
- Prefer maintained base images and pin versions or digests for controlled releases.
- Test backups by restoring them.
- Do not mount the Docker socket into an application container without understanding the security impact.
- Test examples in a non-production environment before adapting them for production.

These are practical reference examples, not universal production configurations. Review host security, image versions, resource limits, secrets, storage and rollback requirements for your environment.
