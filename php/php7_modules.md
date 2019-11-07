
Amazlin linux 2

```console
$ sudo yum install httpd
$ sudo amazon-linux-extras install php7.3
```

```console
$ sudo yum list installed "php*"
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
Installed Packages
php-cli.x86_64                    7.3.11-1.amzn2.0.1                @amzn2extra-php7.3
php-common.x86_64                 7.3.11-1.amzn2.0.1                @amzn2extra-php7.3
php-fpm.x86_64                    7.3.11-1.amzn2.0.1                @amzn2extra-php7.3
php-json.x86_64                   7.3.11-1.amzn2.0.1                @amzn2extra-php7.3
php-mysqlnd.x86_64                7.3.11-1.amzn2.0.1                @amzn2extra-php7.3
php-pdo.x86_64                    7.3.11-1.amzn2.0.1                @amzn2extra-php7.3
```

```console
$ repoquery -l php
/etc/httpd/conf.d/php.conf
/etc/httpd/conf.modules.d/15-php.conf
/usr/lib64/httpd/modules/libphp7-zts.so
/usr/lib64/httpd/modules/libphp7.so
/usr/share/httpd/icons/php.gif
/var/lib/php/opcache
/var/lib/php/session
/var/lib/php/wsdlcache
```
