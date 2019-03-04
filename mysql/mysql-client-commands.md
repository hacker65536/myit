# mysql client commands

https://dev.mysql.com/doc/refman/8.0/en/mysql-commands.html

```
mysql> help

For information about MySQL products and services, visit:
   http://www.mysql.com/
For developer information, including the MySQL Reference Manual, visit:
   http://dev.mysql.com/
To buy MySQL Enterprise support, training, or other products, visit:
   https://shop.mysql.com/

List of all MySQL commands:
Note that all text commands must be first on line and end with ';'
?         (\?) Synonym for `help'.
clear     (\c) Clear the current input statement.
connect   (\r) Reconnect to the server. Optional arguments are db and host.
delimiter (\d) Set statement delimiter.
edit      (\e) Edit command with $EDITOR.
ego       (\G) Send command to mysql server, display result vertically.
exit      (\q) Exit mysql. Same as quit.
go        (\g) Send command to mysql server.
help      (\h) Display this help.
nopager   (\n) Disable pager, print to stdout.
notee     (\t) Don't write into outfile.
pager     (\P) Set PAGER [to_pager]. Print the query results via PAGER.
print     (\p) Print current command.
prompt    (\R) Change your mysql prompt.
quit      (\q) Quit mysql.
rehash    (\#) Rebuild completion hash.
source    (\.) Execute an SQL script file. Takes a file name as an argument.
status    (\s) Get status information from the server.
system    (\!) Execute a system shell command.
tee       (\T) Set outfile [to_outfile]. Append everything into given outfile.
use       (\u) Use another database. Takes database name as argument.
charset   (\C) Switch to another charset. Might be needed for processing binlog with multi-byte charsets.
warnings  (\W) Show warnings after every statement.
nowarning (\w) Don't show warnings after every statement.
resetconnection(\x) Clean session context.

For server side help, type 'help contents'
```

## connect

```
mysql> \u sbtest
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> \r
Connection id:    39
Current database: sbtest

mysql> \r
Connection id:    40
Current database: sbtest
```


```
mysql> show global status like 'Connections';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| Connections   | 41    |
+---------------+-------+
1 row in set (0.00 sec)

mysql> \r
Connection id:    42
Current database: *** NONE ***

mysql> show global status like 'Connections';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| Connections   | 42    |
+---------------+-------+
1 row in set (0.00 sec)

mysql> \r
Connection id:    43
Current database: *** NONE ***

mysql> show global status like 'Connections';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| Connections   | 43    |
+---------------+-------+
1 row in set (0.00 sec)
```



## print

```
mysql> show databases \p ;
--------------
show databases
--------------

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sbtest             |
| sys                |
+--------------------+
5 rows in set (0.00 sec)
```

```console
$ mysql -h 127.0.0.1 -u root -p -e 'show databases\p'
Enter password:
--------------
show databases
--------------

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sbtest             |
| sys                |
+--------------------+
```


## prompt

| Option                                     | Description                                                      |
|--------------------------------------------|------------------------------------------------------------------|
| \C                                         | The current connection identifier                                |
| \c                                         | A counter that increments for each statement you issue           |
| \D                                         | The full current date                                            |
| \d                                         | The default database                                             |
| \h                                         | The server host                                                  |
| \l                                         | The current delimiter                                            |
| \m                                         | Minutes of the current time                                      |
| \n                                         | A newline character                                              |
| \O                                         | The current month in three-letter format (Jan, Feb, …)           |
| \o                                         | The current month in numeric format                              |
| \P                                         | am/pm                                                            |
| \p                                         | The current TCP/IP port or socket file                           |
| \R                                         | The current time, in 24-hour military time (0–23)                |
| \r                                         | The current time, standard 12-hour time (1–12)                   |
| \S                                         | Semicolon                                                        |
| \s                                         | Seconds of the current time                                      |
| \t                                         | A tab character                                                  |
| \U                                         | Your full user_name@host_name account name                       |
| \u                                         | Your user name                                                   |
| \v                                         | The server version                                               |
| \w                                         | The current day of the week in three-letter format (Mon, Tue, …) |
| \Y                                         | The current year, four digits                                    |
| \y                                         | The current year, two digits                                     |
| \\_                                         | A space                                                          |
| \\                                          | A space (a space follows the backslash)                          |
| \\'                                         | Single quote                                                     |
| \\"                                         | Double quote                                                     |
| \\\\                                         | A literal \ backslash character                                  |
| \x                                         | x, for any “x” not listed above                                  |


```
mysql> prompt (\u@\h) [\d]>\_
PROMPT set to '(\u@\h) [\d]>\_'
(root@127.0.0.1) [(none)]> \usbtest
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
(root@127.0.0.1) [sbtest]> prompt
Returning to default PROMPT of mysql>
```

```console
$ export MYSQL_PS1="(\u@\h) [\d]> "
```
```console
$ mysql -h 127.0.0.1 -u root -p sbtest
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 44
Server version: 8.0.15 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

(root@127.0.0.1) [sbtest]>
```

```
$ env | grep MYSQL_PS1
$ mysql -h 127.0.0.1 -u root -p --prompt="(\u@\h) [\d]> " sbtest
Enter password:
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 47
Server version: 8.0.15 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

(root@127.0.0.1) [sbtest]>
```

```ini
[mysql]
prompt="\\r:\\m:\\s> "
```

```
mysql> prompt (\c)(\p)(\l)(\h)(\v)(\D)(\U)>\_
PROMPT set to '(\c)(\p)(\l)(\h)(\v)(\D)(\U)>\_'
(1)(3306)(;)(127.0.0.1)(8.0.15)(Mon Mar  4 04:56:20 2019)(root@172.17.0.1)>
```

## system

```
mysql> \!
ERROR:
Usage: \! shell-command
mysql> \! date
Mon Mar  4 02:34:48 UTC 2019
mysql> \! docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                              NAMES
baae67c77c16        mysql:8             "docker-entrypoint.s…"   5 days ago          Up 5 days           0.0.0.0:3306->3306/tcp, 0.0.0.0:33060->33060/tcp   mysql8
```


## tee
```
mysql> \T /tmp/dump.txt
Logging to file '/tmp/dump.txt'
mysql> show processlist;
+----+-----------------+------------------+------+---------+--------+------------------------+------------------+
| Id | User            | Host             | db   | Command | Time   | State                  | Info             |
+----+-----------------+------------------+------+---------+--------+------------------------+------------------+
|  4 | event_scheduler | localhost        | NULL | Daemon  | 510290 | Waiting on empty queue | NULL             |
| 26 | root            | 172.17.0.1:49186 | NULL | Query   |      0 | starting               | show processlist |
+----+-----------------+------------------+------+---------+--------+------------------------+------------------+
2 rows in set (0.00 sec)

mysql> \t
Outfile disabled.
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sbtest             |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> \u sbtest
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> \T /tmp/dump.txt
Logging to file '/tmp/dump.txt'
mysql> select * from sbtest1 limit 3;
+----+------+-------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------+
| id | k    | c                                                                                                                       | pad                                                         |
+----+------+-------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------+
|  1 | 4993 | 83868641912-28773972837-60736120486-75162659906-27563526494-20381887404-41576422241-93426793964-56405065102-33518432330 | 67847967377-48000963322-62604785301-91415491898-96926520291 |
|  2 | 5020 | 38014276128-25250245652-62722561801-27818678124-24890218270-18312424692-92565570600-36243745486-21199862476-38576014630 | 23183251411-36241541236-31706421314-92007079971-60663066966 |
|  3 | 5044 | 33973744704-80540844748-72700647445-87330233173-87249600839-07301471459-22846777364-58808996678-64607045326-48799346817 | 38615512647-91458489257-90681424432-95014675832-60408598704 |
+----+------+-------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------+
3 rows in set (0.00 sec)

mysql> \q
Bye
```
```console
$ cat /tmp/dump.txt
mysql> show processlist;
+----+-----------------+------------------+------+---------+--------+------------------------+------------------+
| Id | User            | Host             | db   | Command | Time   | State                  | Info             |
+----+-----------------+------------------+------+---------+--------+------------------------+------------------+
|  4 | event_scheduler | localhost        | NULL | Daemon  | 510290 | Waiting on empty queue | NULL             |
| 26 | root            | 172.17.0.1:49186 | NULL | Query   |      0 | starting               | show processlist |
+----+-----------------+------------------+------+---------+--------+------------------------+------------------+
2 rows in set (0.00 sec)

mysql> \t
mysql> select * from sbtest1 limit 3;
+----+------+-------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------+
| id | k    | c                                                                                                                       | pad                                                         |
+----+------+-------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------+
|  1 | 4993 | 83868641912-28773972837-60736120486-75162659906-27563526494-20381887404-41576422241-93426793964-56405065102-33518432330 | 67847967377-48000963322-62604785301-91415491898-96926520291 |
|  2 | 5020 | 38014276128-25250245652-62722561801-27818678124-24890218270-18312424692-92565570600-36243745486-21199862476-38576014630 | 23183251411-36241541236-31706421314-92007079971-60663066966 |
|  3 | 5044 | 33973744704-80540844748-72700647445-87330233173-87249600839-07301471459-22846777364-58808996678-64607045326-48799346817 | 38615512647-91458489257-90681424432-95014675832-60408598704 |
+----+------+-------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------+
3 rows in set (0.00 sec)

mysql> \q
```

## warnings

```
mysql> SELECT 1/0;
+------+
| 1/0  |
+------+
| NULL |
+------+
1 row in set, 1 warning (0.00 sec)

mysql> \W
Show warnings enabled.
mysql> SELECT 1/0;
+------+
| 1/0  |
+------+
| NULL |
+------+
1 row in set, 1 warning (0.00 sec)

Warning (Code 1365): Division by 0
```

```
mysql> \w
Show warnings disabled.
mysql> select 1/0;
+------+
| 1/0  |
+------+
| NULL |
+------+
1 row in set, 1 warning (0.00 sec)

mysql> show warnings;
+---------+------+---------------+
| Level   | Code | Message       |
+---------+------+---------------+
| Warning | 1365 | Division by 0 |
+---------+------+---------------+
1 row in set (0.00 sec)
```
