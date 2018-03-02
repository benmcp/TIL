# git cheatsheet

Get git count for all branches
```
git rev-list --all --count
```

Get git count for specific branch
```
git rev-list --count <revision>

# i.e.
git rev-list --count master
```

## Create a commit with a different timestamp
```
GIT_AUTHOR_DATE=2011-01-15T12:00:00 GIT_COMMITTER_DATE=2011-01-15T12:00:00 git commit -m "Random commit"
```

See commit history of specific file
```
git log --follow <FILE_NAME>
```

See the entire git history/tree
```
git log --graph --oneline --all
```

See file changes before commit
```
git diff file.txt
```

Undo working copy of a single file
```
git checkout -- file
```
