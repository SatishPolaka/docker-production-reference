# Docker Registry

A container registry stores and distributes container images. Developers and CI/CD pipelines can push images to a registry, and servers can pull them when deploying applications.

## Common registry examples

- Docker Hub.
- Amazon Elastic Container Registry (Amazon ECR).
- Azure Container Registry (ACR).
- Google Artifact Registry.
- Self-hosted registries.

## Basic image workflow

Pull an image:

```bash
docker pull nginx:alpine
```

List local images:

```bash
docker image ls
```

Tag an image for a registry:

```bash
docker tag nginx:alpine YOUR_REGISTRY/YOUR_REPOSITORY:YOUR_TAG
```

Push the tagged image:

```bash
docker push YOUR_REGISTRY/YOUR_REPOSITORY:YOUR_TAG
```

Replace every `YOUR_...` value with the actual registry host, repository, and tag. Authenticate using the registry's recommended method before pushing. Do not place passwords or access tokens directly in scripts or source control.

## Image naming

A common image reference format is:

```text
[REGISTRY_HOST/]NAMESPACE/IMAGE_NAME:TAG
```

For example:

```text
nginx:alpine
```

uses the default registry and official image namespace conventions, while a private image may include an explicit registry host.

## Production considerations

- Use trusted registries and control who can push images.
- Scan images and review vulnerabilities.
- Prefer immutable digests or controlled version tags for deployments.
- Use short-lived credentials or workload identity where supported.
- Enable appropriate image retention and audit controls.
