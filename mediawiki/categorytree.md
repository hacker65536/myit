
```bash
cd /usr/local/src/
wget "https://extdist.wmflabs.org/dist/extensions/CategoryTree-REL1_24-dc09bb2.tar.gz"
tar -xzf CategoryTree-REL1_24-dc09bb2.tar.gz -C /var/www/mediawiki/extensions
```

LocalSettings.php  
```php
$wgUseAjax = true;
require_once( "$IP/extensions/CategoryTree/CategoryTree.php" );
```
