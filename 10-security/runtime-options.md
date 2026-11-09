# Runtime security options

Example for an image that supports a read-only filesystem and does not need Linux capabilities:

```bash
docker run -d --name hardened-web \
  --read-only \
  --cap-drop=ALL \
  --security-opt=no-new-privileges:true \
  --tmpfs /var/cache/nginx \
  --tmpfs /var/run \
  -p 8080:8080 nginxinc/nginx-unprivileged:stable-alpine
```

Check the image's documented writable paths and runtime requirements first. These flags are not compatible with every application.
