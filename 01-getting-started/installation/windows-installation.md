# Install Docker Desktop on Windows

This guide explains how to install Docker Desktop on a supported Windows machine using the WSL 2 backend.

## Prerequisites

Before installing:

- Use a supported 64-bit Windows version.
- Enable hardware virtualisation in BIOS/UEFI.
- Install or update WSL 2.
- Ensure your Windows account has permission to install software.
- Review Docker Desktop's current system requirements and licensing terms.

Docker Desktop requirements can change. Check the official [Windows installation guide](https://docs.docker.com/desktop/setup/install/windows-install/) before starting.

## Step 1 – Check Windows version

Open PowerShell:

```powershell
winver
```

Confirm that your Windows version is supported by the current Docker Desktop release.

## Step 2 – Install or update WSL

Open PowerShell as Administrator:

```powershell
wsl --install
```

If WSL is already installed, update it:

```powershell
wsl --update
```

List installed distributions and their WSL versions:

```powershell
wsl --list --verbose
```

If your Linux distribution is using WSL 1, convert it to WSL 2 where supported:

```powershell
wsl --set-version Ubuntu 2
```

Replace `Ubuntu` with the exact distribution name shown by `wsl --list --verbose`.

Restart Windows if the installer or Windows prompts you to do so.

## Step 3 – Download Docker Desktop

1. Open the official [Docker Desktop for Windows](https://docs.docker.com/desktop/setup/install/windows-install/) installation page.
2. Download the installer that matches your system architecture.
3. Run the installer.
4. Select the WSL 2 backend option when offered.
5. Complete the installation and restart or sign out if prompted.

Do not download Docker installers from unofficial websites.

## Step 4 – Start Docker Desktop

1. Open Docker Desktop from the Start menu.
2. Accept the applicable terms and complete the initial setup.
3. Wait until Docker Desktop reports that the engine is running.
4. If prompted, enable the WSL integration for the Linux distribution you use.

## Step 5 – Verify from PowerShell

Open a new PowerShell window:

```powershell
docker --version
docker version
docker info
```

Run a test container:

```powershell
docker run hello-world
```

A successful run prints a message explaining that Docker is working.

## Step 6 – Verify from WSL (optional)

If you use Docker commands inside Ubuntu on WSL:

1. Open Docker Desktop.
2. Go to **Settings → Resources → WSL Integration**.
3. Enable integration for your Ubuntu distribution.
4. Apply the changes and restart if requested.
5. Open the Ubuntu terminal and run:

```bash
docker version
docker run hello-world
```

The client and server sections should be available. If the server cannot be reached, check that Docker Desktop is running and WSL integration is enabled.

## Common notes

- Docker Desktop is not the same installation method as Docker Engine installed directly inside a Linux server.
- Avoid installing a separate Docker Engine inside WSL unless you intentionally want to manage that setup yourself; running two competing Docker environments can cause confusion.
- Docker Desktop licensing depends on the organisation and use case. Review the current Docker terms.

## Official references

- [Install Docker Desktop on Windows](https://docs.docker.com/desktop/setup/install/windows-install/)
- [WSL installation guide](https://learn.microsoft.com/windows/wsl/install)
