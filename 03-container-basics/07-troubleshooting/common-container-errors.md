# Common Docker Container Errors

This guide covers errors frequently seen when creating and managing containers.

## 1. Container name is already in use

Example:

```text
The container name "/web-demo" is already in use
```

Find the existing container:

```bash
docker ps -a
```

Remove it if it is no longer needed:

```bash
docker rm -f web-demo
```

Or use a different container name.

## 2. Port is already allocated

Example:

```text
Bind for 0.0.0.0:8080 failed: port is already allocated
```

Check published ports:

```bash
docker ps
```

Choose another host port:

```bash
docker run -d --name web-demo-2 -p 8091:80 nginx:alpine
```

## 3. Container exits immediately

Check its state and exit code:

```bash
docker ps -a
docker inspect --format 'Status={{.State.Status}} ExitCode={{.State.ExitCode}} Error={{.State.Error}}' <container-name>
```

Read logs:

```bash
docker logs <container-name>
```

A container exits when its main process completes or fails. A command such as `echo hello` is expected to finish; a web server should normally remain running.

## 4. `docker exec` says the container is not running

`docker exec` requires a running container.

Check:

```bash
docker ps -a
```

Start it if appropriate:

```bash
docker start <container-name>
```

Then execute:

```bash
docker exec -it <container-name> sh
```

## 5. `bash: not found` inside the container

Minimal images may not include Bash. Try:

```bash
docker exec -it <container-name> sh
```

Check the image documentation to learn which tools are installed.

## 6. Browser cannot reach the application

Check:

```bash
docker ps
docker port <container-name>
docker logs <container-name>
```

Confirm that the correct host port is used in the browser and that the port was published with `-p`.

## 7. Container cannot be removed

A running container must be stopped before normal removal:

```bash
docker stop <container-name>
docker rm <container-name>
```

If you intentionally want to force-stop and remove it:

```bash
docker rm -f <container-name>
```

## 8. Permission denied on Linux

Try using sudo to confirm whether it is a Docker socket permission issue:

```bash
sudo docker ps
```

Do not make `/var/run/docker.sock` world-writable. Membership in the `docker` group is highly privileged; grant it only to trusted users.

## 9. Image or container not found

List local images and all containers:

```bash
docker image ls
docker ps -a
```

Pull the correct image if necessary:

```bash
docker pull nginx:alpine
```

Check spelling, tag, and whether you are using the intended Docker context.

## 10. Restart loop

Inspect the state and logs:

```bash
docker inspect <container-name>
docker logs --tail 100 <container-name>
```

Check the configured command, environment variables, mounted files, and application configuration. A restart policy may repeatedly restart a process that is failing; fix the root cause rather than relying on repeated restarts.

## Useful diagnostic sequence

```bash
docker ps -a
docker logs <container-name>
docker inspect <container-name>
docker top <container-name>
docker stats --no-stream <container-name>
```

Before sharing output publicly, remove credentials, tokens, private environment values, and other sensitive information.
