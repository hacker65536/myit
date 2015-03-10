
#env
```bash
Linux ip-10-1-0-130 3.14.27-25.47.amzn1.x86_64 #1 SMP Wed Dec 17 18:36:15 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
```

#install
##require 
```bash
yum install -y httpd24 php55  php55-mysqlnd php55-xml php55-gd php55-pecl-apc php55-mbstring php55-pecl-imagick php55-intl git mysql postfix mailx
```

##download package

```bash
cd /usr/local/src
wget "http://releases.wikimedia.org/mediawiki/1.24/mediawiki-1.24.1.tar.gz"
```

##extract and replacement directory

```bash
tar zxvf mediawiki-1.24.1.tar.gz -C /var/www/
ln -s /var/www/mediawiki-1.24.1 /var/www/mediawiki
```

##change owner
```bash
chown -R apache:apache /var/www/mediawiki/
```
`/var/www/mediawiki` is a symlink = file  
`/var/www/mediawiki/` is a directory. must use this.

##create database
```bash
dbhost="dbhost"
dbuser="dbuser"
dbpass="dbpass"
mysqladmin -h $dbhost -u $dbuser -p${dbpass} create wiki
```

##config httpd
```bash
vim /etc/httpd/conf.d/wiki.conf
```
```apache
<VirtualHost _default_:80>
ServerName wiki.mydomain.com
DocumentRoot /var/www/mediawiki
<Directory /var/www/mediawiki>
AllowOverride all
</Directory>
</VirtualHost>
```

##run service
```bash
chkconfig postfix on
chkconfig httpd on
```
