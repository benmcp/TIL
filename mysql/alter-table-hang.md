# How to Alter Table if it hangs

```
# see what processes are running
SHOW PROCESSLIST;

# kill target processes
KILL 15;


# SELECT * FROM information_schema.EVENTS;

ALTER TABLE some_table
MODIFY some_column
varchar(999)

```
