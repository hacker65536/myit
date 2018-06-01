

```
ldap_modify: Insufficient access (50)
```
- it was when set a LDAP root password without root


```
modifying entry "olcDatabase={2}bdb,cn=config"
ldap_modify: No such object (32)
        matched DN: cn=config
```
- :%s/bdb/hdb/g
