# mysqlsh
https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-features.html



## install 
```
$ sudo yum install mysql-shell
```
```
$ sudo yum list installed "mysql-shell*"
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
192 packages excluded due to repository priority protections
Installed Packages
mysql-shell.x86_64                       8.0.12-1.el7                       @mysql-tools-community
```

## sample

https://dev.mysql.com/doc/index-other.html

```console
$ cd /tmp
$ curl -SsL -O http://downloads.mysql.com/docs/world_x-db.zip
$ unzip !$:t
unzip world_x-db.zip
Archive:  world_x-db.zip
   creating: world_x-db/
  inflating: world_x-db/README.txt
  inflating: world_x-db/world_x.sql
```
```
mysql> source /tmp/world_x-db/world_x.sql;
```
```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| world_x            |
+--------------------+
5 rows in set (0.00 sec)
mysql> use world_x
Database changed
mysql> show tables
+-------------------+
| Tables_in_world_x |
+-------------------+
| city              |
| country           |
| countryinfo       |
| countrylanguage   |
+-------------------+
4 rows in set (0.00 sec)
```
