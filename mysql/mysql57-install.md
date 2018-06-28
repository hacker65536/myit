
https://dev.mysql.com/downloads/repo/yum/
https://dev.mysql.com/doc/refman/5.7/en/linux-installation-yum-repo.html


list  
http://repo.mysql.com/

```console
$ curl -SsLO http://repo.mysql.com/mysql57-community-release-el7.rpm
$ sudo yum install -y !$:t
$ sudo yum install -y mysql-server
```

```
# yum list installed "mysql*"
Loaded plugins: langpacks, update-motd
Installed Packages
mysql-community-client.x86_64                       5.7.20-1.el7                  @mysql57-community
mysql-community-common.x86_64                       5.7.20-1.el7                  @mysql57-community
mysql-community-libs.x86_64                         5.7.20-1.el7                  @mysql57-community
mysql-community-libs-compat.x86_64                  5.7.20-1.el7                  @mysql57-community
mysql-community-server.x86_64                       5.7.20-1.el7                  @mysql57-community
mysql57-community-release.noarch                    el7-11                        installed
```

```
systemctl start mysqld
```

```
# journalctl -u mysqld
-- Logs begin at Thu 2018-01-04 09:17:56 UTC, end at Fri 2018-01-05 05:40:14 UTC. --
Jan 05 05:39:54 ip-172-31-34-252 systemd[1]: Starting MySQL Server...
Jan 05 05:40:14 ip-172-31-34-252 systemd[1]: Started MySQL Server.
```

show password
```
defpw=$(grep "temporary password" /var/log/mysqld.log | awk '{print $NF}')
echo $defpw
```

```console
$ mysql_config_editor set --login-path=local --host=localhost --user=root --password
Enter password:
```
```
$ mysql_config_editor print --all
[local]
user = root
password = *****
host = localhost
```

```
# mysql --login-path=local
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 7
Server version: 5.7.21

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

```
mysql> show databases;
ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.
```

```
yum install -y --enablerepo=epel pwgen
```

```console
$ pwgen -y 16 1
Ovi3Oosh6So/r9ee
```

```console
mysql> set password for root@localhost=password('Ovi3Oosh6So/r9ee');
Query OK, 0 rows affected, 1 warning (0.00 sec)
```

'SET PASSWORD FOR <user> = PASSWORD('<plaintext_password>')' is deprecated and will be removed in a future release. Please use SET PASSWORD FOR <user> = '<plaintext_password>' instead

```console
$ mysql_config_editor set --login-path=local --host=localhost --user=root --password
Enter password:
```
