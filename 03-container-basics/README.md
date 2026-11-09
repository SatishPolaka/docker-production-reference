# Container basics

```bash
docker run -d --name web-demo -p 8080:80 nginx:stable
docker ps
docker ps -a
docker logs web-demo
docker logs -f web-demo
docker exec -it web-demo sh
docker inspect web-demo
docker stop web-demo
docker start web-demo
docker rm web-demo
```

`-d` runs in the background. `-p 8080:80` maps host port 8080 to container port 80. `docker exec` runs a process in an already-running container. Check container state and attached data before removing it.