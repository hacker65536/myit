https://www.percona.com/doc/percona-xtrabackup/LATEST/innobackupex/streaming_backups_innobackupex.html

```
pbzip2 -cd xxxx.xtrabackup.xxxx.gz | xbstream -x -C /path/dir/
```
