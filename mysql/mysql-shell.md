# mysqlsh
ref
--
https://dev.mysql.com/doc/mysql-shell/8.0/en/

https://dev.mysql.com/doc/dev/mysqlsh-api-javascript/1.0/classmysqlsh_1_1mysqlx_1_1_base_session.html

## install 
```
$ sudo yum install mysql-shell
```
```
$ sudo yum list installed "mysql-shell*"
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
192 packages excluded due to repository priority protections
Installed Packages
mysql-shell.x86_64                       8.0.12-1.el7                       @mysql-tools-community
```


### start sever
require docker

```console
$ docker run --rm  -it -d --name mysql8 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysql8 mysql:8

```
```console
$ mysql -h 127.0.0.1 -u root -p
```
```
mysql> select @@version;
+-----------+
| @@version |
+-----------+
| 8.0.15    |
+-----------+
1 row in set (0.00 sec)
```

### plugins 
```
mysql> SHOW PLUGINS;
+---------------------------------+----------+--------------------+---------+---------+
| Name                            | Status   | Type               | Library | License |
+---------------------------------+----------+--------------------+---------+---------+
| binlog                          | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| mysql_native_password           | ACTIVE   | AUTHENTICATION     | NULL    | GPL     |
| sha256_password                 | ACTIVE   | AUTHENTICATION     | NULL    | GPL     |
| caching_sha2_password           | ACTIVE   | AUTHENTICATION     | NULL    | GPL     |
| sha2_cache_cleaner              | ACTIVE   | AUDIT              | NULL    | GPL     |
| CSV                             | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| MEMORY                          | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| InnoDB                          | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| INNODB_TRX                      | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CMP                      | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CMP_RESET                | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CMPMEM                   | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CMPMEM_RESET             | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CMP_PER_INDEX            | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CMP_PER_INDEX_RESET      | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_BUFFER_PAGE              | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_BUFFER_PAGE_LRU          | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_BUFFER_POOL_STATS        | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_TEMP_TABLE_INFO          | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_METRICS                  | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_FT_DEFAULT_STOPWORD      | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_FT_DELETED               | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_FT_BEING_DELETED         | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_FT_CONFIG                | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_FT_INDEX_CACHE           | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_FT_INDEX_TABLE           | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_TABLES                   | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_TABLESTATS               | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_INDEXES                  | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_TABLESPACES              | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_COLUMNS                  | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_VIRTUAL                  | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CACHED_INDEXES           | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_SESSION_TEMP_TABLESPACES | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| MyISAM                          | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| MRG_MYISAM                      | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| PERFORMANCE_SCHEMA              | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| TempTable                       | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| ARCHIVE                         | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| BLACKHOLE                       | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| FEDERATED                       | DISABLED | STORAGE ENGINE     | NULL    | GPL     |
| ngram                           | ACTIVE   | FTPARSER           | NULL    | GPL     |
| mysqlx                          | ACTIVE   | DAEMON             | NULL    | GPL     |
| mysqlx_cache_cleaner            | ACTIVE   | AUDIT              | NULL    | GPL     |
+---------------------------------+----------+--------------------+---------+---------+
44 rows in set (0.00 sec)
```

### mysqlx

```
mysql> select * from information_schema.plugins where plugin_name = 'mysqlx';
+-------------+----------------+---------------+-------------+---------------------+----------------+------------------------+---------------+--------------------+----------------+-------------+
| PLUGIN_NAME | PLUGIN_VERSION | PLUGIN_STATUS | PLUGIN_TYPE | PLUGIN_TYPE_VERSION | PLUGIN_LIBRARY | PLUGIN_LIBRARY_VERSION | PLUGIN_AUTHOR | PLUGIN_DESCRIPTION | PLUGIN_LICENSE | LOAD_OPTION |
+-------------+----------------+---------------+-------------+---------------------+----------------+------------------------+---------------+--------------------+----------------+-------------+
| mysqlx      | 1.0            | ACTIVE        | DAEMON      | 80015.0             | NULL           | NULL                   | Oracle Corp   | X Plugin for MySQL | GPL            | ON          |
+-------------+----------------+---------------+-------------+---------------------+----------------+------------------------+---------------+--------------------+----------------+-------------+
1 row in set (0.00 sec)
```
## sample

https://dev.mysql.com/doc/index-other.html

```console
$ cd /tmp
$ curl -SsL -O http://downloads.mysql.com/docs/world_x-db.zip
$ unzip !$:t
unzip world_x-db.zip
Archive:  world_x-db.zip
   creating: world_x-db/
  inflating: world_x-db/README.txt
  inflating: world_x-db/world_x.sql
```

```console
$ mysql -h 127.0.0.1 -u root -p <world_x.sql
```
```mysql
-- mysql> source /tmp/world_x-db/world_x.sql;
```
```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| world_x            |
+--------------------+
5 rows in set (0.00 sec)
mysql> use world_x
Database changed
mysql> show tables
+-------------------+
| Tables_in_world_x |
+-------------------+
| city              |
| country           |
| countryinfo       |
| countrylanguage   |
+-------------------+
4 rows in set (0.00 sec)
```

## mysqlsh

```console
$ mysqlsh
```

### help
```console
 MySQL  JS > \help
 ```

### command list
```
SHELL COMMANDS

The shell commands allow executing specific operations including updating the
shell configuration.

The following shell commands are available:

 - \                   Start multi-line input when in SQL mode.
 - \connect    (\c)    Connects the shell to a MySQL server and assigns the
                       global session.
 - \exit               Exits the MySQL Shell, same as \quit.
 - \help       (\?,\h) Prints help information about a specific topic.
 - \history            View and edit command line history.
 - \js                 Switches to JavaScript processing mode.
 - \nopager            Disables the current pager.
 - \nowarnings (\w)    Don't show warnings after every statement.
 - \option             Allows working with the available shell options.
 - \pager      (\P)    Sets the current pager.
 - \py                 Switches to Python processing mode.
 - \quit       (\q)    Exits the MySQL Shell.
 - \reconnect          Reconnects the global session.
 - \rehash             Refresh the autocompletion cache.
 - \source     (\.)    Loads and executes a script from a file.
 - \sql                Switches to SQL processing mode.
 - \status     (\s)    Print information about the current global session.
 - \use        (\u)    Sets the active schema.
 - \warnings   (\W)    Show warnings after every statement.
```

### connect to mysql server

```console
$ mysqlsh
MySQL Shell 8.0.15

Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.

```
```
 MySQL  JS > \status
MySQL Shell version 8.0.15

Not Connected.
```
```
 MySQL  JS > \connect root@127.0.0.1
Creating a session to 'root@127.0.0.1'
Please provide the password for 'root@127.0.0.1': ******
Save password for 'root@127.0.0.1'? [Y]es/[N]o/Ne[v]er (default No): Y
Fetching schema names for autocompletion... Press ^C to stop.
Your MySQL connection id is 13
Server version: 8.0.15 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
```
```
 MySQL  127.0.0.1:3306 ssl  JS > \status
MySQL Shell version 8.0.15

Session type:                 Classic
Connection Id:                15
Current schema:
Current user:                 root@172.17.0.1
SSL:                          Cipher in use: ECDHE-RSA-AES128-GCM-SHA256 TLSv1.2
Using delimiter:              ;
Server version:               8.0.15 MySQL Community Server - GPL
Protocol version:             classic 10
Client library:               8.0.15
Connection:                   127.0.0.1 via TCP/IP
TCP port:                     3306
Server characterset:          utf8mb4
Schema characterset:          utf8mb4
Client characterset:          utf8mb4
Conn. characterset:           utf8mb4
Compression:                  Disabled
Uptime:                       52 min 28.0000 sec

Threads: 2  Questions: 105  Slow queries: 0  Opens: 315  Flush tables: 2  Open tables: 140  Queries per second avg: 0.033
```
```
 MySQL  127.0.0.1:3306 ssl  JS > \connect root@127.0.0.1?compression=true
Creating a session to 'root@127.0.0.1?compression=true'
Fetching schema names for autocompletion... Press ^C to stop.
Closing old connection...
Your MySQL connection id is 16
Server version: 8.0.15 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.

 MySQL  127.0.0.1:3306 ssl  JS > \s
MySQL Shell version 8.0.15

Session type:                 Classic
Connection Id:                16
Current schema:
Current user:                 root@172.17.0.1
SSL:                          Cipher in use: ECDHE-RSA-AES128-GCM-SHA256 TLSv1.2
Using delimiter:              ;
Server version:               8.0.15 MySQL Community Server - GPL
Protocol version:             classic 10
Client library:               8.0.15
Connection:                   127.0.0.1 via TCP/IP
TCP port:                     3306
Server characterset:          utf8mb4
Schema characterset:          utf8mb4
Client characterset:          utf8mb4
Conn. characterset:           utf8mb4
Compression:                  Enabled
Uptime:                       53 min 41.0000 sec

Threads: 2  Questions: 114  Slow queries: 0  Opens: 319  Flush tables: 2  Open tables: 140  Queries per second avg: 0.035
```


```
 MySQL  127.0.0.1:3306 ssl  JS > session.getSchemas();
Invalid object member getSchemas (AttributeError)
```
```
 MySQL  127.0.0.1:3306 ssl  JS > session
<ClassicSession:root@127.0.0.1:3306>
```
```
 MySQL  127.0.0.1:3306 ssl  JS > \connect mysqlx://root@127.0.0.1
Creating an X protocol session to 'root@127.0.0.1'
MySQL Error 2002: Connection refused connecting to 127.0.0.1:33060
```

restart server to listen x protocal
--
```console
$ docker stop mysql8
$ docker run --rm  -it -d --name mysql8 -p 3306:3306 -p 33060:33060 -e MYSQL_ROOT_PASSWORD=mysql8 mysql:8
```
```console
$ docker ps -f publish=33060
CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS              PORTS                                              NAMES
c178244e7a9c        mysql:8             "docker-entrypoint.s…"   About a minute ago   Up About a minute   0.0.0.0:3306->3306/tcp, 0.0.0.0:33060->33060/tcp   mysql8
```

```
$ mysqlsh root@127.0.0.1
MySQL Shell 8.0.15

Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.
Oracle is a registered trademark of Oracle Corporation and/or its affiliates.
Other names may be trademarks of their respective owners.

Type '\help' or '\?' for help; '\quit' to exit.
Creating a session to 'root@127.0.0.1'
Fetching schema names for autocompletion... Press ^C to stop.
Your MySQL connection id is 13 (X protocol)
Server version: 8.0.15 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.   
```
```
 MySQL  127.0.0.1:33060+ ssl  JS > \s
MySQL Shell version 8.0.15

Session type:                 X
Connection Id:                8
Default schema:
Current schema:
Current user:                 root@172.17.0.1
SSL:                          Cipher in use: ECDHE-RSA-AES128-GCM-SHA256 TLSv1.2
Using delimiter:              ;
Server version:               8.0.15 MySQL Community Server - GPL
Protocol version:             X protocol
Client library:               8.0.15
Connection:                   127.0.0.1 via TCP/IP
TCP port:                     33060
Server characterset:          utf8mb4
Schema characterset:          utf8mb4
Client characterset:          utf8mb4
Conn. characterset:           utf8mb4
Uptime:                       2 min 5.0000 sec
```
```
 MySQL  127.0.0.1:33060+ ssl  JS > session
<Session:root@127.0.0.1:33060>
```
#### store db again
--
```
$ mysql -h 127.0.0.1 -u root -p <world_x.sql
```

js mode
--
```
 MySQL  127.0.0.1:33060+ ssl  JS > session.getSchemas();
[
    <Schema:information_schema>,
    <Schema:mysql>,
    <Schema:performance_schema>,
    <Schema:sys>,
    <Schema:world_x>
]
```



```
 MySQL  127.0.0.1:33060+ ssl  JS > db=session.getSchema("world_x");
<Schema:world_x>
```
```
 MySQL  127.0.0.1:33060+ ssl  JS > db.getTables();
[
    <Table:city>,
    <Table:country>,
    <Table:countrylanguage>
]
```
``` 
MySQL  127.0.0.1:33060+ ssl  JS > tbl=db.getTable("city");
<Table:city>
```
```
 MySQL  127.0.0.1:33060+ ssl  JS > tbl.select().limit(10)
+----+----------------+-------------+---------------+-------------------------+
| ID | Name           | CountryCode | District      | Info                    |
+----+----------------+-------------+---------------+-------------------------+
|  1 | Kabul          | AFG         | Kabol         | {"Population": 1780000} |
|  2 | Qandahar       | AFG         | Qandahar      | {"Population": 237500}  |
|  3 | Herat          | AFG         | Herat         | {"Population": 186800}  |
|  4 | Mazar-e-Sharif | AFG         | Balkh         | {"Population": 127800}  |
|  5 | Amsterdam      | NLD         | Noord-Holland | {"Population": 731200}  |
|  6 | Rotterdam      | NLD         | Zuid-Holland  | {"Population": 593321}  |
|  7 | Haag           | NLD         | Zuid-Holland  | {"Population": 440900}  |
|  8 | Utrecht        | NLD         | Utrecht       | {"Population": 234323}  |
|  9 | Eindhoven      | NLD         | Noord-Brabant | {"Population": 201843}  |
| 10 | Tilburg        | NLD         | Noord-Brabant | {"Population": 193238}  |
+----+----------------+-------------+---------------+-------------------------+
10 rows in set (0.0012 sec)
```

sql mode
--
```
 MySQL  127.0.0.1:33060+ ssl  JS > \sql
Switching to SQL mode... Commands end with ;
```
```
 MySQL  127.0.0.1:33060+ ssl  SQL > use world_x
Default schema set to `world_x`.
Fetching table and column names from `world_x` for auto-completion... Press ^C to stop.
```
```
 MySQL  127.0.0.1:33060+ ssl  world_x  SQL > show tables;
+-------------------+
| Tables_in_world_x |
+-------------------+
| city              |
| country           |
| countryinfo       |
| countrylanguage   |
+-------------------+
4 rows in set (0.0012 sec)
```
```
 MySQL  127.0.0.1:33060+ ssl  world_x  SQL > select * from city limit 10;
+----+----------------+-------------+---------------+-------------------------+
| ID | Name           | CountryCode | District      | Info                    |
+----+----------------+-------------+---------------+-------------------------+
|  1 | Kabul          | AFG         | Kabol         | {"Population": 1780000} |
|  2 | Qandahar       | AFG         | Qandahar      | {"Population": 237500}  |
|  3 | Herat          | AFG         | Herat         | {"Population": 186800}  |
|  4 | Mazar-e-Sharif | AFG         | Balkh         | {"Population": 127800}  |
|  5 | Amsterdam      | NLD         | Noord-Holland | {"Population": 731200}  |
|  6 | Rotterdam      | NLD         | Zuid-Holland  | {"Population": 593321}  |
|  7 | Haag           | NLD         | Zuid-Holland  | {"Population": 440900}  |
|  8 | Utrecht        | NLD         | Utrecht       | {"Population": 234323}  |
|  9 | Eindhoven      | NLD         | Noord-Brabant | {"Population": 201843}  |
| 10 | Tilburg        | NLD         | Noord-Brabant | {"Population": 193238}  |
+----+----------------+-------------+---------------+-------------------------+
10 rows in set (0.0006 sec)
```