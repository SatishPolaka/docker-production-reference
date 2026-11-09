# Production deployment

Before deployment, confirm image digest, configuration, secrets, ports, storage, health checks, resource limits, logging, monitoring and rollback.

A release should have a reviewed source revision, immutable image, known configuration version, tested health verification, rollback path, owner and communication path. Docker alone does not provide a complete high-availability or disaster-recovery design.