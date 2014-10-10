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
DB_CONFIGをコピー
```
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
```
権限設定

```
echo 'chown ldap:ldap DB_CONFIG' >> /var/lib/ldap/DB_CONFIG
```

