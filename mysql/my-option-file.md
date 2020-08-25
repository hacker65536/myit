# mysql option files


https://dev.mysql.com/doc/refman/8.0/en/option-files.html  
https://dev.mysql.com/doc/refman/8.0/en/option-file-options.html


## order

| order | File Name           | Purpose                                               |
|-------|---------------------|-------------------------------------------------------|
| 1     | /etc/my.cnf         | Global options                                        |
| 2     | /etc/mysql/my.cnf   | Global options                                        |
| 3     | SYSCONFDIR/my.cnf   | Global options                                        |
| 4     | $MYSQL_HOME/my.cnf  | Server-specific options (server only)                 |
| 5     | defaults-extra-file | The file specified with --defaults-extra-file, if any |
| 6     | ~/.my.cnf           | User-specific options                                 |
| 7     | ~/.mylogin.cnf      | User-specific login path options (clients only)       |


## check defaults
```console
$ mysql --print-defaults
mysql would have been started with the following arguments:
--host=database-2-org.cluster-ceeqcjdp1pdt.us-east-2.rds.amazonaws.com
```

## test

```console
$ cat .my.cnf
[client]
password="password"
host="database-13.ceeqcjdp1pdt.us-east-2.rds.amazonaws.com"
```

```console
$ mysql --defaults-file=.my.cnf --print-defaults
mysql would have been started with the following arguments:
--password=***** --host=database-13.ceeqcjdp1pdt.us-east-2.rds.amazonaws.com --host=database-2-org.cluster-ceeqcjdp1pdt.us-east-2.rds.amazonaws.com
```

host overwritten
