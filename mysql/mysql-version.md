# mysql version



```mysql
mysql> select @@version;
+-----------+
| @@version |
+-----------+
| 8.0.16    |
+-----------+
1 row in set (0.00 sec)

mysql> select version();
+-----------+
| version() |
+-----------+
| 8.0.16    |
+-----------+
1 row in set (0.00 sec)
```

```
mysql> \s
--------------
mysql  Ver 8.0.16 for Linux on x86_64 (MySQL Community Server - GPL)

Connection id:          10
Current database:
Current user:           root@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         8.0.16 MySQL Community Server - GPL
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    utf8mb4
Conn.  characterset:    utf8mb4
UNIX socket:            /var/run/mysqld/mysqld.sock
Uptime:                 37 min 30 sec

Threads: 2  Questions: 15  Slow queries: 0  Opens: 131  Flush tables: 3  Open tables: 35  Queries per second avg: 0.006
--------------
```

```
$ mysqladmin --version
mysqladmin  Ver 8.0.16 for Linux on x86_64 (MySQL Community Server - GPL)
```
