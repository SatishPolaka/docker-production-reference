# Project 01 — Run a web container

```bash
docker run -d --name web-demo -p 8080:80 nginx:stable
docker ps
docker logs web-demo
curl -I http://localhost:8080
docker rm -f web-demo
```

Expected result: Nginx responds on local port 8080. If the port is in use, choose another host port.