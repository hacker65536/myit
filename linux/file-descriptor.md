
## file handles

max number of file handles
```
cat /proc/sys/fs/file-max
```

current handles
```
cat /proc/sys/fs/file-nr
```
* the total allocated file handles.
* the number of currently used file handles (with the 2.4 kernel); or the number of currently unused file handles (with the 2.6 kernel).
* the maximum file handles that can be allocated (also found in /proc/sys/fs/file-max).
