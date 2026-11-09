# Run an Alpine Linux Container

Alpine is a small Linux distribution commonly used as a base image. This exercise starts an interactive shell inside an Alpine container.

## Start an interactive container

```bash
docker run -it --name alpine-lab alpine:3.20 sh
```

Options:

- `-i`: keep standard input open.
- `-t`: allocate a terminal.
- `--name`: set a readable container name.
- `sh`: run the shell as the container's main process.

## Commands inside the container

```sh
cat /etc/os-release
hostname
pwd
ls -la
```

Exit the shell:

```sh
exit
```

The container stops because the shell was its main process.

## Re-enter a running container

For a container that is still running, use:

```bash
docker exec -it <container-name> sh
```

For this example, after exiting the first shell, start the container again:

```bash
docker start alpine-lab
docker exec -it alpine-lab sh
```

## Clean up

Exit the shell, then run:

```bash
docker rm -f alpine-lab
```

## Note

Minimal images may not include Bash, curl, package managers, or other familiar tools. Check what is available rather than assuming a full Linux distribution is present.
