# Getting started

Docker packages an application and its runtime dependencies into an image. A container is a running instance of that image. Containers share the host kernel, so they are lighter than virtual machines, but still need isolation, resource limits and operational controls.

```bash
docker version
docker info
docker run --rm hello-world
```

Install Docker Engine or Docker Desktop using the current official instructions for your operating system. Avoid old installation scripts copied from untrusted sources. Confirm the supported OS and version before installing.