# Amazon ECR commands

```bash
aws sts get-caller-identity
aws ecr describe-repositories --region ap-south-1
aws ecr get-login-password --region ap-south-1 \
  | docker login --username AWS --password-stdin ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com
docker tag app:1.0.0 ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com/app:1.0.0
docker push ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com/app:1.0.0
```

Replace account ID, region and repository. Prefer an IAM role on the build agent. Scope the role to the target ECR repository and required actions. ECR login tokens are temporary; obtain one when the pipeline needs it.
