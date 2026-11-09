# Execute a Command Inside a Running Container

Use `docker exec` to run an additional process inside an already running container.

## Start a container

```bash
docker run -d --name exec-demo nginx:alpine
```

## Open an interactive shell

```bash
docker exec -it exec-demo sh
```

Inside the container:

```sh
hostname
pwd
ls -la
exit
```

Nginx's Alpine image provides `sh`; it may not provide Bash.

## Run a one-off command

```bash
docker exec exec-demo nginx -v
```

Run a command as a specific user if that user exists in the image:

```bash
docker exec --user 0 exec-demo id
```

The example uses UID 0 (root) only to demonstrate the option. Avoid running diagnostic or application commands as root unless required.

## Important distinction

- `docker run` creates a new container and starts its main process.
- `docker exec` starts an additional process inside an existing running container.
- `docker attach` connects your terminal to the container's main process streams; it is not the same as `exec`.

## Clean up

```bash
docker rm -f exec-demo
```
