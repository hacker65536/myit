https://www.percona.com/doc/percona-xtrabackup/LATEST/innobackupex/streaming_backups_innobackupex.html


MySQL Backup Tool Feature Comparison 
------
https://www.percona.com/doc/percona-xtrabackup/LATEST/index.html


| features                                                         | XtraBackup                                                                  | MySQL Enterprise backup                      |
|------------------------------------------------------------------|-----------------------------------------------------------------------------|----------------------------------------------|
| License                                                          | GPL                                                                         | Proprietary                                  |
| Price                                                            | Free                                                                        | Included in subscription at $5000 per Server |
| Streaming and encryption formats                                 | Open source                                                                 | Proprietary                                  |
| Supported MySQL flavors                                          | MySQL,Percona Server,MariaDB,Percona XtraDB Cluster, MariaDB Galera Cluster | MySQL                                        |
| Supported operating systems                                      | Linux                                                                       | Linux, Solaris, Windows, OSX,FreeBSD         |
| Non-Blocking InnoDB Backups(*)                                   | Yes                                                                         | Yes                                          |
| Blocking MyISAM backups                                          | yes                                                                         | yes                                          |
| Incremental backups                                              | Yes                                                                         |                                              |
| Fast incremental backups(*)                                      | yes                                                                         |                                              |
| Incremental backups with archived logs feature in Percona Server | yes                                                                         |                                              |
| Incremental backups with REDO log only                           |                                                                             | yes                                          |
| Backup locks(*)                                                  | yes                                                                         |                                              |
| Encrypted backups                                                | yes                                                                         | yes(*)                                       |
| streaming backups                                                | yes                                                                         | yes                                          |
| Parallel compression                                             | yes                                                                         | yes                                          |
| parallel encryption                                              | yes                                                                         | yes                                          |
| parallel apply-log                                               | yes                                                                         |                                              |
| parallel copy-back                                               |                                                                             | yes                                          |
| partial backups                                                  | yes                                                                         | yes                                          |
| partial backups of individual partitions                         | yes                                                                         |                                              |
| Throttling(*)                                                    | yes                                                                         | yes                                          |
| Backup image validation                                          |                                                                             | yes                                          |
| point-in-time recovry support                                    | yes                                                                         | yes                                          |
| safe slave backups                                               | yes                                                                         |                                              |
| compact backups(*)                                               | yes                                                                         |                                              |
| buffer pool state backups                                        | yes                                                                         |                                              |
| individual tables export                                         | yes                                                                         | yes(*)                                       |
| individual partitions export                                     | yes                                                                         |                                              |
| Restoring tables to ad different server(*)                       | yes                                                                         | yes                                          |
| Data & index file statistics                                     | yes                                                                         |                                              |
| InnoDB secondary indexes defragmentation                         | yes                                                                         |                                              |
| rsync support to minimize lock time                              | yes                                                                         |                                              |
| mproved FTWRL handling                                           | yes                                                                         |                                              |
| Backup history table                                             | yes                                                                         | yes                                          |
| Backup progress table                                            |                                                                             | yes                                          |
| offline bakcups                                                  |                                                                             | yes                                          |
| Backup to tape media managers                                    |                                                                             | yes                                          |
| Cloud backups support                                            |                                                                             | Amazon S3                                    |
| External graphical user interfaces to backup/recovery            | manda Recovery Manager for MySQL                                            | MySQL Workbench,MySQL Enterprise Monitor     |


- InnoDB tables are still locked while copying non-InnoDB data.
- Fast incremental backups are supported for Percona Server with XtraDB changed page tracking enabled.
- Percona XtraBackup supports encryption with any kinds of backups. MySQL Enterprise Backup only supports encryption for single-file backups.
- Percona XtraBackup performs throttling based on the number of IO operations per second. MySQL Enterprise Backup supports a configurable sleep time between operations.
- Percona XtraBackup skips secondary index pages and recreates them when a compact backup is prepared. MySQL Enterprise Backup skips unused pages and reinserts on the prepare stage.
- Percona XtraBackup can export individual tables even from a full backup, regardless of the InnoDB version. MySQL Enterprise Backup uses InnoDB 5.6 transportable tablespaces only when performing a partial backup.
- Tables exported with Percona XtraBackup can be imported into Percona Server 5.1, 5.5 or 5.6+, or MySQL 5.6+. Transportable tablespaces created with MySQL Enterprise Backup can only be imported to Percona Server 5.6+, MySQL 5.6+ or MariaDB 10.0+.
- Backup locks is a lightweight alternative to `FLUSH TABLES WITH READ LOCK` (FTWRL) available in Percona Server 5.6+. Percona XtraBackup uses them automatically to copy non-InnoDB data to avoid blocking DML queries that modify InnoDB tables.


```
$ sudo xtrabackup --print-param
xtrabackup: recognized server arguments: --datadir=/var/lib/mysql
xtrabackup: recognized client arguments: --datadir=/var/lib/mysql --print-param=1
# This MySQL options file was generated by XtraBackup.
[mysqld]
datadir=/var/lib/mysql
```
```
$ sudo xtrabackup --stats
xtrabackup: recognized server arguments: --datadir=/var/lib/mysql
xtrabackup: recognized client arguments: --datadir=/var/lib/mysql --stats=1
xtrabackup version 2.4.12 based on MySQL server 5.7.19 Linux (x86_64) (revision id: 170eb8c)
xtrabackup: cd to /var/lib/mysql
xtrabackup: using the following InnoDB configuration:
xtrabackup:   innodb_data_home_dir = .
xtrabackup:   innodb_data_file_path = ibdata1:10M:autoextend
xtrabackup:   innodb_log_group_home_dir = .
xtrabackup:   innodb_log_files_in_group = 2
xtrabackup:   innodb_log_file_size = 50331648
xtrabackup: Starting 'read-only' InnoDB instance to gather index statistics.
xtrabackup: Using 104857600 bytes for buffer pool (set by --use-memory parameter)
InnoDB: Started in read only mode
InnoDB: PUNCH HOLE support available
InnoDB: Mutexes and rw_locks use GCC atomic builtins
InnoDB: Uses event mutexes
InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
InnoDB: Compressed tables use zlib 1.2.7
InnoDB: Number of pools: 1
InnoDB: Using CPU crc32 instructions
InnoDB: Disabling background log and ibuf IO write threads.
InnoDB: Initializing buffer pool, total size = 100M, instances = 1, chunk size = 100M
InnoDB: Completed initialization of buffer pool
InnoDB: page_cleaner coordinator priority: -20
InnoDB: Highest supported file format is Barracuda.
InnoDB: Log block 18016 at lsn 9223680 has valid header, but checksum field contains 3422029032, should be 1721621815
InnoDB: The log sequence number 1620043 in the system tablespace does not match the log sequence number 9223828 in the ib_logfiles!
InnoDB: Can't initiate database recovery, running in read-only-mode.
InnoDB: Plugin initialization aborted with error Generic error
xtrabackup: innodb_init(): Error occured.
```

backup
--------
```console
# xtrabackup --backup --no-lock --target-dir=/data/backups/base
xtrabackup: recognized server arguments: --datadir=/var/lib/mysql
xtrabackup: recognized client arguments: --datadir=/var/lib/mysql --backup=1 --no-lock=1 --target-dir=/data/backups/base
180711 09:46:03  version_check Connecting to MySQL server with DSN 'dbi:mysql:;mysql_read_default_group=xtrabackup' (using password: NO).
180711 09:46:03  version_check Connected to MySQL server
180711 09:46:03  version_check Executing a version check against the server...
180711 09:46:03  version_check Done.
180711 09:46:03 Connecting to MySQL server host: localhost, user: not set, password: not set, port: not set, socket: not set
Using server version 10.2.10-MariaDB-log
xtrabackup version 2.4.12 based on MySQL server 5.7.19 Linux (x86_64) (revision id: 170eb8c)
xtrabackup: uses posix_fadvise().
xtrabackup: cd to /var/lib/mysql
xtrabackup: open files limit requested 0, set to 1024
xtrabackup: using the following InnoDB configuration:
xtrabackup:   innodb_data_home_dir = .
xtrabackup:   innodb_data_file_path = ibdata1:12M:autoextend
xtrabackup:   innodb_log_group_home_dir = ./
xtrabackup:   innodb_log_files_in_group = 2
xtrabackup:   innodb_log_file_size = 50331648
InnoDB: Number of pools: 1
-------skip------
180711 09:46:04 [01]        ...done
180711 09:46:04 [01] Copying ./testdb/db.opt to /data/backups/base/testdb/db.opt
180711 09:46:04 [01]        ...done
180711 09:46:04 [01] Copying ./testdb/sbtest1.frm to /data/backups/base/testdb/sbtest1.frm
180711 09:46:04 [01]        ...done
180711 09:46:04 Finished backing up non-InnoDB tables and files
180711 09:46:04 Executing FLUSH NO_WRITE_TO_BINLOG ENGINE LOGS...
xtrabackup: The latest check point (for incremental): '9223828'
xtrabackup: Stopping log copying thread.
.180711 09:46:04 >> log scanned up to (9223837)

180711 09:46:04 [00] Copying ib_buffer_pool to /data/backups/base/ib_buffer_pool
180711 09:46:04 [00]        ...done
180711 09:46:04 Backup created in directory '/data/backups/base/'
180711 09:46:04 [00] Writing /data/backups/base/backup-my.cnf
180711 09:46:04 [00]        ...done
180711 09:46:04 [00] Writing /data/backups/base/xtrabackup_info
180711 09:46:04 [00]        ...done
xtrabackup: Transaction log of lsn (9223828) to (9223837) was copied.
180711 09:46:05 completed OK!
```


restore 
---------
https://www.percona.com/doc/percona-xtrabackup/LATEST/backup_scenarios/full_backup.html#restoring-a-backup


```
# systemctl stop mariadb
```
```
# mv /var/lib/mysql/ /var/lib/mysql_bak
```
```
# xtrabackup --copy-back --target-dir=/data/backups/
xtrabackup: recognized server arguments: --datadir=/var/lib/mysql
xtrabackup: recognized client arguments: --datadir=/var/lib/mysql --copy-back=1 --target-dir=/data/backups/
xtrabackup version 2.4.12 based on MySQL server 5.7.19 Linux (x86_64) (revision id: 170eb8c)
180711 10:40:13 [01] Copying ibdata1 to /var/lib/mysql/ibdata1
180711 10:40:13 [01]        ...done
180711 10:40:13 [01] Copying ./inc1/ibdata1.meta to /var/lib/mysql/inc1/ibdata1.meta
180711 10:40:13 [01]        ...done
---snip---
180711 10:40:13 [01]        ...done
180711 10:40:13 [01] Copying ./ib_buffer_pool to /var/lib/mysql/ib_buffer_pool
180711 10:40:13 [01]        ...done
180711 10:40:13 [01] Copying ./xtrabackup_info to /var/lib/mysql/xtrabackup_info
180711 10:40:13 [01]        ...done
180711 10:40:13 completed OK!
```
```
# chown -R mysql. /var/lib/mysql
```

```
# systemctl start mariadb
```


ref
-------

https://www.percona.com/doc/percona-xtrabackup/LATEST/howtos/recipes_xbk_full.html  
https://www.percona.com/doc/percona-xtrabackup/LATEST/howtos/recipes_xbk_inc.html  
https://www.percona.com/doc/percona-xtrabackup/LATEST/xtrabackup_bin/xbk_option_reference.html  

notice  
document of xtrabackup had no mention of --no-lock ,but this option is available

https://www.percona.com/doc/percona-xtrabackup/LATEST/innobackupex/innobackupex_option_reference.html#cmdoption-innobackupex-no-lock
