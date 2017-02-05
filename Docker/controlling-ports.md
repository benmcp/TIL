# Ccontrolling Ports

Run a container

```
docker run -itd nginx:latest
```

If you inspect this you will find that `port 80` is exposed on the container, but not mappped to anything on our local:
```
docker ps
# CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
# 79a2872d40a7        nginx:latest        "nginx -g 'daemon ..."   3 seconds ago       Up 2 seconds        80/tcp, 443/tcp     modest_elion
```

But if we map the port we can access the local from our local.

First, stop the running container
```
docker stop modest_elion
```

Start a new container but specify the port mapping:

```
docker run -itd -p 80 nginx:latest
```

Now the port will be exposed:
```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                            NAMES
a8dfe12777f2        nginx:latest        "nginx -g 'daemon ..."   5 minutes ago       Up 5 minutes        443/tcp, 0.0.0.0:32768->80/tcp   dreamy_haibt
```

Such that you can go do `http://0.0.0.0:32768` and the page will be exposed.
