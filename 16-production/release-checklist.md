# Container release checklist

- [ ] Source revision and image tag are traceable.
- [ ] Base image and dependencies are reviewed.
- [ ] Tests and required security scans passed.
- [ ] Image is pushed to an approved registry and digest recorded.
- [ ] Secrets are provided at runtime using an approved secret mechanism.
- [ ] Container runs as non-root where possible.
- [ ] Only required ports are published.
- [ ] CPU, memory and PID limits are configured.
- [ ] Health checks and restart behaviour are defined.
- [ ] Persistent data is stored outside the container writable layer.
- [ ] Logs and metrics are collected.
- [ ] Rollback image and procedure are available.
- [ ] Backup and restore are tested for stateful workloads.
- [ ] Change owner and incident contact are identified.
