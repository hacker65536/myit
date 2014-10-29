#php.ini
`/etc/php-5.5.d/session.ini`

```bash
session.save_handler = redis
session.save_path = "tcp://xxxxcache.xxxx.xxxx.xxxx.cache.amazonaws.com:6379?weight=1"
```
