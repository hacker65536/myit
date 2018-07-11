https://www.percona.com/doc/percona-xtrabackup/LATEST/innobackupex/streaming_backups_innobackupex.html

https://www.percona.com/doc/percona-xtrabackup/LATEST/index.html








restore 
---------
https://www.percona.com/doc/percona-xtrabackup/LATEST/backup_scenarios/full_backup.html#restoring-a-backup


```console
$ pbzip2 -cd xxxx.xtrabackup.xxxx.gz | xbstream -x -C /data/backups/
```


```console
$ sudo xtrabackup --copy-back -target-dir=/data/backups/
```
