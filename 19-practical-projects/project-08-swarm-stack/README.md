# Project 08 — Deploy a Swarm stack

On a planned manager node:

```bash
docker swarm init
docker stack deploy -c 13-swarm/stack.yaml demo
docker stack services demo
docker service ps demo_web
```

For a multi-node environment, join worker nodes using the generated command. Protect join tokens.