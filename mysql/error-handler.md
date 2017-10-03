## Errors and solutions

### Situation
Computer experienced a forced restart, MySQL did not shut down properly.

### Diagnosis
In the mysql_error_log.err, the following error statement occurs: `Attempted to open a previously opened tablespace ... Cannot open tablespace XXXXXX`

### Solution
If using MAMP, create the file `/Applications/MAMP/conf/my.cnf`
```
[mysqld]
innodb_force_recovery = 1
```

This will force innodb into recovery mode and resolve the above error.
