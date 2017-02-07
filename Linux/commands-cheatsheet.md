# Basic Linux commands Cheatsheet

## Vim

Search Forwards
```
:/search_term

Search Backwards

:?search_term

## Run bash commands
````

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
