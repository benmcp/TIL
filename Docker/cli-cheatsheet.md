# Docker CLI Cheatsheet

## Docker Search images
```
docker search sample
```

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

## Get Docker image
```
docker pull IMAGE
```

## Inspect a docker image
```
docker inspect IMAGE
```
where image can be `nginx` as an example 

## Quick start/running a container
```
docker pull centos
docker run -it centos:latest /bin/bash
```
Where `i` is for `interactive` mode and `t` is for `terminal`. This will run the `centos` container and log you in.

## Remove container by ID
```
docker rm CONTAINER_ID
```

## Docker remove all containers
```
docker rm `docker ps -a -q`
```

## Remove an image
```
docker rmi IMAGE_NAME
```

## Remove an image that is still being used
```
docker rmi -f IMAGE_NAME
```