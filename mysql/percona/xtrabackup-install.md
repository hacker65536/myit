
https://www.percona.com/downloads/percona-release/redhat/latest/
```
$ sudo yum install https://www.percona.com/redir/downloads/percona-release/redhat/latest/percona-release-0.1-6.noarch.rpm
```

```
$ sudo yum install percona-xtrabackup-24
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
amzn2-core                                                                   | 2.4 kB  00:00:00
amzn2extra-docker                                                            | 1.3 kB  00:00:00
http://repo.percona.com/release/2/RPMS/noarch/repodata/repomd.xml: [Errno 14] HTTP Error 404 - Not Found
Trying other mirror.
```


-----


directly

```console
$ sudo yum install https://www.percona.com/downloads/XtraBackup/Percona-XtraBackup-2.4.12/binary/redhat/7/x86_64/percona-xtrabackup-24-2.4.12-1.el7.x86_64.rpm
```
