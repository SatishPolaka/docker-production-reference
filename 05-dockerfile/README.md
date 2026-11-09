# Dockerfile reference

Common instructions:

- `FROM`: base image or build stage.
- `WORKDIR`: working directory.
- `COPY`: copy files from build context.
- `RUN`: execute a build-time command.
- `ENV`: set runtime environment defaults.
- `ARG`: build-time variable.
- `EXPOSE`: document the container port; it does not publish it.
- `USER`: select the user for subsequent instructions.
- `CMD`: default command.
- `ENTRYPOINT`: main executable.

Keep the build context small, use a trusted base image, copy dependency manifests early when useful for cache reuse, and use multi-stage builds to reduce runtime image size. Never put credentials in `ARG`, `ENV` or copied files.