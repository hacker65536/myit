


```bash
sudo yum install memcached
```

amzlinux
```
$ memcached -h |head -1
memcached 1.4.15
$ ps axu|grep [m]emcached
498       2765  0.0  0.1 314860  2300 ?        Ssl  02:17   0:00 memcached -d -p 11211 -u memcached -m 64 -c 1024 -P /var/run/memcached/memcached.pid
```

amzlinux2
```
$ memcached -h |head -1
memcached 1.4.15
$ ps axu|grep [m]emcached
memcach+ 14157  0.0  0.1 325692  2788 ?        Ssl  02:20   0:00 /usr/bin/memcached -u memcached -p 11211 -m 64 -c 1024
```


/etc/sysconfig/memcached
```
PORT="11211"
USER="memcached"
MAXCONN="1024"
CACHESIZE="64"
OPTIONS="-U 0 -vv -l 127.0.0.1 -B ascii 1>> /var/log/memcached/memcached.log 2>>/var/log/memcached/memcached.log"
```

```
# service memcached restart
Stopping memcached:                                        [  OK  ]
Starting memcached: /bin/bash: /var/log/memcached/memcached.log: No such file or directory
                                                           [FAILED]
# mkdir /var/log/memcached/
# service memcached restart
Stopping memcached:                                        [FAILED]
Starting memcached:                                        [  OK  ]
```
