# Container CI/CD

```mermaid
flowchart LR
    G[Git repository] --> J[CI pipeline]
    J --> T[Unit tests]
    T --> B[Build image]
    B --> S[Image scan]
    S --> R[Container registry]
    R --> D[Deployment platform]
    D --> H[Health checks and monitoring]
```
