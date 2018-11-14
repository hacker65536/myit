
## help

options
---------
-  --threads=N                     number of threads to use [1]
-  --events=N                      limit for total number of events [0]
-  --time=N                        limit for total execution time in seconds [10]
-  --warmup-time=N                 execute events for this many seconds with statistics disabled before the actual benchmark run with statistics enabled [0]
-  --forced-shutdown=STRING        number of seconds to wait after the --time limit before forcing shutdown, or 'off' to disable [off]
-  --thread-stack-size=SIZE        size of stack per thread [64K]
-  --thread-init-timeout=N         wait time in seconds for worker threads to initialize [30]
-  --rate=N                        average transactions rate. 0 for unlimited rate [0]
-  --report-interval=N             periodically report intermediate statistics with a specified interval in seconds. 0 disables intermediate reports [0]
-  --report-checkpoints=[LIST,...] dump full statistics and reset all counters at specified points in time. The argument is a list of comma-separated values representing the amount of time in seconds elapsed from start of test when report checkpoint(s) must be performed. Report checkpoints are off by default. []
-  --debug[=on|off]                print more debugging info [off]
-  --validate[=on|off]             perform validation checks where possible [off]
-  --help[=on|off]                 print help and exit [off]
-  --version[=on|off]              print version and exit [off]
-  --config-file=FILENAME          File containing command line options
-  --luajit-cmd=STRING             perform LuaJIT control command. This option is equivalent to 'luajit -j'. See LuaJIT documentation for more information


mysql options
------------

- --mysql-host=[LIST,...]          MySQL server host [localhost]
- --mysql-port=[LIST,...]          MySQL server port [3306]
- --mysql-socket=[LIST,...]        MySQL socket
- --mysql-user=STRING              MySQL user [sbtest]
- --mysql-password=STRING          MySQL password []
- --mysql-db=STRING                MySQL database name [sbtest]
- --mysql-ssl[=on|off]             use SSL connections, if available in the client library [off]
- --mysql-ssl-key=STRING           path name of the client private key file
- --mysql-ssl-ca=STRING            path name of the CA file
- --mysql-ssl-cert=STRING          path name of the client public key certificate file
- --mysql-ssl-cipher=STRING        use specific cipher for SSL connections []
- --mysql-compression[=on|off]     use compression, if available in the client library [off]
- --mysql-debug[=on|off]           trace all client library calls [off]
- --mysql-ignore-errors=[LIST,...] list of errors to ignore, or "all" [1213,1020,1205]
- --mysql-dry-run[=on|off]         Dry run, pretend that all MySQL client API calls are successful without executing them [off]

tests
------
- fileio
  - file-num
  - file-total-size
  - file-test-mode
  - file-io-mode
  - file-async-backlog
  - file-extra-flags
  - file-fsync-freq
  - file-fsync-all
  - file-fsync-end
  - file-fsync-mode
  - file-erged-requests
  - file-rw-ratio
- cpu
  - cpu-max-prime
- memory
  - memory-block-size
  - memory-total-size
  - memory-scope
  - memory-hugetlb
  - memory-oper
  - memory-access-mode
- threads
  - thread-yields
  - thread-locks
- mutex
  - mutex-num
  - mutex-locks
  - mutex-loops


Pseudo-Random Numbers
----------
- --rand-type=STRING   random numbers distribution {uniform, gaussian, special, pareto, zipfian} to use by default [special]
- --rand-seed=N        seed for random number generator. When 0, the current time is used as an RNG seed. [0]
- --rand-spec-iter=N   number of iterations for the special distribution [12]
- --rand-spec-pct=N    percentage of the entire range where 'special' values will fall in the special distribution [1]
- --rand-spec-res=N    percentage of 'special' values to use for the special distribution [75]
- --rand-pareto-h=N    shape parameter for the Pareto distribution [0.2]
- --rand-zipfian-exp=N shape parameter (exponent, theta) for the Zipfian distribution [0.8]

log options
-----------

- --verbosity=N verbosity level {5 - debug, 0 - only critical messages} [3]
- --percentile=N       percentile to calculate in latency statistics (1-100). Use the special value of 0 to disable percentile calculations [95]
- --histogram[=on|off] print latency histogram in report [off]


prepare
---------
- --tables=N [1]
- --table-size=N [10000]

require lua path ,if install from source
```console
$ sysbench \
--db-driver=mysql \
--mysql-host=localhost \
--mysql-user=testdbuser \
--mysql-password=password \
--mysql-db=testdb \
/usr/local/share/sysbench/oltp_read_only.lua prepare

sysbench 1.1.0-a4938af (using bundled LuaJIT 2.1.0-beta3)

Creating table 'sbtest1'...
Inserting 10000 records into 'sbtest1'
Creating a secondary index on 'sbtest1'...
```

error (without lua path) 
```console
$ sysbench --db-driver=mysql \
--mysql-host=localhost \
--mysql-user=testdbuser \
--mysql-password=password \
--mysql-db=testdb \
prepare
sysbench 1.1.0-a4938af (using bundled LuaJIT 2.1.0-beta3)

FATAL: Cannot find benchmark 'prepare': no such built-in test, file or module
```

```
MariaDB [testdb]> show tables;
+------------------+
| Tables_in_testdb |
+------------------+
| sbtest1          |
+------------------+
1 row in set (0.01 sec)

MariaDB [testdb]> show create table sbtest1\G
*************************** 1. row ***************************
       Table: sbtest1
Create Table: CREATE TABLE `sbtest1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` int(11) NOT NULL DEFAULT 0,
  `c` char(120) NOT NULL DEFAULT '',
  `pad` char(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `k_1` (`k`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=latin1
1 row in set (0.01 sec)
```
```
MariaDB [testdb]> select count(1) from sbtest1;
+----------+
| count(1) |
+----------+
|    10000 |
+----------+
1 row in set (0.01 sec)
```
```
MariaDB [testdb]> select * from sbtest1 limit 5;
+----+------+-------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------+
| id | k    | c                                                                                                                       | pad                                                         |
+----+------+-------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------+
|  1 | 4993 | 83868641912-28773972837-60736120486-75162659906-27563526494-20381887404-41576422241-93426793964-56405065102-33518432330 | 67847967377-48000963322-62604785301-91415491898-96926520291 |
|  2 | 5020 | 38014276128-25250245652-62722561801-27818678124-24890218270-18312424692-92565570600-36243745486-21199862476-38576014630 | 23183251411-36241541236-31706421314-92007079971-60663066966 |
|  3 | 5044 | 33973744704-80540844748-72700647445-87330233173-87249600839-07301471459-22846777364-58808996678-64607045326-48799346817 | 38615512647-91458489257-90681424432-95014675832-60408598704 |
|  4 | 5021 | 37002370280-58842166667-00026392672-77506866252-09658311935-56926959306-83464667271-94685475868-28264244556-14550208498 | 63947013338-98809887124-59806726763-79831528812-45582457048 |
|  5 | 4999 | 44257470806-17967007152-32809666989-26174672567-29883439075-95767161284-94957565003-35708767253-53935174705-16168070783 | 34551750492-67990399350-81179284955-79299808058-21257255869 |
+----+------+-------------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------+
5 rows in set (0.00 sec)
```


benchmark
--------

```console
$ sysbench --db-driver=mysql \
--mysql-host=localhost \
--mysql-user=testdbuser \
--mysql-password=password \
--mysql-db=testdb \
/usr/local/share/sysbench/oltp_read_write.lua run
sysbench 1.1.0-a4938af (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!

SQL statistics:
    queries performed:
        read:                            52780
        write:                           15080
        other:                           7540
        total:                           75400
    transactions:                        3770   (376.98 per sec.)
    queries:                             75400  (7539.57 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      376.9784
    time elapsed:                        10.0006s
    total number of events:              3770

Latency (ms):
         min:                                    2.07
         avg:                                    2.65
         max:                                    7.64
         95th percentile:                        2.97
         sum:                                 9988.03

Threads fairness:
    events (avg/stddev):           3770.0000/0.00
    execution time (avg/stddev):   9.9880/0.00
```
