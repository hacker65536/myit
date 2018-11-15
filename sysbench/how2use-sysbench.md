
## sysbench help

general options
---------
```
General options:
  --threads=N                     number of threads to use [1]
  --events=N                      limit for total number of events [0]
  --time=N                        limit for total execution time in seconds [10]
  --warmup-time=N                 execute events for this many seconds with statistics disabled before the actual benchmark run with statistics enabled [0]
  --forced-shutdown=STRING        number of seconds to wait after the --time limit before forcing shutdown, or 'off' to disable [off]
  --thread-stack-size=SIZE        size of stack per thread [64K]
  --thread-init-timeout=N         wait time in seconds for worker threads to initialize [30]
  --rate=N                        average transactions rate. 0 for unlimited rate [0]
  --report-interval=N             periodically report intermediate statistics with a specified interval in seconds. 0 disables intermediate reports [0]
  --report-checkpoints=[LIST,...] dump full statistics and reset all counters at specified points in time. The argument is a list of comma-separated values representing the amount of time in seconds elapsed from start of test when report checkpoint(s) must be performed. Report checkpoints are off by default. []
  --debug[=on|off]                print more debugging info [off]
  --validate[=on|off]             perform validation checks where possible [off]
  --help[=on|off]                 print help and exit [off]
  --version[=on|off]              print version and exit [off]
  --config-file=FILENAME          File containing command line options
  --luajit-cmd=STRING             perform LuaJIT control command. This option is equivalent to 'luajit -j'. See LuaJIT documentation for more information
```


mysql options
------------
```
mysql options:
  --mysql-host=[LIST,...]          MySQL server host [localhost]
  --mysql-port=[LIST,...]          MySQL server port [3306]
  --mysql-socket=[LIST,...]        MySQL socket
  --mysql-user=STRING              MySQL user [sbtest]
  --mysql-password=STRING          MySQL password []
  --mysql-db=STRING                MySQL database name [sbtest]
  --mysql-ssl[=on|off]             use SSL connections, if available in the client library [off]
  --mysql-ssl-key=STRING           path name of the client private key file
  --mysql-ssl-ca=STRING            path name of the CA file
  --mysql-ssl-cert=STRING          path name of the client public key certificate file
  --mysql-ssl-cipher=STRING        use specific cipher for SSL connections []
  --mysql-compression[=on|off]     use compression, if available in the client library [off]
  --mysql-debug[=on|off]           trace all client library calls [off]
  --mysql-ignore-errors=[LIST,...] list of errors to ignore, or "all" [1213,1020,1205]
  --mysql-dry-run[=on|off]         Dry run, pretend that all MySQL client API calls are successful without executing them [off]
```
Pseudo-Random Numbers
----------
```
Pseudo-Random Numbers Generator options:
  --rand-type=STRING   random numbers distribution {uniform, gaussian, special, pareto, zipfian} to use by default [special]
  --rand-seed=N        seed for random number generator. When 0, the current time is used as an RNG seed. [0]
  --rand-spec-iter=N   number of iterations for the special distribution [12]
  --rand-spec-pct=N    percentage of the entire range where 'special' values will fall in the special distribution [1]
  --rand-spec-res=N    percentage of 'special' values to use for the special distribution [75]
  --rand-pareto-h=N    shape parameter for the Pareto distribution [0.2]
  --rand-zipfian-exp=N shape parameter (exponent, theta) for the Zipfian distribution [0.8]
```
log options
-----------

```
Log options:
  --verbosity=N verbosity level {5 - debug, 0 - only critical messages} [3]

  --percentile=N       percentile to calculate in latency statistics (1-100). Use the special value of 0 to disable percentile calculations [95]
  --histogram[=on|off] print latency histogram in report [off]
```

general database option
-------------
```
General database options:

  --db-driver=STRING  specifies database driver to use ('help' to get list of available drivers) [mysql]
  --db-ps-mode=STRING prepared statements usage mode {auto, disable} [auto]
  --db-debug[=on|off] print database-specific debug information [off]
```
tests
------
- fileio
```
# sysbench fileio help
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

fileio options:
  --file-num=N                  number of files to create [128]
  --file-block-size=N           block size to use in all IO operations [16384]
  --file-total-size=SIZE        total size of files to create [2G]
  --file-test-mode=STRING       test mode {seqwr, seqrewr, seqrd, rndrd, rndwr, rndrw}
  --file-io-mode=STRING         file operations mode {sync,async,mmap} [sync]
  --file-async-backlog=N        number of asynchronous operatons to queue per thread [128]
  --file-extra-flags=[LIST,...] list of additional flags to use to open files {sync,dsync,direct} []
  --file-fsync-freq=N           do fsync() after this number of requests (0 - don't use fsync()) [100]
  --file-fsync-all[=on|off]     do fsync() after each write operation [off]
  --file-fsync-end[=on|off]     do fsync() at the end of test [on]
  --file-fsync-mode=STRING      which method to use for synchronization {fsync, fdatasync} [fsync]
  --file-merged-requests=N      merge at most this number of IO requests if possible (0 - don't merge) [0]
  --file-rw-ratio=N             reads/writes ratio for combined test [1.5]


```
- cpu
```
# sysbench cpu help
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

cpu options:
  --cpu-max-prime=N upper limit for primes generator [10000]
```
- memory
```
# sysbench memory help
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

memory options:
  --memory-block-size=SIZE    size of memory block for test [1K]
  --memory-total-size=SIZE    total size of data to transfer [100G]
  --memory-scope=STRING       memory access scope {global,local} [global]
  --memory-hugetlb[=on|off]   allocate memory from HugeTLB pool [off]
  --memory-oper=STRING        type of memory operations {read, write, none} [write]
  --memory-access-mode=STRING memory access mode {seq,rnd} [seq]
```
- threads
```
# sysbench threads help
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

threads options:
  --thread-yields=N number of yields to do per request [1000]
  --thread-locks=N  number of locks per thread [8]
```
- mutex
```
# sysbench mutex help
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

mutex options:
  --mutex-num=N   total size of mutex array [4096]
  --mutex-locks=N number of mutex locks to do per thread [50000]
  --mutex-loops=N number of empty loops to do outside mutex lock [10000]
```






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

cpu test 
```console
$ sysbench --config-file=config  --mysql-host=mysql5641 cpu  run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Prime numbers limit: 10000

Initializing worker threads...

Threads started!

CPU speed:
    events per second:   853.70

Throughput:
    events/s (eps):                      853.7011
    time elapsed:                        10.0012s
    total number of events:              8538

Latency (ms):
         min:                                    1.15
         avg:                                    1.17
         max:                                    4.83
         95th percentile:                        1.23
         sum:                                 9993.21

Threads fairness:
    events (avg/stddev):           8538.0000/0.00
    execution time (avg/stddev):   9.9932/0.00

```

memory
```console
$ sysbench --config-file=config  --mysql-host=mysql5641 memory  run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Running memory speed test with the following options:
  block size: 1KiB
  total size: 102400MiB
  operation: write
  scope: global

Initializing worker threads...

Threads started!

Total operations: 8271480 (827143.22 per second)

8077.62 MiB transferred (807.76 MiB/sec)


Throughput:
    events/s (eps):                      827143.2238
    time elapsed:                        10.0001s
    total number of events:              8271480

Latency (ms):
         min:                                    0.00
         avg:                                    0.00
         max:                                    0.36
         95th percentile:                        0.00
         sum:                                 3383.99

Threads fairness:
    events (avg/stddev):           8271480.0000/0.00
    execution time (avg/stddev):   3.3840/0.00

```

threads
```console
$ sysbench --config-file=config  --mysql-host=mysql5641 threads run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!


Throughput:
    events/s (eps):                      2433.8180
    time elapsed:                        10.0003s
    total number of events:              24339

Latency (ms):
         min:                                    0.40
         avg:                                    0.41
         max:                                    0.53
         95th percentile:                        0.45
         sum:                                 9979.97

Threads fairness:
    events (avg/stddev):           24339.0000/0.00
    execution time (avg/stddev):   9.9800/0.00
```


bulk insert
```
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/bulk_insert.lua cleanup
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/bulk_insert.lua prepare
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/bulk_insert.lua run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!

SQL statistics:
    queries performed:
        read:                            0
        write:                           71
        other:                           0
        total:                           71
    transactions:                        2162217 (215019.74 per sec.)
    queries:                             71     (7.06 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      215019.7395
    time elapsed:                        10.0559s
    total number of events:              2162217

Latency (ms):
         min:                                    0.00
         avg:                                    0.00
         max:                                  214.59
         95th percentile:                        0.00
         sum:                                 8194.16

Threads fairness:
    events (avg/stddev):           2162217.0000/0.00
    execution time (avg/stddev):   8.1942/0.00

```
```sql

```

delete
```console
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/oltp_delete.lua cleanup
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/oltp_delete.lua prepare
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/oltp_delete.lua run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!

SQL statistics:
    queries performed:
        read:                            0
        write:                           791
        other:                           2647
        total:                           3438
    transactions:                        3438   (343.71 per sec.)
    queries:                             3438   (343.71 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      343.7094
    time elapsed:                        10.0026s
    total number of events:              3438

Latency (ms):
         min:                                    1.79
         avg:                                    2.91
         max:                                  105.93
         95th percentile:                        4.65
         sum:                                 9992.75

Threads fairness:
    events (avg/stddev):           3438.0000/0.00
    execution time (avg/stddev):   9.9927/0.00
```
```sql
DELETE FROM sbtest1 WHERE id=5019
```

insert
```console
$ sysbench --config-file=config --mysql-host=tmysql5641 /usr/local/share/sysbench/oltp_insert.lua run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!

SQL statistics:
    queries performed:
        read:                            0
        write:                           2470
        other:                           0
        total:                           2470
    transactions:                        2470   (246.96 per sec.)
    queries:                             2470   (246.96 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      246.9553
    time elapsed:                        10.0018s
    total number of events:              2470

Latency (ms):
         min:                                    2.44
         avg:                                    4.04
         max:                                   86.90
         95th percentile:                        4.57
         sum:                                 9990.67

Threads fairness:
    events (avg/stddev):           2470.0000/0.00
    execution time (avg/stddev):   9.9907/0.00

```
```sql
INSERT INTO sbtest1 (id, k, c, pad) VALUES (0, 5045, '09907829551-81540821263-82436641028-37878078580-57846378466-07571873890-77281530200-25999924814-96246294466-43911582712', '88766381672-90722517099-73913324552-14786728825-14225856551')
```


point select
```console
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/oltp_point_select.lua run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!

SQL statistics:
    queries performed:
        read:                            25962
        write:                           0
        other:                           0
        total:                           25962
    transactions:                        25962  (2596.10 per sec.)
    queries:                             25962  (2596.10 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      2596.0960
    time elapsed:                        10.0004s
    total number of events:              25962

Latency (ms):
         min:                                    0.28
         avg:                                    0.38
         max:                                   53.71
         95th percentile:                        0.42
         sum:                                 9965.88

Threads fairness:
    events (avg/stddev):           25962.0000/0.00
    execution time (avg/stddev):   9.9659/0.00

```
```sql
SELECT c FROM sbtest1 WHERE id=5006
```

read only

```console
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/oltp_read_only.lua run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!

SQL statistics:
    queries performed:
        read:                            20972
        write:                           0
        other:                           2996
        total:                           23968
    transactions:                        1498   (149.77 per sec.)
    queries:                             23968  (2396.39 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      149.7741
    time elapsed:                        10.0017s
    total number of events:              1498

Latency (ms):
         min:                                    5.36
         avg:                                    6.67
         max:                                  103.82
         95th percentile:                        7.17
         sum:                                 9997.38

Threads fairness:
    events (avg/stddev):           1498.0000/0.00
    execution time (avg/stddev):   9.9974/0.00

```
```sql
BEGIN
SELECT c FROM sbtest1 WHERE id=4988
SELECT c FROM sbtest1 WHERE id=4986
SELECT c FROM sbtest1 WHERE id=4997
SELECT c FROM sbtest1 WHERE id=5167
SELECT c FROM sbtest1 WHERE id=5018
SELECT c FROM sbtest1 WHERE id=6054
SELECT c FROM sbtest1 WHERE id=3882
SELECT c FROM sbtest1 WHERE id=5236
SELECT c FROM sbtest1 WHERE id=5021
SELECT c FROM sbtest1 WHERE id=5004
SELECT c FROM sbtest1 WHERE id BETWEEN 5049 AND 5148
SELECT SUM(k) FROM sbtest1 WHERE id BETWEEN 5001 AND 5100
SELECT c FROM sbtest1 WHERE id BETWEEN 4556 AND 4655 ORDER BY c
SELECT DISTINCT c FROM sbtest1 WHERE id BETWEEN 4277 AND 4376 ORDER BY c
COMMIT
```

read write 
```console
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/oltp_read_write.lua run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!

SQL statistics:
    queries performed:
        read:                            10416
        write:                           2976
        other:                           1488
        total:                           14880
    transactions:                        744    (74.37 per sec.)
    queries:                             14880  (1487.35 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      74.3673
    time elapsed:                        10.0044s
    total number of events:              744

Latency (ms):
         min:                                   10.65
         avg:                                   13.44
         max:                                  223.57
         95th percentile:                       15.27
         sum:                                10000.99

Threads fairness:
    events (avg/stddev):           744.0000/0.00
    execution time (avg/stddev):   10.0010/0.00
```
```sql
BEGIN
SELECT c FROM sbtest1 WHERE id=5005
SELECT c FROM sbtest1 WHERE id=5029
SELECT c FROM sbtest1 WHERE id=5048
SELECT c FROM sbtest1 WHERE id=4942
SELECT c FROM sbtest1 WHERE id=5023
SELECT c FROM sbtest1 WHERE id=5017
SELECT c FROM sbtest1 WHERE id=5016
SELECT c FROM sbtest1 WHERE id=4998
SELECT c FROM sbtest1 WHERE id=5030
SELECT c FROM sbtest1 WHERE id=4892
SELECT c FROM sbtest1 WHERE id BETWEEN 4986 AND 5085
SELECT SUM(k) FROM sbtest1 WHERE id BETWEEN 4987 AND 5086
SELECT c FROM sbtest1 WHERE id BETWEEN 4869 AND 4968 ORDER BY c
SELECT DISTINCT c FROM sbtest1 WHERE id BETWEEN 5013 AND 5112 ORDER BY c
UPDATE sbtest1 SET k=k+1 WHERE id=4997
UPDATE sbtest1 SET c='45847993275-68238059760-00590830180-98768376885-67088347674-47173809116-52982377839-16284708776-10715060105-17887469858' WHERE id=5042
DELETE FROM sbtest1 WHERE id=5021
INSERT INTO sbtest1 (id, k, c, pad) VALUES (5021, 4979, '65917376282-89901252315-69549110513-10757781438-99918078973-41543264141-60132123829-06714691868-86882031053-95408194639', '57773943075-67471779271-74723336571-05607374676-83152566532')
COMMIT
```
update index
```
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/oltp_update_index.lua run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!

SQL statistics:
    queries performed:
        read:                            0
        write:                           2478
        other:                           0
        total:                           2478
    transactions:                        2478   (246.21 per sec.)
    queries:                             2478   (246.21 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      246.2052
    time elapsed:                        10.0648s
    total number of events:              2478

Latency (ms):
         min:                                    2.43
         avg:                                    4.06
         max:                                  144.63
         95th percentile:                        5.28
         sum:                                10057.17

Threads fairness:
    events (avg/stddev):           2478.0000/0.00
    execution time (avg/stddev):   10.0572/0.00
```
```sql
UPDATE sbtest1 SET k=k+1 WHERE id=5040
```


update non index
```
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/oltp_update_non_index.lua run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!

SQL statistics:
    queries performed:
        read:                            0
        write:                           2461
        other:                           0
        total:                           2461
    transactions:                        2461   (246.05 per sec.)
    queries:                             2461   (246.05 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      246.0504
    time elapsed:                        10.0020s
    total number of events:              2461

Latency (ms):
         min:                                    2.41
         avg:                                    4.06
         max:                                  112.74
         95th percentile:                        4.57
         sum:                                 9994.53

Threads fairness:
    events (avg/stddev):           2461.0000/0.00
    execution time (avg/stddev):   9.9945/0.00

```
```sql
UPDATE sbtest1 SET c='27525676978-93232338281-86023712542-81034864104-70198896832-02822878273-23908830751-94640676193-34689125445-67219715451' WHERE id=4979
```


```console
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/oltp_write_only.lua run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!

SQL statistics:
    queries performed:
        read:                            0
        write:                           5996
        other:                           2998
        total:                           8994
    transactions:                        1499   (149.80 per sec.)
    queries:                             8994   (898.80 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      149.8004
    time elapsed:                        10.0066s
    total number of events:              1499

Latency (ms):
         min:                                    5.10
         avg:                                    6.67
         max:                                  145.14
         95th percentile:                        8.28
         sum:                                10001.44

Threads fairness:
    events (avg/stddev):           1499.0000/0.00
    execution time (avg/stddev):   10.0014/0.00

```
```sql
BEGIN
UPDATE sbtest1 SET k=k+1 WHERE id=3480
UPDATE sbtest1 SET c='87602219299-18523541232-48476893109-66875972790-20627346504-12893144313-75185454029-98410561353-00243411128-24658156167' WHERE id=5016
DELETE FROM sbtest1 WHERE id=4983
INSERT INTO sbtest1 (id, k, c, pad) VALUES (4983, 5017, '74502161637-75090792897-65543500932-65560090618-88659145231-25722976779-32011585253-26144577349-78200470333-76497274172', '53197481292-71239331039-13746065412-22988746219-34318133427')
COMMIT
```

select random points

```console
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/select_random_points.lua run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!

SQL statistics:
    queries performed:
        read:                            6135
        write:                           0
        other:                           0
        total:                           6135
    transactions:                        6135   (613.42 per sec.)
    queries:                             6135   (613.42 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      613.4184
    time elapsed:                        10.0013s
    total number of events:              6135

Latency (ms):
         min:                                    0.61
         avg:                                    1.63
         max:                                  127.23
         95th percentile:                        1.89
         sum:                                 9986.57

Threads fairness:
    events (avg/stddev):           6135.0000/0.00
    execution time (avg/stddev):   9.9866/0.00
```
```sql
SELECT id, k, c, pad
          FROM sbtest1
          WHERE k IN (5076, 4990, 4994, 4987, 4978, 5217, 4998, 5185, 5016, 4983)

```

select random rnages

```console
$ sysbench --config-file=config --mysql-host=mysql5641 /usr/local/share/sysbench/select_random_ranges.lua run
sysbench 1.1.0-5cd1244 (using bundled LuaJIT 2.1.0-beta3)

Running the test with following options:
Number of threads: 1
Initializing random number generator from current time


Initializing worker threads...

Threads started!

SQL statistics:
    queries performed:
        read:                            6075
        write:                           0
        other:                           0
        total:                           6075
    transactions:                        6075   (607.44 per sec.)
    queries:                             6075   (607.44 per sec.)
    ignored errors:                      0      (0.00 per sec.)
    reconnects:                          0      (0.00 per sec.)

Throughput:
    events/s (eps):                      607.4438
    time elapsed:                        10.0009s
    total number of events:              6075

Latency (ms):
         min:                                    0.87
         avg:                                    1.64
         max:                                   69.23
         95th percentile:                        1.93
         sum:                                 9979.20

Threads fairness:
    events (avg/stddev):           6075.0000/0.00
    execution time (avg/stddev):   9.9792/0.00
```

```sql
SELECT count(k)
          FROM sbtest1
          WHERE k BETWEEN 5043 AND 5048 OR k BETWEEN 5034 AND 5039 OR k BETWEEN 5039 AND 5044 OR k BETWEEN 5013 AND 5018 OR k BETWEEN 5478 AND 5483 OR k BETWEEN 5009 AND 5014 OR k BETWEEN 5021 AND 5026 OR k BETWEEN 4983 AND 4988 OR k BETWEEN 5014 AND 5019 OR k BETWEEN 3117 AND 3122
```
```
+----------+
| count(k) |
+----------+
|     3804 |
+----------+
1 row in set (0.00 sec)
```
