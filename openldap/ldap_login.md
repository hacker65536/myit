
```bash
yum install -y nss-pam-ldapd openldap-clients
```


```bash
vim /etc/nsswitch.conf
```
```
passwd:     files sss ldap
shadow:     files sss ldap
group:      files sss ldap
```

```bash
dapsearch -x -D "dc=testcompany,dc=com" -w password "uid=user0"
ldap_sasl_bind(SIMPLE): Can't contact LDAP server (-1)
```

```
vim /etc/openldap/ldap.conf
```
```
BASE    dc=testcompany,dc=com
URI     ldap://ldap.server.local
```
