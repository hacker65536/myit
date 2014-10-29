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
redis-cli -h $host get $key
```
