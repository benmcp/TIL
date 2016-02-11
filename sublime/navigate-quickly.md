# Navigate Quickly in Sublime

Sublime Text is an awesome editor due to its collection of libraries and themes. However it can be difficult a navigate around. A simple solution without downloading extensive libraries is to do the following:

## To open a particlar file:
```sublime
Windows	-> Ctrl + P
Mac 	-> Cmd + P
```

## To search for every instance of a file:
```sublime
Windows	-> Ctrl + Shift + F
Mac 	-> Cmd + Shfit + F
```

However this causes sublime to look through every file, which, given the node_mdoules and bower_components folders, this can really chew through your ram. To resovlve this, in the 'Where' input field insert the following:

```sublime
"path/to/project/folder/, -*/node_modules/*,  -*/bower_components/*"
```

The dash (-) excludes any directory that contains node_modules and bower_components.