# Package Customised Container

```
mkdir test && cd test
vi Dockerfile

### when if the Dockerfile

FROM ubuntu:latest
MAINTAINER benm <ben@benmcphail.com>
RUN apt-get update
RUN apt-get install telnet openssh-server
```

Press `Esc :wq` to quit

Run the Dockerfile

```
docker build -t="ben/ubusshdonly:v2" .
```

This will fail after this line/option:
```
Do you want to continue? [Y/n] Abort.
```

Essentially docker realised there is prompt that requires responding so it automatically fails.

Solution:

```
vi Dockerfile

## once inside
RUN apt-get install telnet -y openssh-server
```

Exit via `Esc :wq` and rerun `docker build`

Now you have built your own image using docker which you can see via:
```
docker images
```

Lets run it!!
```
docker run -it ben/ubusshdonly:v2 /bin/bash
```

Now you're logged into your container.