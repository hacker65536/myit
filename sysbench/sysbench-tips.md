

```
./my.lua --config-file=config --mysql-host=host --threads=1 run --tables=1 --table-size=20000
```
```
mysql> show status like 'Prepared_stmt_count';
+---------------------+-------+
| Variable_name       | Value |
+---------------------+-------+
| Prepared_stmt_count | 6     |
+---------------------+-------+
1 row in set (0.00 sec)
```

```
 ./my.lua --config-file=config --mysql-host=host --threads=1 run --tables=10 --table-size=20000
```
```
mysql> show status like 'Prepared_stmt_count';
+---------------------+-------+
| Variable_name       | Value |
+---------------------+-------+
| Prepared_stmt_count | 51    |
+---------------------+-------+
1 row in set (0.00 sec)
```

```
./my.lua --config-file=config --mysql-host=host --threads=10 run --tables=1 --table-size=20000
```

```
mysql> show status like 'Prepared_stmt_count';
+---------------------+-------+
| Variable_name       | Value |
+---------------------+-------+
| Prepared_stmt_count | 60    |
+---------------------+-------+
1 row in set (0.00 sec)
```

```
./my.lua --config-file=config --mysql-host=host --threads=10 run --tables=10 --table-size=20000
```
```
mysql> show status like 'Prepared_stmt_count';
+---------------------+-------+
| Variable_name       | Value |
+---------------------+-------+
| Prepared_stmt_count | 510   |
+---------------------+-------+
1 row in set (0.01 sec)
```

```
./my.lua --config-file=config --mysql-host=host --threads=10 run --tables=11 --table-size=20000
```
```
mysql> show status like 'Prepared_stmt_count';
+---------------------+-------+
| Variable_name       | Value |
+---------------------+-------+
| Prepared_stmt_count | 560   |
+---------------------+-------+
1 row in set (0.00 sec)
```
```
./my.lua --config-file=config --mysql-host=host --threads=5 run --tables=11 --table-size=20000
```
```
mysql> show status like 'Prepared_stmt_count';
+---------------------+-------+
| Variable_name       | Value |
+---------------------+-------+
| Prepared_stmt_count | 280   |
+---------------------+-------+
1 row in set (0.00 sec)
```


(threads * tables * 5 ) + threads = Prepared_stmt_count
