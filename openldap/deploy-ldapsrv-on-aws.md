
```bash
yum install openldap-servers openldap-clients
```
この記述をconfig dirにファイルとして出力
`local4.* -/var/log/ldap`
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
>4d3  
>< /var/log/ldap

コピーを削除
```
rm -f /etc/logrotate.d/syslog.org
```

rsyslogを再起動
```
service rsyslog restart
```
