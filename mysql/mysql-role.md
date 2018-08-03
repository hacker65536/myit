# mysql role

require mysql 8.0+

```
mysql> create role 'admin';
Query OK, 0 rows affected (0.05 sec)

mysql> show grants for 'admin';
+-----------------------------------+
| Grants for admin@%                |
+-----------------------------------+
| GRANT USAGE ON *.* TO `admin`@`%` |
+-----------------------------------+
1 row in set (0.00 sec)

mysql> grant all on world_x.* to 'admin';
Query OK, 0 rows affected (0.08 sec)

mysql> show grants for 'admin';
+----------------------------------------------------+
| Grants for admin@%                                 |
+----------------------------------------------------+
| GRANT USAGE ON *.* TO `admin`@`%`                  |
| GRANT ALL PRIVILEGES ON `world_x`.* TO `admin`@`%` |
+----------------------------------------------------+
2 rows in set (0.00 sec)

mysql> create user 'worlduser'@'localhost' identified by 'f.vatnB71qjC';
Query OK, 0 rows affected (0.04 sec)

mysql> grant 'admin' to 'worlduser'@'localhost';
Query OK, 0 rows affected (0.07 sec)

mysql> show grants for 'worlduser'@'localhost';
+-----------------------------------------------+
| Grants for worlduser@localhost                |
+-----------------------------------------------+
| GRANT USAGE ON *.* TO `worlduser`@`localhost` |
| GRANT `admin`@`%` TO `worlduser`@`localhost`  |
+-----------------------------------------------+
2 rows in set (0.00 sec)

```
