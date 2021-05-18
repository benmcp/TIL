type below:

```
brew update
brew install redis
```

To have launchd start redis now and restart at login:
```
brew services start redis
```

to stop it, just run:

```
brew services stop redis
```

Or, if you don't want/need a background service you can just run:

```
redis-server /usr/local/etc/redis.conf
```

Test if Redis server is running.

```
redis-cli ping
```
If it replies “PONG”, then it’s good to go!

Location of Redis configuration file.

```
/usr/local/etc/redis.conf
```

Uninstall Redis and its files.

```
brew uninstall redis
rm ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
```

## Redis commands

"log into" cache
```
redis-cli
```

Get all keys
```
KEYS *
```

Get like keys
```
KEYS *name*
---
1) "firstname"
2) "lastname"
```

Get specific keys
```
KEYS firstname
---
1) "firstname"
```

## Install REDIS on Linux
```
# install and make redis
sudo yum -y install gcc make # install GCC compiler
cd /usr/local/src 
sudo wget http://download.redis.io/redis-stable.tar.gz
sudo tar xvzf redis-stable.tar.gz
sudo rm -f redis-stable.tar.gz
cd redis-stable
sudo yum groupinstall "Development Tools"
sudo make distclean
sudo make
sudo yum install -y tcl

# test
sudo make test

# copy across
sudo cp src/redis-server /usr/local/bin/
sudo cp src/redis-cli /usr/local/bin/

```

