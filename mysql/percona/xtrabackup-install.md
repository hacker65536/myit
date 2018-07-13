xtrabackup install
===============

https://www.percona.com/doc/percona-xtrabackup/LATEST/installation/yum_repo.html

install repo
-------
https://www.percona.com/downloads/percona-release/redhat/latest/

```
$ sudo yum install https://www.percona.com/redir/downloads/percona-release/redhat/latest/percona-release-0.1-6.noarch.rpm
```

if using amazonlinux2 $releasever = 2
```console
$ sudo yum install percona-xtrabackup-24
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
amzn2-core                                                                   | 2.4 kB  00:00:00
amzn2extra-docker                                                            | 1.3 kB  00:00:00
http://repo.percona.com/release/2/RPMS/noarch/repodata/repomd.xml: [Errno 14] HTTP Error 404 - Not Found
Trying other mirror.
```

change to 7
```console
$ sudo sed -e 's/$releasever/7/g' -i /etc/yum.repos.d/percona-release.repo
```
```console
$ sudo yum list | grep xtrabackup
percona-xtrabackup.x86_64               2.3.10-1.el7                  percona-release-x86_64
percona-xtrabackup-22.x86_64            2.2.13-1.el7                  percona-release-x86_64
percona-xtrabackup-22-debuginfo.x86_64  2.2.13-1.el7                  percona-release-x86_64
percona-xtrabackup-24.x86_64            2.4.12-1.el7                  percona-release-x86_64
percona-xtrabackup-24-debuginfo.x86_64  2.4.12-1.el7                  percona-release-x86_64
percona-xtrabackup-debuginfo.x86_64     2.3.10-1.el7                  percona-release-x86_64
percona-xtrabackup-test.x86_64          2.3.10-1.el7                  percona-release-x86_64
percona-xtrabackup-test-22.x86_64       2.2.13-1.el7                  percona-release-x86_64
percona-xtrabackup-test-24.x86_64       2.4.12-1.el7                  percona-release-x86_64
```


install percona-xtrabackup-24
-----

```console
$ sudo yum install percona-xtrabackup-24
```

```
$ sudo yum list installed "*xtrabackup*"
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
4 packages excluded due to repository priority protections
Installed Packages
percona-xtrabackup-24.x86_64             2.4.12-1.el7             @percona-release-x86_64
```

```console
$ repoquery -lf percona-xtrabackup-24 | grep bin | sort -u
/usr/bin/innobackupex
/usr/bin/xbcloud
/usr/bin/xbcloud_osenv
/usr/bin/xbcrypt
/usr/bin/xbstream
/usr/bin/xtrabackup
```

```console
$ yum-config-manager --disable percona-release-x86_64
```
