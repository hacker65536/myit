
alb + ssl + apache 2.4.39 (default)


```
curl: (92) HTTP/2 stream 1 was not closed cleanly: PROTOCOL_ERROR (err 1)
```



```apache
IfModule mod_http2.c>
    Protocols h2 h2c http/1.1
</IfModule>
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
#LoadModule mpm_event_module modules/mod_mpm_event.so
```
error_log
```
[Wed Aug 21 10:09:49.919694 2019] [http2:warn] [pid 3504] AH10034: The mpm module (prefork.c) is not supported by mod_http2. The mpm determines how things are processed in your server. HTTP/2 has more demands in this regard and the currently selected mpm will just not do. This is an advisory warning. Your server will continue to work, but the HTTP/2 protocol will be inactive.
```


should be enable http2
```
IfModule mod_http2.c>
    Protocols h2 h2c http/1.1
</IfModule>
#LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
LoadModule mpm_event_module modules/mod_mpm_event.so
```

or

disable http2
```
#IfModule mod_http2.c>
#    Protocols h2 h2c http/1.1
#</IfModule>
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
#LoadModule mpm_event_module modules/mod_mpm_event.so
```
