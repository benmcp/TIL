# Setting up a basic webfarm

Pull centos6
```
docker pull centos:centos6
```

Now lets add stuff to it:
```
docker run -i -t centos:centos6 /bin/bash
```

```
yum install wget
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6-8.noarch.rpm
```

Get updates
```
yum update -y
yum install which sudo httpd php openssh-server

```
Update `.bashrc`
```
vi ~/.bashrc
## .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# add ther serices that we want to start
/sbin/service httpd start
/sbin/service openssh-server start

```
Copy the instance id and exit the container and commit it:
```
docker commit 188ca5f9f471 centos6:baseweb
```

Lets run it
```
docker run -i -t centos6:baseweb /bin/bash
```

Oh no, an error:
```
openssh-server: unrecognized service
```

Right, lets kill the images
```
docker rmi centos6:baseweb
## Error again
Error response from daemon: conflict: unable to remove repository reference "centos6:baseweb" (must force) - container 71ab4a05b434 is using its referenced image c4237958fc4b
```

Not a problem, we can kill the container `71ab4a05b434`:
```
docker rm 71ab4a05b434
## now lets remove the image
docker rmi centos6:baseweb
```
Now lets start that image and attach it
```
docker start 188ca5f9f471
## output: 188ca5f9f471
docker attach 188ca5f9f471

## .bashrc
# add ther serices that we want to start
/sbin/service httpd start
/sbin/service sshd start
## ^ Update the last line
```
Commit it:
```
docker commit 188ca5f9f471 centos6:baseweb
```
Boom!

## Baisc website

Download or import a website from somewhere, i.e. [here](http://www.oswd.org/designs/browse/) and save to a new directory `docker/dockerwww` at the base (so index.html is at dockerwww).

Now lets run a baseweb container
```
docker run --name=webtest -i -t centos6/baseweb /bin/bash

Starting httpd: httpd: Could not reliably determine the server's fully qualified domain name, using 172.17.0.2 for ServerName
```

So now apache will be running at `172.17.0.2` nothing wil be there, so lets kill the image.

If for some reason this does not work (didn't work for me), you can specify/expose the ports:

```
docker run --name=webtest -i -t -p 80:80 centos6/baseweb /bin/bash
```

Now `localhost:80` will work...


```
docker rmi webtest
```

and
```
docker run --name=webtest -v /rootdocker/dockerwww:/var/www/html -i -t centos6:baseweb /bin/bash
```

Now `-v` only uses `absolute` paths. So how do you do it for local paths?
```
docker run --name=webtest -p 80:80 -v `pwd`:/var/www/html -it centos6:baseweb /bin/bash
```




