# Volumes and storage

Container writable layers are temporary. Use a volume for data that must survive container replacement. Use a bind mount when a specific host path is required. Use tmpfs for temporary in-memory data.

```bash
docker volume create app-data
docker volume ls
docker volume inspect app-data
docker run -d --name db-demo -v app-data:/var/lib/mysql mysql:8
```

Do not remove a volume until you have confirmed the data is no longer needed and a verified backup exists. Do not mount one database data directory read-write into multiple independent database containers; database engines generally require exclusive control of their data files.