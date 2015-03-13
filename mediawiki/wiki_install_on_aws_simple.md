
#env
```bash
Linux ip-10-1-0-130 3.14.27-25.47.amzn1.x86_64 #1 SMP Wed Dec 17 18:36:15 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
```

#install
##require 
```bash
yum install -y httpd24 php55  php55-mysqlnd php55-xml php55-gd php55-pecl-apc php55-mbstring php55-pecl-imagick php55-intl php55-ldap openldap-clients git mysql postfix mailx
```

##set timezone
```bash
sed -i 's/^\(;date.timezone =.*\)/\1\ndate.timezone = Asia\/Tokyo/' /etc/php.ini
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

##with ldap
```bash
cd /usr/local/src
wget "https://extdist.wmflabs.org/dist/extensions/LdapAuthentication-REL1_24-24a399e.tar.gz"
tar -xzf LdapAuthentication-REL1_24-24a399e.tar.gz -C /var/www/mediawiki/extensions
```

if you want implements after , must do `php maintenance/update.php` to create domain table.

add to `LocalSettings.php`
```php
// implement after you must need fellow lines
//require_once "$IP/extensions/LdapAuthentication/LdapAuthentication.php";
//require_once "$IP/includes/AuthPlugin.php";


$wgAuth = new LdapAuthenticationPlugin();
$wgLDAPDomainNames = array(
  'LdapDomain',
);
$wgLDAPServerNames = array(
  'LdapDomain' => 'localhost',
);
$wgLDAPUseLocal = false;

//ssl or tls or clear
$wgLDAPEncryptionType = array(
  'LdapDomain' => 'tls',
);


$wgLDAPPort = array(
  'LdapDomain' => 389,
);
/*
$wgLDAPProxyAgent = array(
  'LdapDomain' => 'cn=readonly,dc=example,dc=com',
);
$wgLDAPProxyAgentPassword = array(
  'LdapDomain' => '*****',
);
*/
$wgLDAPSearchAttributes = array(
  'LdapDomain' => 'uid'
);
$wgLDAPBaseDNs = array(
  'LdapDomain' => 'dc=mycompany,dc=jp',
);


$wgLDAPGroupBaseDNs = array(
  "LdapDomain"=>"ou=Group,dc=mycompany,dc=jp"
  );
$wgLDAPUserBaseDNs = array(
  "LdapDomain"=>"ou=People,dc=mycompany,dc=jp"
  );




# To pull e-mail address from LDAP
//$wgLDAPPreferences = array(
//  'LdapDomain' => array( 'email' => 'mail')
//);
# Group based restriction
$wgLDAPGroupUseFullDN = array( "LdapDomain"=>false );
$wgLDAPGroupObjectclass = array( "LdapDomain"=>"posixgroup" );
$wgLDAPGroupAttribute = array( "LdapDomain"=>"memberUid" );
$wgLDAPGroupSearchNestedGroups = array( "LdapDomain"=>false );
$wgLDAPGroupNameAttribute = array( "LdapDomain"=>"cn" );
$wgLDAPRequiredGroups = array( "LdapDomain"=>array("cn=division1,ou=Group,dc=mycompany,dc=jp"));
$wgLDAPLowerCaseUsername = array(
  'LdapDomain' => true,
);

## for debug 
$wgLDAPDebug = 1;
$wgDebugLogGroups["ldap"] = "/tmp/debug.log" ;
```
