

/etc/sysconfig/memcached
```
OPTIONS="-vvv"
```

```
[root@ip-172-31-15-15 ~]# journalctl -u memcached -f
-- Logs begin at Tue 2017-12-19 09:43:22 UTC. --
Dec 22 05:50:29 ip-172-31-15-15 memcached[15712]: slab class  35: chunk size    202152 perslab       5
Dec 22 05:50:29 ip-172-31-15-15 memcached[15712]: slab class  36: chunk size    252696 perslab       4
Dec 22 05:50:29 ip-172-31-15-15 memcached[15712]: slab class  37: chunk size    315872 perslab       3
Dec 22 05:50:29 ip-172-31-15-15 memcached[15712]: slab class  38: chunk size    394840 perslab       2
Dec 22 05:50:29 ip-172-31-15-15 memcached[15712]: slab class  39: chunk size    493552 perslab       2
Dec 22 05:50:29 ip-172-31-15-15 memcached[15712]: slab class  40: chunk size    616944 perslab       1
Dec 22 05:50:29 ip-172-31-15-15 memcached[15712]: slab class  41: chunk size    771184 perslab       1
Dec 22 05:50:29 ip-172-31-15-15 memcached[15712]: slab class  42: chunk size   1048576 perslab       1
Dec 22 05:50:29 ip-172-31-15-15 memcached[15712]: <26 server listening (auto-negotiate)
Dec 22 05:50:29 ip-172-31-15-15 memcached[15712]: <27 server listening (auto-negotiate)
Dec 22 05:50:45 ip-172-31-15-15 memcached[15712]: <28 new auto-negotiating client connection
Dec 22 05:50:49 ip-172-31-15-15 memcached[15712]: 28: going from conn_new_cmd to conn_waiting
Dec 22 05:50:49 ip-172-31-15-15 memcached[15712]: 28: going from conn_waiting to conn_read
Dec 22 05:50:49 ip-172-31-15-15 memcached[15712]: 28: going from conn_read to conn_parse_cmd
Dec 22 05:50:49 ip-172-31-15-15 memcached[15712]: 28: Client using the ascii protocol
Dec 22 05:50:49 ip-172-31-15-15 memcached[15712]: <28 set foo 0 0 3
Dec 22 05:50:49 ip-172-31-15-15 memcached[15712]: 28: going from conn_parse_cmd to conn_nread
Dec 22 05:50:50 ip-172-31-15-15 memcached[15712]: > NOT FOUND foo
Dec 22 05:50:50 ip-172-31-15-15 memcached[15712]: >28 STORED
Dec 22 05:50:50 ip-172-31-15-15 memcached[15712]: 28: going from conn_nread to conn_write
Dec 22 05:50:50 ip-172-31-15-15 memcached[15712]: 28: going from conn_write to conn_new_cmd
Dec 22 05:50:50 ip-172-31-15-15 memcached[15712]: 28: going from conn_new_cmd to conn_waiting
Dec 22 05:50:50 ip-172-31-15-15 memcached[15712]: 28: going from conn_waiting to conn_read
```
