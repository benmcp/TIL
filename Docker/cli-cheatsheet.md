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
docker inspect IMAGEx
```
where image can be `nginx` as an example 

## Remove an image
```
docker rmi IMAGE_NAME
# if you want to remove a spicifc version
docker rmi IMAGE_NAME:TAG
```

## Remove an image that is still being used
```
docker rmi -f IMAGE_NAME
```

## Save an image
```
docker commit awesome_heyrovsky nginx:mine
```

Now you can remove awesome_heyrovsky and still keep ngingx:mine

```
docker save --output nginx.latest.tar nginx:latest
```
To see details about this:
```
ls -al nginx.latest.tar
```
Now you can remove `nginx:latest`.

If you want to load your saved version of nginx:
```
docker load --input nginx.latest.tar
```

## See history of an image
```
docker history ngingx
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

## Assign name to container during runtime:
```
docker run -itd --name mycontainername nginx:latest /bin/bash

# to rename it
docker rename mycontainername myrenamedcontainer
```
You can also rename containers while they are running.



