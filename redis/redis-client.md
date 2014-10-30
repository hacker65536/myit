#require
```bash
yum -y install gcc
```

#install redisclient
```bash
cd /usr/local/src/
wget "http://download.redis.io/releases/redis-2.8.9.tar.gz"
tar zxvf redis-2.8.9.tar.gz
cd redis-2.8.9
make
make install
```

#test  
```bash
redis-cli -h host get key
```
```bash
redis-cli -h host
host:6379>monitor
```

```
OK
1414638306.001141 [0 127.0.0.1:62426] "ping"
1414638306.001226 [0 127.0.0.1:62426] "set" "ElastiCacheMasterReplicationTimestamp" "2014-10-30T03:05:06.001Z"
1414638307.001359 [0 127.0.0.1:62426] "ping"
1414638307.001460 [0 127.0.0.1:62426] "set" "ElastiCacheMasterReplicationTimestamp" "2014-10-30T03:05:07.001Z"
1414638308.001274 [0 127.0.0.1:62426] "ping"
1414638308.001359 [0 127.0.0.1:62426] "set" "ElastiCacheMasterReplicationTimestamp" "2014-10-30T03:05:08.001Z"
```
