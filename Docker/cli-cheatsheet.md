# Docker CLI Cheatsheet

## Docker Search images
```
docker search sample
```

## Get Docker image
```
docker pull IMAGE
```

## Inspect a docker image
```
docker inspect IMAGE
```
where image can be `nginx` as an example 

## Remove an image
```
docker rmi IMAGE_NAME
```

## Remove an image that is still being used
```
docker rmi -f IMAGE_NAME
```

## Quick start/running a container
```
docker pull centos
docker run -it centos:latest /bin/bash
```
Where `i` is for `interactive` mode and `t` is for `terminal`. This will run the `centos` container and log you in.

If you use `-d` it will mean the container will run as a daemon, i.e. in the background/you wont get logged into the container.

## See currently running containers
```
docker ps
```

## See previously run containers
```
docker ps -a
```

## Stop container
```
docker stop [OPTIONS] CONTAINER [CONTAINER...]
```
Stop one or more running containers

## Remove container by ID
```
docker rm CONTAINER_ID
```

## Docker remove all containers
```
docker rm `docker ps -a -q`
```

