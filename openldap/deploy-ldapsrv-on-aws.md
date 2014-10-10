##サーバとクライアントをyumでインストール
```bash
yum install -y openldap-servers openldap-clients
```


インストールしたバージョンを確認
```
yum list installed 'openldap*'
```

    Loaded plugins: priorities, update-motd, upgrade-helper
    Installed Packages
    openldap.x86_64                        2.4.23-34.23.amzn1                    installed
    openldap-clients.x86_64                2.4.23-34.23.amzn1                    @amzn-main
    openldap-servers.x86_64                2.4.23-34.23.amzn1                    @amzn-main

##ldapのlog設定



`local4.* -/var/log/ldap`
この記述をconfig dirにファイルとして出力
```bash
echo -e '#ldaplog\nlocal4.*\t-/var/log/ldap' > /etc/rsyslog.d/ldap.conf
```

念のためにコピー
```
cp /etc/logrotate.d/syslog /etc/logrotate.d/syslog.org
```

3行目に `/var/log/ldap`を追加
```
sed -i '3s/\(.*\)/\1\n\/var\/log\/ldap/' /etc/logrotate.d/syslog
```

三行目に追加されている事を確認
```
diff /etc/logrotate.d/syslog /etc/logrotate.d/syslog.org
```

    4d3  
    < /var/log/ldap

コピーを削除
```
rm -f /etc/logrotate.d/syslog.org
```

rsyslogを再起動
```
service rsyslog restart
```

##設定
DB_CONFIGをコピーと権限設定
```
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
chown ldap. /var/lib/ldap/DB_CONFIG
```

設定ファイル作成
```
mkdir ldapconf
cd ldapconf
```
password
```
slappasswd -s password
{SSHA}dx+bl9fhNGwRQYT3MIDejFVu8EfQYeuL
```

初期設定
```
vim ldapconf.ldif
```
```
dn:olcDatabase={0}config,cn=config
changeType:modify
add: olcRootPW
olcRootPW:{SSHA}dx+bl9fhNGwRQYT3MIDejFVu8EfQYeuL
```

反映
```
ldapadd -Y EXTERNAL -H ldapi:// -f ldapconf.ldif
```

    SASL/EXTERNAL authentication started
    SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
    SASL SSF: 0
    modifying entry "olcDatabase={0}config,cn=config"

確認
```
ldapsearch -x -LLL -D "cn=config" -w password -b "cn=config" '(objectClass=*)'
```

- -L

>Search results are display in LDAP Data Interchange Format detailed in ldif(5).  A single -L restricts the output to LDIFv1.
A second -L disables comments.  A third -L disables printing of the LDIF version.  The default is to use  an  extended  version  of LDIF.

- -D binddn

>Use the Distinguished Name binddn to bind to the LDAP directory.  For SASL binds, the server is expected to ignore this value.

- -b searchbase

>Use searchbase as the starting point for the search instead of the default.
