
## default 

```
mysql> show variables like '%char%';
+--------------------------+----------------------------------------------+
| Variable_name            | Value                                        |
+--------------------------+----------------------------------------------+
| character_set_client     | utf8                                         |
| character_set_connection | utf8                                         |
| character_set_database   | latin1                                       |
| character_set_filesystem | binary                                       |
| character_set_results    | utf8                                         |
| character_set_server     | latin1                                       |
| character_set_system     | utf8                                         |
| character_sets_dir       | /rdsdbbin/mariadb-10.0.24.R1/share/charsets/ |
+--------------------------+----------------------------------------------+
8 rows in set (0.02 sec)


mysql> show variables like '%collation%';
+----------------------+-------------------+
| Variable_name        | Value             |
+----------------------+-------------------+
| collation_connection | utf8_general_ci   |
| collation_database   | latin1_swedish_ci |
| collation_server     | latin1_swedish_ci |
+----------------------+-------------------+
3 rows in set (0.00 sec)

mysql> show create database wikidb;
+----------+-------------------------------------------------------------------+
| Database | Create Database                                                   |
+----------+-------------------------------------------------------------------+
| wikidb   | CREATE DATABASE `wikidb` /*!40100 DEFAULT CHARACTER SET latin1 */ |
+----------+-------------------------------------------------------------------+
1 row in set (0.01 sec)


mysql> select * from information_schema.schemata;
+--------------+--------------------+----------------------------+------------------------+----------+
| CATALOG_NAME | SCHEMA_NAME        | DEFAULT_CHARACTER_SET_NAME | DEFAULT_COLLATION_NAME | SQL_PATH |
+--------------+--------------------+----------------------------+------------------------+----------+
| def          | information_schema | utf8                       | utf8_general_ci        | NULL     |
| def          | innodb             | latin1                     | latin1_swedish_ci      | NULL     |
| def          | mysql              | latin1                     | latin1_swedish_ci      | NULL     |
| def          | performance_schema | utf8                       | utf8_general_ci        | NULL     |
| def          | wikidb             | latin1                     | latin1_swedish_ci      | NULL     |
+--------------+--------------------+----------------------------+------------------------+----------+
5 rows in set (0.00 sec)

```

## change

create parametergroup

* characeter_set_client=utf8mb4
* character_set_connection=utf8mb4
* character_set_database=utf8mb4
* character_set_results=utf8mb4
* character_set_server=utf8mb4
* collation_conncetion=utf8mb4_general_ci

```
mysql> drop database wikidb;
Query OK, 0 rows affected (0.00 sec)

mysql> create database wikidb;
Query OK, 1 row affected (0.01 sec)

mysql> select * from information_schema.schemata;
+--------------+--------------------+----------------------------+------------------------+----------+
| CATALOG_NAME | SCHEMA_NAME        | DEFAULT_CHARACTER_SET_NAME | DEFAULT_COLLATION_NAME | SQL_PATH |
+--------------+--------------------+----------------------------+------------------------+----------+
| def          | information_schema | utf8                       | utf8_general_ci        | NULL     |
| def          | innodb             | utf8mb4                    | utf8mb4_general_ci     | NULL     |
| def          | mysql              | utf8mb4                    | utf8mb4_general_ci     | NULL     |
| def          | performance_schema | utf8                       | utf8_general_ci        | NULL     |
| def          | wikidb             | utf8mb4                    | utf8mb4_general_ci     | NULL     |
+--------------+--------------------+----------------------------+------------------------+----------+
5 rows in set (0.01 sec)

mysql> show variables like '%char%';
+--------------------------+----------------------------------------------+
| Variable_name            | Value                                        |
+--------------------------+----------------------------------------------+
| character_set_client     | utf8                                         |
| character_set_connection | utf8                                         |
| character_set_database   | utf8mb4                                      |
| character_set_filesystem | binary                                       |
| character_set_results    | utf8                                         |
| character_set_server     | utf8mb4                                      |
| character_set_system     | utf8                                         |
| character_sets_dir       | /rdsdbbin/mariadb-10.0.24.R1/share/charsets/ |
+--------------------------+----------------------------------------------+
8 rows in set (0.00 sec)

mysql> set names utf8mb4;
Query OK, 0 rows affected (0.00 sec)

mysql> show variables like '%char%';
+--------------------------+----------------------------------------------+
| Variable_name            | Value                                        |
+--------------------------+----------------------------------------------+
| character_set_client     | utf8mb4                                      |
| character_set_connection | utf8mb4                                      |
| character_set_database   | utf8mb4                                      |
| character_set_filesystem | binary                                       |
| character_set_results    | utf8mb4                                      |
| character_set_server     | utf8mb4                                      |
| character_set_system     | utf8                                         |
| character_sets_dir       | /rdsdbbin/mariadb-10.0.24.R1/share/charsets/ |
+--------------------------+----------------------------------------------+
8 rows in set (0.00 sec)
```


or
```
mysql> set global character_set_server=utf8, session character_set_server=utf8;
mysql> set global character_set_database=utf8, SESSION character_set_database=utf8
```

