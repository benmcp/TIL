# Basic Linux commands Cheatsheet

## Vim

Search Forwards
```
:/search_term
```
Search Backwards
```
:?search_term
```
## Run bash commands

If you need to run a bash command but pass a variable:

```
$ ngrok help
```

Update `~/.bash_profile`

```
alias ngrok=ngrok_function

ngrok_function() {
  /Applications/ngrok $1
}
```

## Run commands after window has closed
```
nohup function > custom-out.log &
## or 
screen function
```
## Watch changes in file (i.e. error logs)
```
tail -f -n 10 error.log
```

## Check free disk space
```
df -h
```

## See size of files on your directories:
```
du -sh ./*
```

## Get environment variables
```
printenv
```
## Move hidden files
```
mv rand-folder/.[!.]* ./somewhere-else/
```

## Clipboard
copy directory to Clipboard:
```
pwd|pbcopy
```
cd into directory in Clipboard
```
cd $(pbpaste)
```
