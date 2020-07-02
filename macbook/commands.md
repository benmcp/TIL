## Restart Audio
```
sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk '{print $1}'`
```

## Copy screenshot to memory
```
cmd + ctrl + shift + 4
```

## Copy screenshot to file (initially desktop)
```
cmd + shift + 4
```

## Kill all running processes that have similar name
```
kill $(ps aux | grep 'Visual Studio Code.app' | grep -v grep | awk '{print $2}')
```
