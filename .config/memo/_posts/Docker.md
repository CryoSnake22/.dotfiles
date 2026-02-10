# Docker

## Notes

In Docker, we want to essentially define a blueprint for a container. The `Dockerfile` defines what needs to run and what needs to happen when you spin up your machine.

```dockerfile
FROM ubuntu:latest
WORKDIR /app
COPY . .
RUN chmod +x directory/script.sh
CMD [ "/directory/script.sh" ]
```

When you're done with your `Dockerfile` you can run

```bash
docker build -t "name" .
```

Here are a few images related commands

```bash
# Check images
docker images

# Removes the image "myapp"
docker rmi myapp

# Force delete (if containers are using it)
docker rmi -f myapp

#

```

## Docker-compose

When creating multiple containers with docker-compose, the command `docker-compose up` starts all the containers just like the `docker-compose down` stops them all. It then attaches the stdout the containers to the terminal but you can detach and it will still run in the background.

Then to get the logs/ terminal stdouts from each container you simply need to do.

```bash
docker-compose logs <container-name> # snapshot of the out

docker-compose logs -f <container-name> # -f for feed
```

## Quirks and DBs

```bash
docker-compose down -v # also deletes the volume

docker-compose up --build # starts it and rebuilds with docker-compose
```
