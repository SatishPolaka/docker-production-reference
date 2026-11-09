# Run Containers in Foreground and Background

Docker containers can run attached to the terminal or detached in the background.

## Foreground mode

```bash
docker run --name alpine-foreground alpine:3.20 echo "Hello from the container"
```

Docker displays the command output and returns control when the command finishes. The container then exits because its main process has completed.

Start an interactive shell:

```bash
docker run -it --name alpine-shell alpine:3.20 sh
```

Try:

```sh
echo "Inside the container"
hostname
exit
```

## Background (detached) mode

```bash
docker run -d --name nginx-background nginx:alpine
```

The `-d` option runs the container in the background and returns the container ID.

Check it:

```bash
docker ps
docker logs nginx-background
```

Remove it:

```bash
docker rm -f alpine-foreground alpine-shell nginx-background
```

Some containers may already have exited; `docker rm` can remove stopped containers, while `docker rm -f` also handles running ones.

## When to use each mode

| Mode | Common use |
|---|---|
| Foreground / attached | Interactive shells, debugging, short commands |
| Detached (`-d`) | Web servers, APIs, databases, and long-running services |

A container remains running only while its main process remains running.
