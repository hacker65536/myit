# sysbench-custom-query

## sysbench install
```console
$ git clone https://github.com/akopytov/sysbench.git
$ cd sysbench
$ ./autogen.sh
$ ./configure
$ make -j
$ sudo make install
```

## server
```console
$ docker run --rm  -it -d --name mysql5 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysql5 mysql:5
```


## test 
```console
$ cd /tmp
$ curl -SsL -O http://downloads.mysql.com/docs/world_x-db.zip
$ unzip !$:t
unzip world_x-db.zip
Archive:  world_x-db.zip
   creating: world_x-db/
  inflating: world_x-db/README.txt
  inflating: world_x-db/world_x.sql
$ cd !$:r
$ mysql -h 127.0.0.1 -u root -p <world_x.sql
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


`sample.lua`

```lua
#!/usr/bin/env sysbench

require("oltp_common")
math.randomseed(os.time())

function thread_init()
  drv = sysbench.sql.driver()
  con = drv:connect()
end

function event()

  sysbench.opt.tables="city"
  local r = math.random(4079)
  con:query("select * from city where ID ="..r)
  check_reconnect()
end
```

```
mysql> SET GLOBAL general_log = 'ON';
Query OK, 0 rows affected (0.00 sec)

mysql> SET GLOBAL general_log_file = '/var/log/mysql/general-query.log';
Query OK, 0 rows affected (0.00 sec)
```


```
$ sysbench --db-driver=mysql --mysql-user=root --mysql-password=mysql5 --mysql-host=127.0.0.1 --mysql-db=world_x sample.lua run
```

```
SQL statistics:
    queries performed:
        read:                            49485
        write:                           0
        other:                           0
        total:                           49485
    transactions:                        49485  (4948.09 per sec.)
    queries:                             49485  (4948.09 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      4948.0870
    time elapsed:                        10.0008s
    total number of events:              49485

Latency (ms):
         min:                                    0.15
         avg:                                    0.20
         max:                                    9.36
         95th percentile:                        0.22
         sum:                                 9908.11

Threads fairness:
    events (avg/stddev):           49485.0000/0.00
    execution time (avg/stddev):   9.9081/0.00
```


`/var/log/mysql/general-query.log`
```
2019-03-05T05:54:57.911129Z        18 Query     select * from city where ID =1315
2019-03-05T05:54:57.911320Z        18 Query     select * from city where ID =3629
2019-03-05T05:54:57.911530Z        18 Query     select * from city where ID =2069
2019-03-05T05:54:57.911722Z        18 Query     select * from city where ID =3451
2019-03-05T05:54:57.911913Z        18 Query     select * from city where ID =1365
2019-03-05T05:54:57.912103Z        18 Query     select * from city where ID =712
2019-03-05T05:54:57.912316Z        18 Query     select * from city where ID =2967
2019-03-05T05:54:57.912505Z        18 Query     select * from city where ID =493
2019-03-05T05:54:57.912738Z        18 Query     select * from city where ID =2565
2019-03-05T05:54:57.912953Z        18 Query     select * from city where ID =1747
2019-03-05T05:54:57.913141Z        18 Query     select * from city where ID =215
2019-03-05T05:54:57.913344Z        18 Query     select * from city where ID =3286
2019-03-05T05:54:57.913535Z        18 Query     select * from city where ID =749
2019-03-05T05:54:57.913745Z        18 Query     select * from city where ID =903
2019-03-05T05:54:57.913949Z        18 Query     select * from city where ID =516
2019-03-05T05:54:57.914118Z        18 Query     select * from city where ID =1797
2019-03-05T05:54:57.914307Z        18 Query     select * from city where ID =3502
2019-03-05T05:54:57.914497Z        18 Query     select * from city where ID =3049
2019-03-05T05:54:57.914687Z        18 Query     select * from city where ID =344
2019-03-05T05:54:57.914898Z        18 Query     select * from city where ID =1421
2019-03-05T05:54:57.915093Z        18 Query     select * from city where ID =726
2019-03-05T05:54:57.915301Z        18 Query     select * from city where ID =707
2019-03-05T05:54:57.915497Z        18 Query     select * from city where ID =1389
2019-03-05T05:54:57.915693Z        18 Query     select * from city where ID =3868
2019-03-05T05:54:57.915885Z        18 Query     select * from city where ID =2532
2019-03-05T05:54:57.916090Z        18 Query     select * from city where ID =3277
2019-03-05T05:54:57.916289Z        18 Query     select * from city where ID =1674
2019-03-05T05:54:57.916481Z        18 Query     select * from city where ID =2045
2019-03-05T05:54:57.916686Z        18 Query     select * from city where ID =69
2019-03-05T05:54:57.916875Z        18 Query     select * from city where ID =466
```
