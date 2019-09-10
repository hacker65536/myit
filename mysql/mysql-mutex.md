




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
