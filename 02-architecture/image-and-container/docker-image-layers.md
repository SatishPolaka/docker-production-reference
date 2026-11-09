# Docker Image Layers

Docker images are built from a series of filesystem layers. Many Dockerfile instructions create or contribute to image layers, although not every instruction necessarily creates a filesystem layer.

## Example Dockerfile

```dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
CMD ["python", "app.py"]
```

Conceptually, the base image and build changes are represented as reusable image layers and image configuration.

## Why layers matter

- **Reuse:** Images can share common layers.
- **Caching:** Docker can reuse unchanged build steps where cache rules allow.
- **Distribution:** Registries transfer layers rather than always transferring an entire image from scratch.
- **Storage:** Shared layers can reduce duplicate storage.

## Inspect image layers/history

```bash
docker image history python:3.12-slim
```

Inspect metadata:

```bash
docker image inspect python:3.12-slim
```

The `history` command shows image build history, not a complete filesystem diff for every layer.

## Practical recommendations

- Put stable dependency installation steps before frequently changing application source files where appropriate.
- Use `.dockerignore` to keep unnecessary files out of the build context.
- Use multi-stage builds when they reduce the final image size or attack surface.
- Avoid embedding secrets in image layers. Deleting a secret in a later layer does not reliably remove it from earlier image layers.
- Choose trusted base images and maintain them.
