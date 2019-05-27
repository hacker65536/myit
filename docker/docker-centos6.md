
```console
$ sudo yum install docker-io
$ sudo yum install device-mapper-event-libs
```

```console
$ sudo service docker start
```
```console
$ sudo usermod -a -G dockerroot centos
```

```console
$ ls -la /var/run/docker*
srw-rw---- 1 root root    0 May 27 10:16 /var/run/docker.sock
```

```console
$ sudo chown root:dockerroot /var/run/docker.sock
```
