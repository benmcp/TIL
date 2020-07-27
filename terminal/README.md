Simple Linux/Unix Terminal Operations
============

### Get size of directory
```
du -sh file_path
```

### Find php.ini file
```
php -i | grep php.ini
```

### List files only
```
ls -p | grep -v /
```

### Kill all instances with KEYWORD in name
```
kill $(ps aux | grep "Visual Studio Code" | grep -v grep | awk '{print $2}')
```
