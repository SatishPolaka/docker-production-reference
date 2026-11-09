# Images and registries

Use meaningful image tags such as a release version or Git commit SHA. A tag can be moved, so it is not inherently immutable.

```bash
docker pull nginx:stable
docker images
docker image inspect nginx:stable
docker tag nginx:stable registry.example.com/team/nginx:1.0.0
docker push registry.example.com/team/nginx:1.0.0
docker save -o nginx-image.tar nginx:stable
docker load -i nginx-image.tar
```

Authenticate with a credential helper or CI secret. Never put a registry password directly in a command argument or source file.