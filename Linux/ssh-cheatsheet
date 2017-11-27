# ssh cheatsheet

## How to connect to a remote server

### Via the terminal alone:
```
ssh user@xx.xx.xx.xx
```

### Via the temrinal using a key
```
ssh -i "your-key.pem" user@xx.xx.xx.xx
```

### Via a host:
First, change into your `.ssh` directory and open `config`:
```
cd ~/.ssh
vi config
```

Insert and save the following:
```
host example
  Hostname xx.xx.xx.xx
  User user
  IdentityFile ~/.ssh/sample.pem
```

Then run:
```
ssh example
```

### Via a host through an intermediate server (jumphost)
```
Host target-server
  Hostname TARGET
  identityfile ~/.ssh/sample.pem
  ForwardAgent yes
  IdentitiesOnly yes
  ProxyCommand ssh user@JUMPHOST_IP nc %h %p
  User user
```
Then run:
```
ssh target-server
```

### How to copy a file from a remote server and save it locally (using above):
```
scp target-server:/var/some/file.txt .
```

```

### How to leave:
```
exit
```

