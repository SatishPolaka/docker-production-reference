# Project 02 — Build a custom image

```bash
cd 05-dockerfile/simple-nginx
docker build -t local/web-demo:1.0 .
docker run -d --name web-demo -p 8080:80 local/web-demo:1.0
curl http://localhost:8080
docker rm -f web-demo
```

Expected result: the custom HTML page is served from the image.