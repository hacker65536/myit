install
----
client: local    
server: docker


install client
```
yum install https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
yum install mysql
```
```
mysql --version
mysql  Ver 8.0.11 for Linux on x86_64 (MySQL Community Server - GPL)
```

run server
```
docker run --rm -d --name mysql8  -e MYSQL_ROOT_PASSWORD=my-secret-pw -p 3306:3306  mysql:8
```

config 
```
mysql_config_editor set --login-path=local --host=127.0.0.1 --user=root --password
```



sample
----------

```
git clone https://github.com/datacharmer/test_db.git
cd !$:t:r
```

```
alias mysql='mysql --login-path=local'
```
```
mysql < employees.sql
```

```
# mysql -t < test_employees_md5.sql
+----------------------+
| INFO                 |
+----------------------+
| TESTING INSTALLATION |
+----------------------+
+--------------+------------------+----------------------------------+
| table_name   | expected_records | expected_crc                     |
+--------------+------------------+----------------------------------+
| employees    |           300024 | 4ec56ab5ba37218d187cf6ab09ce1aa1 |
| departments  |                9 | d1af5e170d2d1591d776d5638d71fc5f |
| dept_manager |               24 | 8720e2f0853ac9096b689c14664f847e |
| dept_emp     |           331603 | ccf6fe516f990bdaa49713fc478701b7 |
| titles       |           443308 | bfa016c472df68e70a03facafa1bc0a8 |
| salaries     |          2844047 | fd220654e95aea1b169624ffe3fca934 |
+--------------+------------------+----------------------------------+
+--------------+------------------+----------------------------------+
| table_name   | found_records    | found_crc                        |
+--------------+------------------+----------------------------------+
| employees    |           300024 | 4ec56ab5ba37218d187cf6ab09ce1aa1 |
| departments  |                9 | d1af5e170d2d1591d776d5638d71fc5f |
| dept_manager |               24 | 8720e2f0853ac9096b689c14664f847e |
| dept_emp     |           331603 | ccf6fe516f990bdaa49713fc478701b7 |
| titles       |           443308 | bfa016c472df68e70a03facafa1bc0a8 |
| salaries     |          2844047 | fd220654e95aea1b169624ffe3fca934 |
+--------------+------------------+----------------------------------+
+--------------+---------------+-----------+
| table_name   | records_match | crc_match |
+--------------+---------------+-----------+
| employees    | OK            | ok        |
| departments  | OK            | ok        |
| dept_manager | OK            | ok        |
| dept_emp     | OK            | ok        |
| titles       | OK            | ok        |
| salaries     | OK            | ok        |
+--------------+---------------+-----------+
+------------------+
| computation_time |
+------------------+
| 00:00:15         |
+------------------+
+---------+--------+
| summary | result |
+---------+--------+
| CRC     | OK     |
| count   | OK     |
+---------+--------+
```


```
select *,row_number() over h as 'older'  from employees window h as (order by hire_date) order by emp_no asc limit 20;
+--------+------------+------------+-------------+--------+------------+--------+
| emp_no | birth_date | first_name | last_name   | gender | hire_date  | older  |
+--------+------------+------------+-------------+--------+------------+--------+
|  10001 | 1953-09-02 | Georgi     | Facello     | M      | 1986-06-26 |  52960 |
|  10002 | 1964-06-02 | Bezalel    | Simmel      | F      | 1985-11-21 |  31209 |
|  10003 | 1959-12-03 | Parto      | Bamford     | M      | 1986-08-28 |  59220 |
|  10004 | 1954-05-01 | Chirstian  | Koblick     | M      | 1986-12-01 |  68462 |
|  10005 | 1955-01-21 | Kyoichi    | Maliniak    | M      | 1989-09-12 | 156467 |
|  10006 | 1953-04-20 | Anneke     | Preusig     | F      | 1989-06-02 | 148493 |
|  10007 | 1957-05-23 | Tzvetan    | Zielinski   | F      | 1989-02-10 | 139694 |
|  10008 | 1958-02-19 | Saniya     | Kalloufi    | M      | 1994-09-15 | 261842 |
|  10009 | 1952-04-19 | Sumant     | Peac        | F      | 1985-02-18 |   1836 |
|  10010 | 1963-06-01 | Duangkaew  | Piveteau    | F      | 1989-08-24 | 155024 |
|  10011 | 1953-11-07 | Mary       | Sluis       | F      | 1990-01-22 | 166354 |
|  10012 | 1960-10-04 | Patricio   | Bridgland   | M      | 1992-12-18 | 232707 |
|  10013 | 1963-06-07 | Eberhardt  | Terkki      | M      | 1985-10-20 |  27910 |
|  10014 | 1956-02-12 | Berni      | Genin       | M      | 1987-03-11 |  78038 |
|  10015 | 1959-08-19 | Guoxiang   | Nooteboom   | M      | 1987-07-02 |  88422 |
|  10016 | 1961-05-02 | Kazuhito   | Cappelletti | M      | 1995-01-27 | 266972 |
|  10017 | 1958-07-06 | Cristinel  | Bouloucos   | F      | 1993-08-03 | 244143 |
|  10018 | 1954-06-19 | Kazuhide   | Peha        | F      | 1987-04-03 |  80146 |
|  10019 | 1953-01-23 | Lillian    | Haddadi     | M      | 1999-04-30 | 299295 |
|  10020 | 1952-12-24 | Mayuko     | Warwick     | M      | 1991-01-26 | 192082 |
+--------+------------+------------+-------------+--------+------------+--------+
20 rows in set (0.48 sec)
```
