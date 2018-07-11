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
- Backup locks is a lightweight alternative to FLUSH TABLES WITH READ LOCK available in Percona Server 5.6+. Percona XtraBackup uses them automatically to copy non-InnoDB data to avoid blocking DML queries that modify InnoDB tables.

restore 
---------
https://www.percona.com/doc/percona-xtrabackup/LATEST/backup_scenarios/full_backup.html#restoring-a-backup


```console
$ pbzip2 -cd xxxx.xtrabackup.xxxx.gz | xbstream -x -C /data/backups/
```


```console
$ sudo xtrabackup --copy-back -target-dir=/data/backups/
```
