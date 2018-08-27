
enable load
```
mysql> SELECT * FROM performance_schema.variables_info WHERE variable_source != 'COMPILED';
+------------------------+-----------------+------------------------------+-----------+-----------+----------------------------+----------+----------+
| VARIABLE_NAME          | VARIABLE_SOURCE | VARIABLE_PATH                | MIN_VALUE | MAX_VALUE | SET_TIME                   | SET_USER | SET_HOST |
+------------------------+-----------------+------------------------------+-----------+-----------+----------------------------+----------+----------+
| character_set_database | DYNAMIC         |                              | 0         | 0         | 2018-08-27 03:43:49.200981 | root     | NULL     |
| datadir                | GLOBAL          | /etc/mysql/my.cnf            | 0         | 0         | NULL                       | NULL     | NULL     |
| foreign_key_checks     | DYNAMIC         |                              | 0         | 0         | 2018-08-27 03:32:52.346945 | NULL     | NULL     |
| pid_file               | GLOBAL          | /etc/mysql/my.cnf            | 0         | 0         | NULL                       | NULL     | NULL     |
| secure_file_priv       | GLOBAL          | /etc/mysql/my.cnf            | 0         | 0         | NULL                       | NULL     | NULL     |
| skip_name_resolve      | GLOBAL          | /etc/mysql/conf.d/docker.cnf | 0         | 0         | NULL                       | NULL     | NULL     |
| socket                 | GLOBAL          | /etc/mysql/my.cnf            | 0         | 0         | NULL                       | NULL     | NULL     |
+------------------------+-----------------+------------------------------+-----------+-----------+----------------------------+----------+----------+
7 rows in set (0.00 sec)
```

```
mysql> SELECT @@global.secure_file_priv;
+---------------------------+
| @@global.secure_file_priv |
+---------------------------+
|                           |
+---------------------------+
1 row in set (0.00 sec)
mysql> LOAD DATA INFILE "file" INTO table mytable;
Query OK, 472 rows affected (0.04 sec)
Records: 472  Deleted: 0  Skipped: 0  Warnings: 0

```


enable mysqlimport
```
mysql> SHOW VARIABLES LIKE 'local_infile';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| local_infile  | OFF   |
+---------------+-------+
1 row in set (0.00 sec)
mysql> set global local_infile='ON';
Query OK, 0 rows affected (0.00 sec)

mysql> SHOW VARIABLES LIKE 'local_infile';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| local_infile  | ON    |
+---------------+-------+
1 row in set (0.00 sec)
```
