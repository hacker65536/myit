




https://dev.mysql.com/doc/refman/5.7/en/monitor-innodb-mutex-waits-performance-schema.html



`mutex.cnf`
```myconf

[mysqld]
performance-schema-instrument='wait/synch/mutex/innodb/%=ON'
```


```console
$ docker run --rm -it -d -p 3306 --name mysql57 -v $(pwd):/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=mysql57 mysql:5.7
```

```console
$ docker inspect -f '{{.Name}} - {{.NetworkSettings.IPAddress }}' $(docker ps -aq)
/mysql57 - 172.17.0.2
```



```
$ mysql -h 172.17.0.2 -u root -p
```

```
mysql> select @@version;
+-----------+
| @@version |
+-----------+
| 5.7.27    |
+-----------+
1 row in set (0.00 sec)
```
```
mysql> SELECT *
    ->        FROM performance_schema.setup_instruments
    ->        WHERE NAME LIKE '%wait/synch/mutex/innodb%';
+-------------------------------------------------------+---------+-------+
| NAME                                                  | ENABLED | TIMED |
+-------------------------------------------------------+---------+-------+
| wait/synch/mutex/innodb/commit_cond_mutex             | YES     | YES   |
| wait/synch/mutex/innodb/innobase_share_mutex          | YES     | YES   |
| wait/synch/mutex/innodb/autoinc_mutex                 | YES     | YES   |
| wait/synch/mutex/innodb/buf_pool_mutex                | YES     | YES   |
| wait/synch/mutex/innodb/buf_pool_zip_mutex            | YES     | YES   |
| wait/synch/mutex/innodb/cache_last_read_mutex         | YES     | YES   |
| wait/synch/mutex/innodb/dict_foreign_err_mutex        | YES     | YES   |
| wait/synch/mutex/innodb/dict_sys_mutex                | YES     | YES   |
| wait/synch/mutex/innodb/recalc_pool_mutex             | YES     | YES   |
| wait/synch/mutex/innodb/file_format_max_mutex         | YES     | YES   |
| wait/synch/mutex/innodb/fil_system_mutex              | YES     | YES   |
| wait/synch/mutex/innodb/flush_list_mutex              | YES     | YES   |
| wait/synch/mutex/innodb/fts_bg_threads_mutex          | YES     | YES   |
| wait/synch/mutex/innodb/fts_delete_mutex              | YES     | YES   |
| wait/synch/mutex/innodb/fts_optimize_mutex            | YES     | YES   |
| wait/synch/mutex/innodb/fts_doc_id_mutex              | YES     | YES   |
| wait/synch/mutex/innodb/fts_pll_tokenize_mutex        | YES     | YES   |
| wait/synch/mutex/innodb/log_flush_order_mutex         | YES     | YES   |
| wait/synch/mutex/innodb/hash_table_mutex              | YES     | YES   |
| wait/synch/mutex/innodb/ibuf_bitmap_mutex             | YES     | YES   |
| wait/synch/mutex/innodb/ibuf_mutex                    | YES     | YES   |
| wait/synch/mutex/innodb/ibuf_pessimistic_insert_mutex | YES     | YES   |
| wait/synch/mutex/innodb/log_sys_mutex                 | YES     | YES   |
| wait/synch/mutex/innodb/log_sys_write_mutex           | YES     | YES   |
| wait/synch/mutex/innodb/log_cmdq_mutex                | YES     | YES   |
| wait/synch/mutex/innodb/mutex_list_mutex              | YES     | YES   |
| wait/synch/mutex/innodb/page_cleaner_mutex            | YES     | YES   |
| wait/synch/mutex/innodb/page_zip_stat_per_index_mutex | YES     | YES   |
| wait/synch/mutex/innodb/purge_sys_pq_mutex            | YES     | YES   |
| wait/synch/mutex/innodb/recv_sys_mutex                | YES     | YES   |
| wait/synch/mutex/innodb/recv_writer_mutex             | YES     | YES   |
| wait/synch/mutex/innodb/redo_rseg_mutex               | YES     | YES   |
| wait/synch/mutex/innodb/noredo_rseg_mutex             | YES     | YES   |
| wait/synch/mutex/innodb/rw_lock_list_mutex            | YES     | YES   |
| wait/synch/mutex/innodb/rw_lock_mutex                 | YES     | YES   |
| wait/synch/mutex/innodb/srv_dict_tmpfile_mutex        | YES     | YES   |
| wait/synch/mutex/innodb/srv_innodb_monitor_mutex      | YES     | YES   |
| wait/synch/mutex/innodb/srv_misc_tmpfile_mutex        | YES     | YES   |
| wait/synch/mutex/innodb/srv_monitor_file_mutex        | YES     | YES   |
| wait/synch/mutex/innodb/buf_dblwr_mutex               | YES     | YES   |
| wait/synch/mutex/innodb/trx_undo_mutex                | YES     | YES   |
| wait/synch/mutex/innodb/trx_pool_mutex                | YES     | YES   |
| wait/synch/mutex/innodb/trx_pool_manager_mutex        | YES     | YES   |
| wait/synch/mutex/innodb/srv_sys_mutex                 | YES     | YES   |
| wait/synch/mutex/innodb/lock_mutex                    | YES     | YES   |
| wait/synch/mutex/innodb/lock_wait_mutex               | YES     | YES   |
| wait/synch/mutex/innodb/trx_mutex                     | YES     | YES   |
| wait/synch/mutex/innodb/srv_threads_mutex             | YES     | YES   |
| wait/synch/mutex/innodb/rtr_active_mutex              | YES     | YES   |
| wait/synch/mutex/innodb/rtr_match_mutex               | YES     | YES   |
| wait/synch/mutex/innodb/rtr_path_mutex                | YES     | YES   |
| wait/synch/mutex/innodb/rtr_ssn_mutex                 | YES     | YES   |
| wait/synch/mutex/innodb/trx_sys_mutex                 | YES     | YES   |
| wait/synch/mutex/innodb/thread_mutex                  | YES     | YES   |
| wait/synch/mutex/innodb/sync_array_mutex              | YES     | YES   |
| wait/synch/mutex/innodb/zip_pad_mutex                 | YES     | YES   |
| wait/synch/mutex/innodb/row_drop_list_mutex           | YES     | YES   |
| wait/synch/mutex/innodb/master_key_id_mutex           | YES     | YES   |
+-------------------------------------------------------+---------+-------+
58 rows in set (0.00 sec)
```


```
mysql> SELECT EVENT_NAME, COUNT_STAR, SUM_TIMER_WAIT/1000000000 SUM_TIMER_WAIT_MS
    ->        FROM performance_schema.events_waits_summary_global_by_event_name
    ->        WHERE SUM_TIMER_WAIT > 0 AND EVENT_NAME LIKE 'wait/synch/mutex/innodb/%'
    ->        ORDER BY COUNT_STAR DESC;
+--------------------------------------------------+------------+-------------------+
| EVENT_NAME                                       | COUNT_STAR | SUM_TIMER_WAIT_MS |
+--------------------------------------------------+------------+-------------------+
| wait/synch/mutex/innodb/rw_lock_list_mutex       |       8281 |            0.2235 |
| wait/synch/mutex/innodb/buf_pool_mutex           |       4384 |            0.3638 |
| wait/synch/mutex/innodb/log_sys_mutex            |       3437 |            0.2873 |
| wait/synch/mutex/innodb/fil_system_mutex         |       2484 |            0.1180 |
| wait/synch/mutex/innodb/flush_list_mutex         |       2102 |            0.2013 |
| wait/synch/mutex/innodb/sync_array_mutex         |       2000 |            0.1560 |
| wait/synch/mutex/innodb/dict_sys_mutex           |       1042 |            0.0280 |
| wait/synch/mutex/innodb/log_sys_write_mutex      |       1033 |            0.0284 |
| wait/synch/mutex/innodb/log_flush_order_mutex    |       1032 |            0.0265 |
| wait/synch/mutex/innodb/buf_dblwr_mutex          |       1001 |            0.1193 |
| wait/synch/mutex/innodb/row_drop_list_mutex      |        996 |            0.1406 |
| wait/synch/mutex/innodb/lock_wait_mutex          |        996 |            0.1420 |
| wait/synch/mutex/innodb/trx_mutex                |        389 |            0.0092 |
| wait/synch/mutex/innodb/recv_sys_mutex           |        147 |            0.0063 |
| wait/synch/mutex/innodb/recalc_pool_mutex        |         99 |            0.0225 |
| wait/synch/mutex/innodb/trx_sys_mutex            |         64 |            0.0018 |
| wait/synch/mutex/innodb/lock_mutex               |         49 |            0.0012 |
| wait/synch/mutex/innodb/redo_rseg_mutex          |         45 |            0.0011 |
| wait/synch/mutex/innodb/thread_mutex             |         24 |            0.0015 |
| wait/synch/mutex/innodb/innobase_share_mutex     |         20 |            0.0008 |
| wait/synch/mutex/innodb/trx_pool_mutex           |         20 |            0.0010 |
| wait/synch/mutex/innodb/srv_innodb_monitor_mutex |         17 |            0.0020 |
| wait/synch/mutex/innodb/trx_pool_manager_mutex   |         12 |            0.0005 |
| wait/synch/mutex/innodb/srv_sys_mutex            |         12 |            0.0005 |
| wait/synch/mutex/innodb/file_format_max_mutex    |         10 |            0.0003 |
| wait/synch/mutex/innodb/page_cleaner_mutex       |          4 |            0.0002 |
| wait/synch/mutex/innodb/ibuf_mutex               |          3 |            0.0001 |
| wait/synch/mutex/innodb/recv_writer_mutex        |          1 |            0.0000 |
| wait/synch/mutex/innodb/autoinc_mutex            |          1 |            0.0000 |
+--------------------------------------------------+------------+-------------------+
29 rows in set (0.00 sec)
```



```
 8.0.17 
----------
SEMAPHORES
----------
OS WAIT ARRAY INFO: reservation count 0
OS WAIT ARRAY INFO: signal count 0
RW-shared spins 0, rounds 0, OS waits 0
RW-excl spins 0, rounds 0, OS waits 0
RW-sx spins 0, rounds 0, OS waits 0
Spin rounds per wait: 0.00 RW-shared, 0.00 RW-excl, 0.00 RW-sx
------------

 5.7.27
----------
SEMAPHORES
----------
OS WAIT ARRAY INFO: reservation count 2
OS WAIT ARRAY INFO: signal count 2
RW-shared spins 0, rounds 4, OS waits 2
RW-excl spins 0, rounds 0, OS waits 0
RW-sx spins 0, rounds 0, OS waits 0
Spin rounds per wait: 4.00 RW-shared, 0.00 RW-excl, 0.00 RW-sx
------------

 5.6.45
----------
SEMAPHORES
----------
OS WAIT ARRAY INFO: reservation count 2
OS WAIT ARRAY INFO: signal count 2
Mutex spin waits 0, rounds 0, OS waits 0
RW-shared spins 2, rounds 60, OS waits 2
RW-excl spins 0, rounds 0, OS waits 0
Spin rounds per wait: 0.00 mutex, 30.00 RW-shared, 0.00 RW-excl
------------
```


https://labs.gree.jp/blog/2015/12/15043/
