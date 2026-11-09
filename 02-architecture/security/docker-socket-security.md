# Docker Socket Security

The Docker socket is an interface through which an authorised client can communicate with the Docker daemon. On many Linux installations, the default Unix socket is:

```text
/var/run/docker.sock
```

## Why is it sensitive?

On a typical rootful Docker Engine installation, a user who can control the daemon can often start privileged containers, mount host directories, and gain root-level control of the host.

For this reason, Docker socket access should be treated as highly privileged access.

## Check socket ownership and permissions (Linux)

```bash
ls -l /var/run/docker.sock
```

Do not make the socket world-writable with commands such as:

```bash
# Do not do this:
sudo chmod 666 /var/run/docker.sock
```

This can grant every local user access to the Docker daemon.

## Avoid casual socket mounts

A container started with a mount such as:

```bash
-v /var/run/docker.sock:/var/run/docker.sock
```

may be able to control the host Docker daemon, depending on the daemon and security configuration. Do not mount the socket into an application container unless there is a reviewed, necessary operational reason and suitable controls.

## Recommended controls

- Restrict membership in the `docker` group.
- Do not expose an unauthenticated Docker TCP API.
- Use SSH or properly configured TLS for remote daemon access.
- Apply least privilege to CI/CD agents and automation.
- Avoid mounting the Docker socket into untrusted workloads.
- Review privileged containers and host-path mounts carefully.
- Consider rootless Docker or other isolation approaches where they fit the operational requirements.
- Audit who can access Docker hosts and daemon endpoints.

## CI/CD consideration

A Jenkins agent with unrestricted access to a rootful Docker socket may effectively have root-level control of the Docker host. Isolate build agents, restrict who can run jobs on them, and assess whether a dedicated builder or remote build service is more appropriate.

## Further reading

- [Docker Engine security](https://docs.docker.com/engine/security/)
- [Docker daemon attack surface](https://docs.docker.com/engine/security/)
- [Rootless mode](https://docs.docker.com/engine/security/rootless/)
