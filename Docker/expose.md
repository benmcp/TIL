# Expose

Trialing something differnet here, going to do a dump of my terminal commands in relation to manipulating the ports that are exposed for my container:

```
$ vi Dockerfile

## inside Docker file
# this image is based on CentOS 7 and will start apache service in each container

FROM centos:latest
MAINTAINER ben@benmcphail.com

RUN yum update -y
RUN yum install -y httpd net-tools

RUN echo "This is a custom index file build during the image creation" > /var/www/html/index.html

ENTRYPOINT apachectl "-DFOREGROUND"
## END Dockerfile

$ docker images
$ docker build -t centos7/apache:v1 .
$ docker run -d --name apacheweb1 centos7/apache:v1
$ docker ps
$ docker inspect apacheweb1 | grep IPAdd
$ elinks http://172.17.0.3
$ clear
$ docker exec apacheweb /bin/cat /var/www/html/index.html
$ docker exec apacheweb1 /bin/cat /var/www/html/index.html
$ docker ps
$ docker stop apacheweb1
$ docker run -d --name apacheweb2 -P centos7/apache:v1
$ docker ps
$ docker stap apacheweb2
$ docker stop apacheweb2
$ docker run -d --name=apacheweb3 -p 8080:80 centos7/apache:v1
$ docker ps
$ elinks http://localhost:8080
$ docker stop apacheweb3
$ elinks http://localhost:8080
$ vi Dockerfile

## inside Docker file
# this image is based on CentOS 7 and will start apache service in each container

FROM centos:latest
MAINTAINER ben@benmcphail.com

RUN yum update -y
RUN yum install -y httpd net-tools

RUN echo "This is a custom index file build during the image creation" > /var/www/html/index.html

EXPOSE 80

ENTRYPOINT apachectl "-DFOREGROUND"
## END Dockerfile

$ docker build -t centos7/apache:v1 .
$ docker run -d --name=apacheweb4 -P centos7/apache:v1
$ docker ps
$ elinks http://localhost:32768
$ docker ps
```