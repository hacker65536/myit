
```
[root@ip-172-31-34-252 blog]# rpm -qa|grep nginx
nginx-1.12.2-1.el7_4.ngx.x86_64

[root@ip-172-31-34-252 blog]# rpm -qa|grep php
php72-php-common-7.2.1-1.el7.remi.x86_64
php72-php-xml-7.2.1-1.el7.remi.x86_64
php72-php-pecl-zip-1.15.2-1.el7.remi.x86_64
php72-php-json-7.2.1-1.el7.remi.x86_64
php72-php-fpm-7.2.1-1.el7.remi.x86_64
php72-1.0-1.el7.remi.x86_64
php72-runtime-1.0-1.el7.remi.x86_64
php72-php-cli-7.2.1-1.el7.remi.x86_64
php72-php-mbstring-7.2.1-1.el7.remi.x86_64
```

```
cd /var/www/
curl -sS https://getcomposer.org/installer | php
php composer.phar create-project --prefer-dist laravel/laravel blog
chmod o+w /var/www/blog/storage/logs
chmod o+w /var/www/blog/storage/framework/views/
```


```
[root@ip-172-31-34-252 blog]# pwd
/var/www/blog
[root@ip-172-31-34-252 blog]# php artisan -version
Laravel Framework 5.5.28
```
