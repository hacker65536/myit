
before install from source




prepare

set lua path
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
