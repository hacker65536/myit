# remoteip

https://httpd.apache.org/docs/current/mod/mod_remoteip.html


https://dev.classmethod.jp/cloud/aws/access-limit-behind-elb/


2.4+
--

```apache
RemoteIPHeader X-Forwarded-For
```


```apache
require ip xxx.xxx.xxx.xxx # far left ip of X-Forwarded-For
```
