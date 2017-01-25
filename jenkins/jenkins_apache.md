apache

```apache
<VirtualHost *:443>
servername jenkins.company.jp

SSLEngine on
SSLCertificateFile /etc/httpd/conf.d/ssl/company.jp.crt
SSLCertificateKeyFile /etc/httpd/conf.d/ssl/company.jp.key
SSLCACertificateFile /etc/httpd/conf.d/ssl/ssl.ca.crt

Header edit Location ^http https
ProxyPass         /jenkins  http://localhost:8080/jenkins nocanon
ProxyPassReverse  /jenkins  http://localhost:8080/jenkins

RequestHeader unset Authorization

ProxyRequests     Off
AllowEncodedSlashes NoDecode

# Local reverse proxy authorization override
# Most unix distribution deny proxy by default (ie /etc/apache2/mods-enabled/proxy.conf in Ubuntu)
<Proxy http://localhost:8080/jenkins*>
  Order deny,allow
  Allow from all
</Proxy>

<Location "/jenkins">

    AuthType Basic
    AuthName "LDAP protected"
    AuthBasicProvider ldap
    AuthLDAPURL "ldaps://ldaphost.company.jp/dc=company,dc=local?uid"
    AuthLDAPBindDN "uid=authldap,ou=systemuser,dc=company,dc=local"
    AuthLDAPBindPassword "password"
    require valid-user
</Location>
</VirtualHost>
LDAPVerifyServerCert Off
```
