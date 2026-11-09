# Docker security

- Use trusted, maintained base images and scan them regularly.
- Run applications as non-root.
- Drop capabilities the application does not need.
- Avoid `--privileged` and avoid mounting the Docker socket into app containers.
- Use read-only root filesystems where practical.
- Set CPU, memory and PID limits.
- Keep secrets out of images, build arguments, logs and source control.
- Restrict network access and publish only required ports.
- Patch the host kernel and Docker Engine.

Container isolation does not replace host hardening or application security.