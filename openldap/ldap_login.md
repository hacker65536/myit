
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
dapsearch -x -D "cn=Manager,dc=testcompany,dc=com" -w password "uid=user1"
ldap_sasl_bind(SIMPLE): Can't contact LDAP server (-1)
```

```
vim /etc/openldap/ldap.conf
```
```
BASE    dc=testcompany,dc=com
URI     ldap://ldap.server.local
```

```bash
ldapsearch -x -D "cn=Manager,dc=testcompany,dc=com" -w password "uid=user1"
```

```
# extended LDIF
#
# LDAPv3
# base <dc=testcompany,dc=com> (default) with scope subtree
# filter: uid=user1
# requesting: ALL
#

# user1, People, testcompany.com
dn: uid=user1,ou=People,dc=testcompany,dc=com
uid: user1
cn: user1
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
userPassword:: e1NTSEF9NDdZdHBXTy9rUEdyb1ZLWEtwaEw3TXZVaUZ4dENHd2M=
loginShell: /bin/bash
uidNumber: 1001
gidNumber: 1001
givenName: firstName
sn: LastName
mail: user1@mail.com
homeDirectory: /home/user1

# search result
search: 2
result: 0 Success

# numResponses: 2
# numEntries: 1

```
