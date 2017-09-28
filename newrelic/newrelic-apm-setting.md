php
------------
```
sudo rpm -Uvh http://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm
sudo yum install newrelic-php5
sudo newrelic-install install #type api_key
```


``
vim -R  /etc/php.d/newrelic.ini
```

```
extension = "newrelic.so"
[newrelic]
newrelic.license = "??????????????????????????????????????????"
newrelic.logfile = "/var/log/newrelic/php_agent.log"
newrelic.appname = "PHP Applicationtest"
newrelic.daemon.logfile = "/var/log/newrelic/newrelic-daemon.log"
```
