
install mysql5.7-community repo on based el7
```console 
$ curl -SsLO https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
$ sudo yum install -y !$:t
```
install mysql-server
```console
$ sudo yum install -y mysql-server
```

```console
$ sudo yum list installed "mysql*"
Loaded plugins: langpacks, priorities, update-motd
11 packages excluded due to repository priority protections
Installed Packages
mysql-community-client.x86_64                       5.7.22-1.el7                  @mysql57-community
mysql-community-common.x86_64                       5.7.22-1.el7                  @mysql57-community
mysql-community-libs.x86_64                         5.7.22-1.el7                  @mysql57-community
mysql-community-libs-compat.x86_64                  5.7.22-1.el7                  @mysql57-community
mysql-community-server.x86_64                       5.7.22-1.el7                  @mysql57-community
mysql57-community-release.noarch                    el7-11                        installed
```
start service
```console
$ sudo systemctl start mysqld
$ journalctl -u mysqld --no-pager
-- Logs begin at Mon 2018-05-28 01:40:32 UTC, end at Mon 2018-05-28 01:53:47 UTC. --
May 28 01:53:32 ip-172-31-27-247.us-east-2.compute.internal systemd[1]: Starting MySQL Server...
May 28 01:53:47 ip-172-31-27-247.us-east-2.compute.internal systemd[1]: Started MySQL Server.
```

set password
```console
$ defpw=$(grep "temporary password" /var/log/mysqld.log | awk '{print $NF}');echo $defpw
```
```console
$ mysql_config_editor set --login-path=local --host=localhost --user=root --password
Enter password:
```
```console
$ mysql_config_editor print --all
[local]
user = root
password = *****
host = localhost
```

set alias
```console
$ echo "alias mysql='mysql --login-path=local'" >> ~/.bashrc
$ bash -l
```

```console
$ mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 2
Server version: 5.7.22

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.
```

change password
```consle
$ sudo yum install -y expect
$ mkpasswd -s 1 -l 12
c3Gc4Rfcser&
```
```console
mysql> SET PASSWORD FOR `root`@`localhost`= 'c3Gc4Rfcser&';
Query OK, 0 rows affected (0.00 sec)
```
```console
$ mysql_config_editor set --login-path=local --host=localhost --user=root --password
Enter password:
WARNING : 'local' path already exists and will be overwritten.
 Continue? (Press y|Y for Yes, any other key for No) : y
```

```console
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)
```


set character set
```console
mysql> show variables like '%char%';
+--------------------------------------+----------------------------+
| Variable_name                        | Value                      |
+--------------------------------------+----------------------------+
| character_set_client                 | utf8                       |
| character_set_connection             | utf8                       |
| character_set_database               | latin1                     |
| character_set_filesystem             | binary                     |
| character_set_results                | utf8                       |
| character_set_server                 | latin1                     |
| character_set_system                 | utf8                       |
| character_sets_dir                   | /usr/share/mysql/charsets/ |
| validate_password_special_char_count | 1                          |
+--------------------------------------+----------------------------+
9 rows in set (0.00 sec)
```
set and restart
```
[mysqld]
character-set-server=utf8
collation-server=utf8_general_ci
```

```console
mysql> show variables like '%char%';
+--------------------------------------+----------------------------+
| Variable_name                        | Value                      |
+--------------------------------------+----------------------------+
| character_set_client                 | utf8                       |
| character_set_connection             | utf8                       |
| character_set_database               | utf8                       |
| character_set_filesystem             | binary                     |
| character_set_results                | utf8                       |
| character_set_server                 | utf8                       |
| character_set_system                 | utf8                       |
| character_sets_dir                   | /usr/share/mysql/charsets/ |
| validate_password_special_char_count | 1                          |
+--------------------------------------+----------------------------+
9 rows in set (0.00 sec)
```

install mecab  
https://dev.mysql.com/doc/refman/5.7/en/fulltext-search-mecab.html

```console
$ cd
$ sudo yum install -y gcc-c++
$ curl -SsL -o mecab-0.996.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE"
$ tar zxvf mecab-0.996.tar.gz
$ cd !$:r:r
$ ./configuremake check
$ make
$ make check
$ sudo make install
```
```console
$ cd
$ curl -SsL -o mecab-ipadic-2.7.0-20070801.tar.gz "https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM"
$ tar zxvf !:3
$ cd !$:r:r
$ ./configure --with-charset=utf8
$ make
$ sudo make install
$ ls -la /usr/local/etc/mecabrc
-rw-r--r-- 1 root root 295 May 28 03:57 /usr/local/etc/mecabrc
```
```
[mysqld]
loose-mecab-rc-file=/usr/local/etc/mecabrc
```
```console
mysql> install plugin mecab SONAME 'libpluginmecab.so';
Query OK, 0 rows affected (0.00 sec)

mysql> show status like'%mecab%';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| mecab_charset | utf8  |
+---------------+-------+
1 row in set (0.00 sec)
```
