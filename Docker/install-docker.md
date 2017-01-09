# Install docker on a Linux Server

Check Cento S 7 version
```
uname -r
```

Pull Docker
```
sudo su
cd /etc/yum.repos.d
vim docker.repo
```
Then in the vi/vim editor:
```
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
```

Save this by pressing `esc` then `:wq` then do an update:
```
yum update
yum install -y docker-engine
```
Now you should have the docker engine installed. 

To enable it:
```
systemctl enable docker
```

Then to start docker
```
systemctl start docker
```

To check that docker is woring, type:
```
docker -v
```
This will check the docker version. To see what images are running:
```
docker images
```
At the moment there should be nothing running.

If you change back the normal user, you will not be able to access `docker` because the permsissions is set to the `root` user.

To change this:
```
cd /var/run
ls -al dock*
```

Here you can see that the file `docker.pid` only has permissions for the `root` user

To check the user group:
```
cat /etc/group | grep docker
```

To update the user group:
```
usermod -a -G docker user
```

Now you should be able to see the user added to the group via:
```
cat /etc/group | grep docker
```

To access this now you need to logout out of the server and log back in as `user` for group/permissions update to take effect.

