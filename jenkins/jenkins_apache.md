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

`RequestHeader unset Authorization`を付けないと、jenkinsにそのままAuthorizationが渡されて、jenkinsの認証をthroughしてしまう。
ldap通ったあとにjenkinsの認証が始まるという理解。なので別のパスワードが問われているのにldapのパスワードを入れ続けても認証が弾かれて認証ループに陥る？


`Header edit Location ^http https`はmovedなどの302が返ってきたときの`Location`がhttpsではなくhttpで返却されるのを書き換えてhttpsになるようにする設定

```
RequestHeader set X-Forwarded-Proto "https"
RequestHeader set X-Forwarded-Port "443"
```

でも行ける？


jenkinsの設定でこれをfalseにしておく必要がある？
```diff
9c9
<   <useSecurity>true</useSecurity>
---
>   <useSecurity>false</useSecurity>
93c93
```

参考
http://akuwano.hatenablog.jp/entry/20130128/1359373111
