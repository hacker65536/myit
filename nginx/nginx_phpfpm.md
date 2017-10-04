

nginx server
```
yum install -y nginx
```

/etc/nginx/nginx.conf
```conf
        location ~ \.php$ {
            #root           html;
            root           /var/www;
            fastcgi_pass   127.0.0.1:9000;
            fastcgi_index  index.php;
            #fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
            fastcgi_param  SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include        fastcgi_params;
        }
```


