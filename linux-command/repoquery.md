# repoquery

## install
```bash
yum -y install yum-utils
```


## example
```
 repoquery -l yum-utils
 
/etc/bash_completion.d
/etc/bash_completion.d/yum-utils.bash
/usr/bin/debuginfo-install
/usr/bin/find-repos-of-install
/usr/bin/needs-restarting
/usr/bin/package-cleanup
/usr/bin/repo-graph
/usr/bin/repo-rss
...
```

```bash
rpm -ql
```

like as this command.  
"rpm" command can only use for the local package that are installed or downloaded.  
"repoquery" can give information from yum repositories without install package.

## options

- -i show general information about package similarly to "rpm -qi"
- -l list files in package.
- -s show package source rpm name.


```
repoquery --requires --resolve php-mysql
openssl-1:1.0.1k-15.96.amzn1.x86_64
php-pdo-0:5.3.29-1.8.amzn1.x86_64
glibc-0:2.17-157.169.amzn1.i686
mysql55-libs-0:5.5.52-1.13.amzn1.x86_64
zlib-0:1.2.8-7.18.amzn1.x86_64
glibc-0:2.17-106.168.amzn1.x86_64
```


```
repoquery -f mysql55-libs
mysql55-libs-0:5.5.51-1.11.amzn1.x86_64
mysql55-libs-0:5.5.52-1.13.amzn1.i686
mysql55-libs-0:5.5.54-1.16.amzn1.i686
mysql55-libs-0:5.5.51-1.11.amzn1.i686
mysql55-libs-0:5.5.52-1.13.amzn1.x86_64
mysql55-libs-0:5.5.54-1.16.amzn1.x86_64
```


```
repoquery  mysql55-libs
mysql55-libs-0:5.5.54-1.16.amzn1.i686
mysql55-libs-0:5.5.54-1.16.amzn1.x86_64
```

```
 repoquery -l mysql55-libs
/etc/ld.so.conf.d/mysql55-i386.conf
/usr/lib/mysql
/usr/lib/mysql/libmysqlclient.so.18
/usr/lib/mysql/libmysqlclient.so.18.0.0
/usr/share/doc/mysql55-libs-5.5.54
/usr/share/doc/mysql55-libs-5.5.54/COPYING
/usr/share/doc/mysql55-libs-5.5.54/README
/usr/share/doc/mysql55-libs-5.5.54/README.mysql-license
/etc/ld.so.conf.d/mysql55-x86_64.conf
/usr/lib64/mysql
/usr/lib64/mysql/libmysqlclient.so.18
/usr/lib64/mysql/libmysqlclient.so.18.0.0
/usr/share/doc/mysql55-libs-5.5.54
/usr/share/doc/mysql55-libs-5.5.54/COPYING
/usr/share/doc/mysql55-libs-5.5.54/README
/usr/share/doc/mysql55-libs-5.5.54/README.mysql-license
```


```
repoquery -l mysql55-libs.x86_64
/etc/ld.so.conf.d/mysql55-x86_64.conf
/usr/lib64/mysql
/usr/lib64/mysql/libmysqlclient.so.18
/usr/lib64/mysql/libmysqlclient.so.18.0.0
/usr/share/doc/mysql55-libs-5.5.54
/usr/share/doc/mysql55-libs-5.5.54/COPYING
/usr/share/doc/mysql55-libs-5.5.54/README
/usr/share/doc/mysql55-libs-5.5.54/README.mysql-license
```


