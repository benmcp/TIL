# Useful commands

list blocks
```
lsblk
```

Check if it has a file system
```
sudo file -s /dev/xvdf
```

Assign a filesystem to a block
```
sudo mkfs -t ext4 device_name
```

Mount a block
```
sudo mkdir mount_point
sudo mount device_name mount_point
```
