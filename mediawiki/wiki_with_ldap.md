
##download extension
```bash
cd /usr/local/src
wget "https://extdist.wmflabs.org/dist/extensions/LdapAuthentication-REL1_24-24a399e.tar.gz"
```
##extract
```bash
tar -xzf LdapAuthentication-REL1_24-24a399e.tar.gz -C /var/www/mediawiki/extensions
```

##create table

```bash
cd /var/www/mediawiki/
php maintenance/update.php
```
