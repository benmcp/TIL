# Clear part of stash

Language: Python
```
import os

# get git statshes
list_git_stash_cmd: str = 'git stash list'

output: list = os.popen(list_git_stash_cmd).readlines()

# get 10 earliest stashes
last_hundred_output: list = output[-10:]

# reverse such that we start from the earliest stash
last_hundred_output.reverse()

# loop through and drop these stashes
for output in last_hundred_output:
    start_only = output.split(':')[0]
    del_command: str = "git stash drop " + start_only
    os.popen(del_command).readlines()
    print(del_command)
```
