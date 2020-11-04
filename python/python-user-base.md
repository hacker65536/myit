
```console
$ python3 -m site --user-base
/home/ec2-user/.local  # amazn2


$ python3 -m site --user-base
/Users/USER/Library/Python/3.8 # mac
```

```
$ export PATH=$(python3 -m site --user-base)/bin:$PATH
```

```
$ pip3 install --user ANYPACKGE
```

