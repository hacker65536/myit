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
