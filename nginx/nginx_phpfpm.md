

nginx server
------------
```
yum install -y nginx
```

/etc/nginx/nginx.conf
```nginxconf
        location ~ \.php$ {
            #root           html;
            root           /var/www;
            #fastcgi_pass   127.0.0.1:9000;
            fastcgi_pass   172.31.23.50:9000;
            fastcgi_index  index.php;
            #fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
            fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include        fastcgi_params;
        }
```

```
service nginx start
```


php-fpm
-------------------

```
yum install -y php56-fpm
```
```
hostname -i
172.31.23.50
```

```ini
;listen = 127.0.0.1:9000
listen = 0.0.0.0:9000
listen.acl_users = apache,nginx
;listen.allowed_clients = 127.0.0.1
```
