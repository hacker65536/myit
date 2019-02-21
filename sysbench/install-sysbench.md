# sysbench 

https://github.com/akopytov/sysbench

require
--
```console
$ sudo yum -y install make automake libtool pkgconfig libaio-devel
$ sudo yum -y install mariadb-devel openssl-devel
$ sudo yum -y install postgresql-devel
```

install from yum
--
```console
$ sudo yum list installed "mariadb*"
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
Installed Packages
mariadb.x86_64                            3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2/2017.12
mariadb-backup.x86_64                     3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2/2017.12
mariadb-common.x86_64                     3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2/2017.12
mariadb-config.x86_64                     3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2/2017.12
mariadb-cracklib-password-check.x86_64    3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2/2017.12
mariadb-devel.x86_64                      3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2
mariadb-errmsg.x86_64                     3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2/2017.12
mariadb-gssapi-server.x86_64              3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2/2017.12
mariadb-libs.x86_64                       3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2/2017.12
mariadb-rocksdb-engine.x86_64             3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2/2017.12
mariadb-server.x86_64                     3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2/2017.12
mariadb-server-utils.x86_64               3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2/2017.12
mariadb-tokudb-engine.x86_64              3:10.2.10-2.amzn2.0.1    @amzn2extra-lamp-mariadb10.2-php7.2/2017.12
```


```console
$ curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.rpm.sh | sudo bash
$ sudo yum -y install sysbench
```

```
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
Resolving Dependencies
--> Running transaction check
---> Package sysbench.x86_64 0:1.0.15-1.el6 will be installed
--> Processing Dependency: libmysqlclient_r.so.16(libmysqlclient_16)(64bit) for package: sysbench-1.0.15-1.el6.x86_64
--> Processing Dependency: libmysqlclient_r.so.16()(64bit) for package: sysbench-1.0.15-1.el6.x86_64
--> Finished Dependency Resolution
Error: Package: sysbench-1.0.15-1.el6.x86_64 (akopytov_sysbench)
           Requires: libmysqlclient_r.so.16()(64bit)
Error: Package: sysbench-1.0.15-1.el6.x86_64 (akopytov_sysbench)
           Requires: libmysqlclient_r.so.16(libmysqlclient_16)(64bit)
 You could try using --skip-broken to work around the problem
 You could try running: rpm -Va --nofiles --nodigest
```
```console
$ sudo find / -name 'libmysqlclient*'
/usr/lib64/libmysqlclient.so
/usr/lib64/libmysqlclient.so.18
/usr/lib64/libmysqlclient_r.so
```

```console
$ ls -la /usr/lib64/libmysqlclient*
lrwxrwxrwx 1 root root 13 Jul 10 01:42 /usr/lib64/libmysqlclient_r.so -> libmariadb.so
lrwxrwxrwx 1 root root 13 Jul 10 01:42 /usr/lib64/libmysqlclient.so -> libmariadb.so
lrwxrwxrwx 1 root root 15 Jul  2 06:52 /usr/lib64/libmysqlclient.so.18 -> libmariadb.so.3
```

install from source
--
```console
$ git clone https://github.com/akopytov/sysbench.git
$ cd sysbench
$ ./autogen.sh
# Add --with-pgsql to build with PostgreSQL support
$ ./configure
$ make -j
$ sudo make install
```
