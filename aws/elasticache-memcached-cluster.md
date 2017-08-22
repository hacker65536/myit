```
curl -Ss -o php56-64bit.tgz https://elasticache-downloads.s3.amazonaws.com/ClusterClient/PHP-5.6/latest-64bit
tar xf !:3
cd AmazonElastiCacheClusterClient-1.0.0/
sudo mv amazon-elasticache-cluster-client.so /usr/lib64/php/5.6/modules/

echo "extension=amazon-elasticache-cluster-client.so" | sudo tee /etc/php-5.6.d/memcached.ini



$ php -i |grep memcached
/etc/php-5.6.d/memcached.ini,
PHP Warning: Unknown: It is not safe to rely on the system's timezone settings. You are *required* to use the date.timezone setting or the date_default_timezone_set() function. In case you used any of those methods and you are still getting this warning, you most likely misspelled the timezone identifier. We selected the timezone 'UTC' for now, but please set date.timezone to select your timezone. in Unknown on line 0
memcached
memcached support => enabled
libmemcached version => 1.0.8
memcached.compression_factor => 1.3 => 1.3
memcached.compression_threshold => 2000 => 2000
memcached.compression_type => fastlz => fastlz
memcached.serializer => php => php
memcached.sess_binary => 0 => 0
memcached.sess_consistent_hash => 0 => 0
memcached.sess_lock_wait => 150000 => 150000
memcached.sess_locking => 1 => 1
memcached.sess_number_of_replicas => 0 => 0
memcached.sess_prefix => memc.sess.key. => memc.sess.key.
memcached.sess_randomize_replica_read => 0 => 0
Registered save handlers => files user memcached
```


http://docs.aws.amazon.com/ja_jp/AmazonElastiCache/latest/UserGuide/AutoDiscovery.Using.html#AutoDiscovery.Using.ModifyApp.PHP
