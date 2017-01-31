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
