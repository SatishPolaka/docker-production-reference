# Environment Variables in Containers

Environment variables can configure application behaviour without rebuilding an image.

## Pass one variable

```bash
docker run --rm -e APP_ENV=development alpine:3.20 printenv APP_ENV
```

Expected output:

```text
development
```

## Pass multiple variables

```bash
docker run --rm \
  -e APP_ENV=testing \
  -e LOG_LEVEL=debug \
  alpine:3.20 sh -c 'echo "$APP_ENV"; echo "$LOG_LEVEL"'
```

## Use an environment file

Create a local file named `app.env`:

```text
APP_ENV=development
LOG_LEVEL=info
```

Run:

```bash
docker run --rm --env-file app.env alpine:3.20 sh -c 'printenv APP_ENV; printenv LOG_LEVEL'
```

Do not commit real secret values in `app.env`. Add local environment files containing credentials to `.gitignore` and use a dedicated secrets mechanism for sensitive production values.

## Inspect environment variables

```bash
docker inspect --format '{{range .Config.Env}}{{println .}}{{end}}' <container-name>
```

Be aware that environment values may be visible to users with permission to inspect the container. Do not use ordinary environment variables as a secure secret store for high-sensitivity credentials.
