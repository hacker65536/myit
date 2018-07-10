
before install from source




prepare

require lua path ,if install from source
```console
$ sysbench \
--db-driver=mysql \
--mysql-host=localhost \
--mysql-user=testdbuser \
--mysql-password=password \
--mysql-db=testdb \
/usr/local/share/sysbench/oltp_read_only.lua prepare

sysbench 1.1.0-a4938af (using bundled LuaJIT 2.1.0-beta3)

Creating table 'sbtest1'...
Inserting 10000 records into 'sbtest1'
Creating a secondary index on 'sbtest1'...
```

error (without lua path) 
```console
$ sysbench --db-driver=mysql \
--mysql-host=localhost \
--mysql-user=testdbuser \
--mysql-password=password \
--mysql-db=testdb \
prepare
sysbench 1.1.0-a4938af (using bundled LuaJIT 2.1.0-beta3)

FATAL: Cannot find benchmark 'prepare': no such built-in test, file or module
```

```
MariaDB [testdb]> show tables;
+------------------+
| Tables_in_testdb |
+------------------+
| sbtest1          |
+------------------+
1 row in set (0.01 sec)

MariaDB [testdb]> show create table sbtest1\G
*************************** 1. row ***************************
       Table: sbtest1
Create Table: CREATE TABLE `sbtest1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` int(11) NOT NULL DEFAULT 0,
  `c` char(120) NOT NULL DEFAULT '',
  `pad` char(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `k_1` (`k`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=latin1
1 row in set (0.01 sec)
```
