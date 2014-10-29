#install php-pecl-redis
```bash
yum install -y php55-pecl-redis
```

#config 
configure php.ini or apache conf
##php.ini
`/etc/php-5.5.d/session.ini`

```bash
session.save_handler = redis
session.save_path = "tcp://xxxxcache.xxxx.xxxx.xxxx.cache.amazonaws.com:6379?weight=1"
```

##apache conf

`/etc/httpd/conf.d/php.conf`

```apache
#php_value session.save_handler "files"
#php_value session.save_path    "/var/lib/php/5.5/session"
#php_value soap.wsdl_cache_dir  "/var/lib/php/5.5/wsdlcache"
```
to

```apache
php_value session.save_handler "redis"
php_value session.save_path    "tcp://xxxxcache.xxxx.xxxx.xxxx.cache.amazonaws.com:6379?weight=1"
#php_value soap.wsdl_cache_dir  "/var/lib/php/5.5/wsdlcache"
```
