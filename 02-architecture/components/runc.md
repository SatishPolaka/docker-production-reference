# runc

`runc` is a low-level command-line container runtime that implements the Open Container Initiative (OCI) runtime specification.

## What does runc do?

At a simplified level, runc uses a runtime bundle and configuration to create and start a container process with configured Linux namespaces, control groups, mounts, and other isolation settings.

Docker Engine commonly uses containerd, which in turn invokes an OCI runtime such as runc to create and run the container.

## Simplified relationship

```text
dockerd
   |
   v
containerd
   |
   v
runc
   |
   v
Container process
```

## Is runc the same as Docker?

No.

- Docker Engine is a container platform.
- containerd manages container lifecycle and related tasks.
- runc is a low-level OCI runtime used to create and run container processes.

## OCI

The Open Container Initiative defines specifications for container image formats and runtime behaviour. These standards help different tools interoperate.

Reference: [OCI runtime specification](https://github.com/opencontainers/runtime-spec).
