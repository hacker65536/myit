
show all
```console
$ sysctl -a
```

change option
```console
$ sysctl -w kernel.domainname="example.com"
```

load from file
```
$ sysctl -p /etc/sysctl.conf
```

show value
```console
$ sysctl -n kernel.hostname
```
