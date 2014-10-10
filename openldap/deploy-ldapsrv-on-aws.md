
```bash
yum install openldap-servers openldap-clients
```

`local4.* -/var/log/ldap`
```bash
echo -e '#ldaplog\nlocal4.*\t-/var/log/ldap' > /etc/rsyslog.d/ldap.conf
```


```
cp /etc/logrotate.d/syslog /etc/logrotate.d/syslog.org
```

```
sed -i '3s/\(.*\)/\1\n\/var\/log\/ldap/' /etc/logrotate.d/syslog
```

```
diff /etc/logrotate.d/syslog /etc/logrotate.d/syslog.org
```
>4d3  
>< /var/log/ldap
