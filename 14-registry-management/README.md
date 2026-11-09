# Registry management

A registry stores images and controls who can pull or push them. Use separate repositories or namespaces for teams and applications. Apply retention and vulnerability policies. Protect release tags and prefer digest-based deployment where supported.

For Amazon ECR, use an IAM role on the build agent where possible. Scope permissions to the repository and region required by the pipeline.