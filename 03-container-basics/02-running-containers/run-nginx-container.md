# Run an Nginx Container

This exercise starts an Nginx web server and publishes it on a host port.

## Step 1 – Pull the image

```bash
docker pull nginx:alpine
```

## Step 2 – Run the container

```bash
docker run -d --name nginx-basics -p 8086:80 nginx:alpine
```

Explanation:

- `-d`: detached mode.
- `--name nginx-basics`: assigns a container name.
- `-p 8086:80`: maps host port 8086 to container port 80.
- `nginx:alpine`: image and tag.

## Step 3 – Verify

```bash
docker ps
docker port nginx-basics
docker logs nginx-basics
```

Open:

```text
http://localhost:8086
```

You should see the Nginx welcome page.

## Step 4 – Stop and remove

```bash
docker stop nginx-basics
docker rm nginx-basics
```

If you need to keep the container for another exercise, use `docker stop` only and start it later with `docker start nginx-basics`.

## Troubleshooting

If port 8086 is busy, use another host port, for example:

```bash
docker run -d --name nginx-basics -p 8088:80 nginx:alpine
```

Then browse to `http://localhost:8088`.
