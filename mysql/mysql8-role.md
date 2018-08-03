# mysql role

https://dev.mysql.com/doc/refman/8.0/en/roles.html


require mysql 8.0+

```
mysql> create role 'developer', 'read' ,'write';
Query OK, 0 rows affected (0.01 sec)

mysql> grant all on world_x.* to 'developer';
Query OK, 0 rows affected (0.00 sec)

mysql> grant select on world_x.* to 'read';
Query OK, 0 rows affected (0.07 sec)

mysql> grant insert, update, delete on world_x.* to 'write';
Query OK, 0 rows affected (0.04 sec)

mysql> show grants for 'developer';
+--------------------------------------------------------+
| Grants for developer@%                                 |
+--------------------------------------------------------+
| GRANT USAGE ON *.* TO `developer`@`%`                  |
| GRANT ALL PRIVILEGES ON `world_x`.* TO `developer`@`%` |
+--------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> show grants for 'read';
+-------------------------------------------+
| Grants for read@%                         |
+-------------------------------------------+
| GRANT USAGE ON *.* TO `read`@`%`          |
| GRANT SELECT ON `world_x`.* TO `read`@`%` |
+-------------------------------------------+
2 rows in set (0.00 sec)

mysql> show grants for 'write';
+------------------------------------------------------------+
| Grants for write@%                                         |
+------------------------------------------------------------+
| GRANT USAGE ON *.* TO `write`@`%`                          |
| GRANT INSERT, UPDATE, DELETE ON `world_x`.* TO `write`@`%` |
+------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> create user 'dev'@'localhost' identified by 'f.vatnB71qjC';
Query OK, 0 rows affected (0.06 sec)

mysql> create user 'read'@'localhost' identified by 'clqT92v+Xing';
Query OK, 0 rows affected (0.05 sec)

mysql> create user 'rw'@'localhost' identified by 'ta7jb2azhUI$';
Query OK, 0 rows affected (0.06 sec)

mysql> grant 'developer' to 'dev'@'localhost';
Query OK, 0 rows affected (0.06 sec)

mysql> grant 'read' to 'read'@'localhost';
Query OK, 0 rows affected (0.02 sec)

mysql> grant 'read', 'write' to 'rw'@'localhost';
Query OK, 0 rows affected (0.02 sec)


mysql> show grants for 'dev'@'localhost';
+--------------------------------------------+
| Grants for dev@localhost                   |
+--------------------------------------------+
| GRANT USAGE ON *.* TO `dev`@`localhost`    |
| GRANT `developer`@`%` TO `dev`@`localhost` |
+--------------------------------------------+
2 rows in set (0.00 sec)

mysql> show grants for 'read'@'localhost';
+------------------------------------------+
| Grants for read@localhost                |
+------------------------------------------+
| GRANT USAGE ON *.* TO `read`@`localhost` |
| GRANT `read`@`%` TO `read`@`localhost`   |
+------------------------------------------+
2 rows in set (0.00 sec)

mysql> show grants for 'rw'@'localhost';
+--------------------------------------------------+
| Grants for rw@localhost                          |
+--------------------------------------------------+
| GRANT USAGE ON *.* TO `rw`@`localhost`           |
| GRANT `read`@`%`,`write`@`%` TO `rw`@`localhost` |
+--------------------------------------------------+
2 rows in set (0.00 sec)
```

```
mysql> show grants for 'dev'@'localhost' using 'developer';
+----------------------------------------------------------+
| Grants for dev@localhost                                 |
+----------------------------------------------------------+
| GRANT USAGE ON *.* TO `dev`@`localhost`                  |
| GRANT ALL PRIVILEGES ON `world_x`.* TO `dev`@`localhost` |
| GRANT `developer`@`%` TO `dev`@`localhost`               |
+----------------------------------------------------------+
3 rows in set (0.00 sec)
```

```
mysql> set default role all to 'dev'@'localhost', 'read'@'localhost' , 'rw'@'localhost';
Query OK, 0 rows affected (0.05 sec)
```


```
$ mysql -u read -p
mysql> select current_role();
+----------------+
| current_role() |
+----------------+
| `read`@`%`     |
+----------------+
1 row in set (0.01 sec)

mysql> select * from world_x.city limit 5;
+----+----------------+-------------+---------------+-------------------------+
| ID | Name           | CountryCode | District      | Info                    |
+----+----------------+-------------+---------------+-------------------------+
|  1 | Kabul          | AFG         | Kabol         | {"Population": 1780000} |
|  2 | Qandahar       | AFG         | Qandahar      | {"Population": 237500}  |
|  3 | Herat          | AFG         | Herat         | {"Population": 186800}  |
|  4 | Mazar-e-Sharif | AFG         | Balkh         | {"Population": 127800}  |
|  5 | Amsterdam      | NLD         | Noord-Holland | {"Population": 731200}  |
+----+----------------+-------------+---------------+-------------------------+
5 rows in set (0.01 sec)
```
```
