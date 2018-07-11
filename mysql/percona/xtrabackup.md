https://www.percona.com/doc/percona-xtrabackup/LATEST/innobackupex/streaming_backups_innobackupex.html

https://www.percona.com/doc/percona-xtrabackup/LATEST/index.html


| features                                                         | XtraBackup                                                                  | MySQL Enterprise backup                      |
|------------------------------------------------------------------|-----------------------------------------------------------------------------|----------------------------------------------|
| License                                                          | GPL                                                                         | Proprietary                                  |
| Price                                                            | Free                                                                        | Included in subscription at $5000 per Server |
| Streaming and encryption formats                                 | Open source                                                                 | Proprietary                                  |
| Supported MySQL flavors                                          | MySQL,Percona Server,MariaDB,Percona XtraDB Cluster, MariaDB Galera Cluster | MySQL                                        |
| Supported operating systems                                      | Linux                                                                       | Linux, Solaris, Windows, OSX,FreeBSD         |
| Non-Blocking InnoDB Backups                                      | Yes                                                                         | Yes                                          |
| Blocking MyISAM backups                                          | yes                                                                         | yes                                          |
| Incremental backups                                              | Yes                                                                         |                                              |
| Fast incremental backups                                         | yes                                                                         |                                              |
| Incremental backups with archived logs feature in Percona Server | yes                                                                         |                                              |
| Incremental backups with REDO log only                           |                                                                             | yes                                          |
| Backup locks                                                     | yes                                                                         |                                              |
| Encrypted backups                                                | yes                                                                         | yes                                          |
| streaming backups                                                | yes                                                                         | yes                                          |
| Parallel compression                                             | yes                                                                         | yes                                          |
| parallel encryption                                              | yes                                                                         | yes                                          |
| parallel apply-log                                               | yes                                                                         |                                              |
| parallel copy-back                                               |                                                                             | yes                                          |
| partial backups                                                  | yes                                                                         | yes                                          |
| partial backups of individual partitions                         | yes                                                                         |                                              |
| Throttling                                                       | yes                                                                         | yes                                          |
| Backup image validation                                          |                                                                             | yes                                          |
| point-in-time recovry support                                    | yes                                                                         | yes                                          |
| safe slave backups                                               | yes                                                                         |                                              |
| compact backups                                                  | yes                                                                         |                                              |
| buffer pool state backups                                        | yes                                                                         |                                              |
| individual tables export                                         | yes                                                                         | yes                                          |
| individual partitions export                                     | yes                                                                         |                                              |
| Restoring tables to ad different server                          | yes                                                                         | yes                                          |
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



restore 
---------
https://www.percona.com/doc/percona-xtrabackup/LATEST/backup_scenarios/full_backup.html#restoring-a-backup


```console
$ pbzip2 -cd xxxx.xtrabackup.xxxx.gz | xbstream -x -C /data/backups/
```


```console
$ sudo xtrabackup --copy-back -target-dir=/data/backups/
```
