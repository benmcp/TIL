Collection of python pieces I've used in the past.

Get list of modules accessible
```
import pkgutil
available_modules = list(map(lambda x: x.name, pkgutil.iter_modules()))
```

Get difference between two lists
```
list_a = ['a', 'b', 'c']
list_b = ['a', 'b', 'c', 'd']
items_not_in_a = [item for item in list_b if item not in list_a]
```

Attach a directory to current location
```
dir_with_modules_i_want = str('../somewhere/else')
sys.path.insert(0, dir_with_modules_i_want)
```

Show list of available paths:
```
import sys
print(sys.path)
```
