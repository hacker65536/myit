

https://getcomposer.org/download/


```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
```

```
curl -sS https://getcomposer.org/installer | php -- --install-dir=bin
```

```
curl -sS https://getcomposer.org/installer | php -- --filename=composer
```


/usr/bin/composer

```
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
```
