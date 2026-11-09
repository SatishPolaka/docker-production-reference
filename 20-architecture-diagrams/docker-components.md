# Docker components

```mermaid
flowchart LR
    U[Operator or CI pipeline] --> CLI[Docker CLI]
    CLI --> API[Docker Engine API]
    API --> D[Docker daemon]
    D --> IMG[Images]
    D --> C[Containers]
    D --> N[Networks]
    D --> V[Volumes]
    D <--> R[Image registry]
```
