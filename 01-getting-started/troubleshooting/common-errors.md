# Common Docker Getting-Started Errors

This guide covers common issues encountered when installing Docker and running the first containers.

## 1. `docker: command not found` (Linux) or command not recognised (Windows)

**Possible causes**

- Docker CLI is not installed.
- The terminal was opened before installation and has not refreshed its PATH.
- Docker Desktop installation did not complete.

**What to check**

```bash
docker --version
```

On Windows, close and reopen PowerShell. Confirm Docker Desktop is installed and start it. On Ubuntu, check the package installation:

```bash
dpkg -l | grep -E 'docker-ce|docker.io|docker-ce-cli'
```

Use the official installation guide for your operating system if the CLI is missing.

## 2. Cannot connect to the Docker daemon

Typical message:

```text
Cannot connect to the Docker daemon
```

**Ubuntu checks**

```bash
sudo systemctl status docker
sudo systemctl start docker
sudo systemctl enable docker
```

Then test:

```bash
sudo docker version
```

If `sudo docker version` works but `docker version` does not, see the permission section below.

**Windows checks**

- Start Docker Desktop.
- Wait until the engine reports that it is running.
- If using WSL, check Docker Desktop's WSL integration for your distribution.

## 3. Permission denied on the Docker socket (Linux)

Typical message mentions `/var/run/docker.sock`.

Try the command with sudo:

```bash
sudo docker ps
```

You may optionally add a trusted user to the `docker` group, but note that membership in this group grants root-level privileges in common configurations:

```bash
sudo usermod -aG docker "$USER"
```

Log out and back in before testing. Do not change the socket permissions to `777`.

## 4. Port is already allocated

Typical message:

```text
Bind for 0.0.0.0:8080 failed: port is already allocated
```

Find the container using the port:

```bash
docker ps
```

Either stop the container using that port or choose another host port:

```bash
docker run -d --name nginx-alt -p 8081:80 nginx:alpine
```

Then browse to `http://localhost:8081`.

## 5. Container name is already in use

Typical message:

```text
The container name "/my-nginx" is already in use
```

List all containers:

```bash
docker ps -a
```

Remove the old container if you no longer need it:

```bash
docker rm my-nginx
```

If it is running, stop it first:

```bash
docker stop my-nginx
docker rm my-nginx
```

Use `docker rm -f my-nginx` only when you intentionally want to force-stop and remove it.

## 6. Image pull fails

Possible causes include an internet or DNS issue, registry outage, rate limits, authentication requirements, or an incorrect image name/tag.

Try:

```bash
docker pull nginx:alpine
```

Check that the image name and tag are correct, verify network access, and review the full error message. Do not repeatedly retry without checking the cause.

## 7. Container starts and then exits

List all containers:

```bash
docker ps -a
```

Check its logs:

```bash
docker logs <container-name-or-id>
```

A container runs while its main process is running. If that process finishes or fails, the container exits. This is expected for `hello-world`; it is not expected for a web server intended to remain running.

## 8. `docker run` works but the browser cannot open the website

Check:

```bash
docker ps
docker port my-nginx
docker logs my-nginx
```

Confirm you used the mapped host port, for example `http://localhost:8080` for `-p 8080:80`. Check local firewall rules and ensure the container is running.

## 9. Docker Desktop reports virtualisation or WSL errors

- Confirm hardware virtualisation is enabled in BIOS/UEFI.
- Run `wsl --status` and `wsl --update` in PowerShell.
- Confirm your Windows version meets Docker Desktop's current requirements.
- Restart Windows if Windows or the installer requests it.

See Microsoft's [WSL installation guide](https://learn.microsoft.com/windows/wsl/install) and Docker's [Windows installation guide](https://docs.docker.com/desktop/setup/install/windows-install/).

## 10. Container cannot be removed because it is running

Stop it first:

```bash
docker stop <container-name>
docker rm <container-name>
```

Or, if intentional, force-remove it:

```bash
docker rm -f <container-name>
```

## Useful diagnostic commands

```bash
docker version
docker info
docker ps -a
docker images
docker logs <container-name>
docker inspect <container-name>
```

## Before asking for help

When reporting an issue, include:

1. Operating system and version.
2. Docker version (`docker version`).
3. Exact command you ran.
4. Complete error message.
5. Relevant output from `docker ps -a` or `docker logs`.

Remove passwords, tokens, private registry credentials, and other sensitive information before sharing logs.
