# Project 07 — Push an image

```bash
docker tag local/web-demo:1.0 registry.example.com/team/web-demo:1.0.0
docker login registry.example.com
docker push registry.example.com/team/web-demo:1.0.0
```

Use a scoped token or service account. In CI, use a credential store and `--password-stdin`.