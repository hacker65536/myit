# install phpoffice/phpspreadsheet

https://phpspreadsheet.readthedocs.io/en/latest/

install php7.2
--

```console
$ sudo amazon-linux-extra install php7.2
```


install composer
--
```console
$ php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
$ php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
$ php composer-setup.php
$ php -r "unlink('composer-setup.php');"
```

```console
$ mv composer.phar /usr/local/bin/composer
```


install php extention
--
```console
$ sudo yum install php-xml
$ sudo yum install php-gd
$ sudo yum install php-mbstring
$ sudo yum install php-zip
```


install phpoffice/phpspreadsheet
--
```console
$ composer require phpoffice/phpspreadsheet
Using version ^1.6 for phpoffice/phpspreadsheet
./composer.json has been created
Loading composer repositories with package information
Updating dependencies (including require-dev)
Package operations: 4 installs, 0 updates, 0 removals
  - Installing markbaker/matrix (1.1.4): Downloading (100%)
  - Installing markbaker/complex (1.4.7): Downloading (100%)
  - Installing psr/simple-cache (1.0.1): Downloading (100%)
  - Installing phpoffice/phpspreadsheet (1.6.0): Downloading (100%)
phpoffice/phpspreadsheet suggests installing mpdf/mpdf (Option for rendering PDF with PDF Writer)
phpoffice/phpspreadsheet suggests installing dompdf/dompdf (Option for rendering PDF with PDF Writer)
phpoffice/phpspreadsheet suggests installing tecnickcom/tcpdf (Option for rendering PDF with PDF Writer)
phpoffice/phpspreadsheet suggests installing jpgraph/jpgraph (Option for rendering charts, or including charts with PDF or HTML Writers)
Writing lock file
Generating autoload files
```
