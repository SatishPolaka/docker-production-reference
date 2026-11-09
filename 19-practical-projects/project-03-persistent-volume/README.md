# Project 03 — Persistent volume

```bash
docker volume create demo-data
docker run --rm -v demo-data:/data busybox:1.36 sh -c 'echo saved > /data/value.txt'
docker run --rm -v demo-data:/data busybox:1.36 cat /data/value.txt
```

The second container can read the file written by the first.