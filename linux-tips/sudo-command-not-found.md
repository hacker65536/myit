
```console
$ sudo ks3 server &
sudo: k3s: command not found
```

```console
$ grep secure_path /etc/sudoers
Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin
```

```
Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin
```

