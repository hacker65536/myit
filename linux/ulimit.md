

-n     The maximum number of open file descriptors (most systems do not allow this value to be set)
```
ulimit -n
```

becuse it's a builtin
```
sudo -u USER /bin/bash -c 'ulimit -n'
```

```
cat /proc/$(pgrep <PROCESS> | head -1 )/limits
```
