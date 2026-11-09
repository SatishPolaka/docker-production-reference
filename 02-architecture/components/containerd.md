# containerd

containerd is an industry-used container runtime component. Docker Engine uses containerd to handle important container lifecycle and image operations.

## What does containerd do?

At a high level, containerd is responsible for tasks such as:

- Managing container lifecycle operations.
- Managing image transfer and unpacking.
- Coordinating runtime execution through an OCI runtime such as runc.
- Managing snapshots and other container-related resources through its components and plugins.

Docker daemon and containerd are related but are not the same component.

## Simplified relationship

```text
Docker CLI
    |
    v
Docker daemon (dockerd)
    |
    v
containerd
    |
    v
OCI runtime (commonly runc)
    |
    v
Container process
```

This is a simplified conceptual view. Real operations involve APIs, shims, plugins, and additional processes.

## Check containerd on Ubuntu

On systems where containerd is installed as a systemd service:

```bash
sudo systemctl status containerd
```

Check the process:

```bash
ps -ef | grep '[c]ontainerd'
```

Some installations include `ctr`, a low-level containerd client:

```bash
ctr version
```

`ctr` is primarily a debugging and administration client for containerd; it is not a drop-in replacement for the Docker CLI.

## Important distinction

Kubernetes can use containerd directly as a container runtime through the Container Runtime Interface (CRI). Docker Engine is not required for Kubernetes nodes that use containerd directly.
