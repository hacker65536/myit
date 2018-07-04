https://www.percona.com/doc/percona-xtrabackup/LATEST/innobackupex/streaming_backups_innobackupex.html

https://www.percona.com/doc/percona-xtrabackup/LATEST/index.html





```
pbzip2 -cd xxxx.xtrabackup.xxxx.gz | xbstream -x -C /path/dir/


```


restore 
---------
https://www.percona.com/doc/percona-xtrabackup/LATEST/backup_scenarios/full_backup.html#restoring-a-backup


```
$ sudo xtrabackup --copy-back -target-dir=/data/backups/
```
