# Install Docker Engine on Ubuntu

This guide installs Docker Engine using Docker's official APT repository. It is intended for supported Ubuntu releases on a machine where you have sudo access.

> Check Docker's official Ubuntu installation page for the latest supported Ubuntu releases and commands before using this guide on a production server.

## Step 1 – Update package indexes

```bash
sudo apt-get update
```

## Step 2 – Install prerequisite packages

```bash
sudo apt-get install -y ca-certificates curl
```

## Step 3 – Add Docker's official GPG key

```bash
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

## Step 4 – Add the Docker APT repository

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Refresh package indexes:

```bash
sudo apt-get update
```

## Step 5 – Install Docker Engine and plugins

```bash
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Step 6 – Start and enable Docker

```bash
sudo systemctl enable --now docker
```

Check service status:

```bash
sudo systemctl status docker
```

Press `q` to exit the status screen.

## Step 7 – Verify Docker

```bash
sudo docker version
sudo docker info
sudo docker run hello-world
```

The `hello-world` container should print a success message and exit.

## Step 8 – Optional: run Docker without sudo

Docker's default Unix socket is normally accessible to root and members of the `docker` group. Add your user to that group only if you understand the security impact:

```bash
sudo usermod -aG docker "$USER"
```

Then log out and log back in, or start a new login session. Verify:

```bash
docker run hello-world
```

**Security warning:** Membership in the `docker` group grants root-level privileges on the host in common configurations. Do not add users to this group casually, especially on shared or production servers. Using `sudo docker ...` is a safer default when elevated access is required.

## Uninstall note

Do not uninstall Docker or delete `/var/lib/docker` as a troubleshooting shortcut. That directory may contain images, containers, and volumes. If you need to uninstall, follow Docker's official instructions and back up required data first.

## Official reference

[Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
