# mysqlsh
https://dev.mysql.com/doc/mysql-shell/8.0/en/mysql-shell-features.html



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
```
mysql> SHOW PLUGINS;
+----------------------------+----------+--------------------+---------+---------+
| Name                       | Status   | Type               | Library | License |
+----------------------------+----------+--------------------+---------+---------+
| binlog                     | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| mysql_native_password      | ACTIVE   | AUTHENTICATION     | NULL    | GPL     |
| sha256_password            | ACTIVE   | AUTHENTICATION     | NULL    | GPL     |
| caching_sha2_password      | ACTIVE   | AUTHENTICATION     | NULL    | GPL     |
| sha2_cache_cleaner         | ACTIVE   | AUDIT              | NULL    | GPL     |
| MyISAM                     | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| InnoDB                     | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| INNODB_TRX                 | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CMP                 | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CMP_RESET           | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CMPMEM              | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CMPMEM_RESET        | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CMP_PER_INDEX       | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CMP_PER_INDEX_RESET | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_BUFFER_PAGE         | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_BUFFER_PAGE_LRU     | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_BUFFER_POOL_STATS   | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_TEMP_TABLE_INFO     | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_METRICS             | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_FT_DEFAULT_STOPWORD | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_FT_DELETED          | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_FT_BEING_DELETED    | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_FT_CONFIG           | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_FT_INDEX_CACHE      | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_FT_INDEX_TABLE      | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_TABLES              | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_TABLESTATS          | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_INDEXES             | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_TABLESPACES         | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_COLUMNS             | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_VIRTUAL             | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| INNODB_CACHED_INDEXES      | ACTIVE   | INFORMATION SCHEMA | NULL    | GPL     |
| TempTable                  | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| MEMORY                     | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| PERFORMANCE_SCHEMA         | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| CSV                        | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| MRG_MYISAM                 | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| FEDERATED                  | DISABLED | STORAGE ENGINE     | NULL    | GPL     |
| BLACKHOLE                  | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| ARCHIVE                    | ACTIVE   | STORAGE ENGINE     | NULL    | GPL     |
| ngram                      | ACTIVE   | FTPARSER           | NULL    | GPL     |
| mysqlx                     | ACTIVE   | DAEMON             | NULL    | GPL     |
| mysqlx_cache_cleaner       | ACTIVE   | AUDIT              | NULL    | GPL     |
+----------------------------+----------+--------------------+---------+---------+
43 rows in set (0.0006 sec)
```
or

```
mysql> select * from information_schema.plugins where plugin_name = 'mysqlx';
+-------------+----------------+---------------+-------------+---------------------+----------------+------------------------+---------------+--------------------+----------------+-------------+
| PLUGIN_NAME | PLUGIN_VERSION | PLUGIN_STATUS | PLUGIN_TYPE | PLUGIN_TYPE_VERSION | PLUGIN_LIBRARY | PLUGIN_LIBRARY_VERSION | PLUGIN_AUTHOR | PLUGIN_DESCRIPTION | PLUGIN_LICENSE | LOAD_OPTION |
+-------------+----------------+---------------+-------------+---------------------+----------------+------------------------+---------------+--------------------+----------------+-------------+
| mysqlx      | 1.0            | ACTIVE        | DAEMON      | 80012.0             | NULL           | NULL                   | Oracle Corp   | X Plugin for MySQL | GPL            | ON          |
+-------------+----------------+---------------+-------------+---------------------+----------------+------------------------+---------------+--------------------+----------------+-------------+
1 row in set (0.0007 sec)

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
```
mysql> source /tmp/world_x-db/world_x.sql;
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
command list
```
The following shell commands are available:

 - \                   Start multi-line input when in SQL mode.
 - \connect    (\c)    Connects the shell to a MySQL server and assigns the
                       global session.
 - \exit               Exits the MySQL Shell, same as \quit.
 - \help       (\?,\h) Prints help information about a specific topic.
 - \history            View and edit command line history.
 - \js                 Switches to JavaScript processing mode.
 - \nowarnings (\w)    Don't show warnings after every statement.
 - \option             Allows working with the available shell options.
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

```
 MySQL  localhost:33060+ ssl  information_schema  JS > session
<Session:root@localhost>
 MySQL  localhost:33060+ ssl  information_schema  JS > \status
MySQL Shell version 8.0.12

Session type:                 X
Connection Id:                25
Default schema:
Current schema:               information_schema
Current user:                 root@localhost
SSL:                          Cipher in use: DHE-RSA-AES128-GCM-SHA256 TLSv1.2
Using delimiter:              ;
Server version:               8.0.12 MySQL Community Server - GPL
Protocol version:             X protocol
Client library:               8.0.12
Connection:                   localhost via TCP/IP
TCP port:                     33060
Server characterset:          utf8mb4
Schema characterset:          utf8
Client characterset:          utf8mb4
Conn. characterset:           utf8mb4
Uptime:                       1 hour 38 min 35.0000 sec
```

```mysqlsh
 MySQL  localhost:33060+ ssl  JS > session.getSchemas();
[
    <Schema:information_schema>,
    <Schema:mysql>,
    <Schema:performance_schema>,
    <Schema:sys>,
    <Schema:testdb>,
    <Schema:world_x>
]
 MySQL  localhost:33060+ ssl  JS > db=session.getSchema("world_x")
<Schema:world_x>
 MySQL  localhost:33060+ ssl  JS > db.getTables()
[
    <Table:city>,
    <Table:country>,
    <Table:countrylanguage>
]
 MySQL  localhost:33060+ ssl  JS > tbl=db.getTable("city")
<Table:city>
 MySQL  localhost:33060+ ssl  JS > tbl.select().limit(10)
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
10 rows in set (0.0005 sec)
```
```
MySQL  localhost:33060+ ssl  JS > \sql
Switching to SQL mode... Commands end with ;
 MySQL  localhost:33060+ ssl  SQL > use world_x
Default schema set to `world_x`.
Fetching table and column names from `world_x` for auto-completion... Press ^C to stop.

 MySQL  localhost:33060+ ssl  world_x  SQL > show tables;
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
