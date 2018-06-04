env
------
```console
$ uname -a
Linux ip-172-31-22-86.us-east-2.compute.internal 4.14.33-59.37.amzn2.x86_64 #1 SMP Thu May 3 21:25:31 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
```

install
--------
```console
$ sudo yum  install -y  openldap-servers openldap-clients
```
```console
$ sudo yum list installed "openldap*"
Loaded plugins: langpacks, priorities, update-motd
Installed Packages
openldap.x86_64                                  2.4.44-5.amzn2                          installed
openldap-clients.x86_64                          2.4.44-5.amzn2                          @amzn2-core
openldap-servers.x86_64                          2.4.44-5.amzn2                          @amzn2-core
```


```console
$ sudo cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
$ sudo chown ldap. /var/lib/ldap/DB_CONFIG
```
```console
$ sudo systemctl start slapd
$ ps aux|grep slap[d]
ldap      3549  0.0  2.6 429500 26996 ?        Ssl  03:06   0:00 /usr/sbin/slapd -u ldap -h ldapi:/// ldap:///
```
```console
$ sudo netstat -plunt|grep $(pgrep slapd)
tcp        0      0 0.0.0.0:389             0.0.0.0:*               LISTEN      3549/slapd
tcp6       0      0 :::389                  :::*                    LISTEN      3549/slapd
```
```console
$ sudo lsof -i:389
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
slapd   3549 ldap    8u  IPv4  23173      0t0  TCP *:ldap (LISTEN)
slapd   3549 ldap    9u  IPv6  23174      0t0  TCP *:ldap (LISTEN)
```

```console
$ pstree -p 3549
slapd(3549)───{slapd}(3550)
```

config
---------

### gen password and set password

```console
$ sudo yum install -y expect
```
```console
$ pw=$(mkpasswd -l 12 -s 0);spw=$(slappasswd -s $pw);echo $pw; unset pw
0Yostrd8krFg
```
```
cat <<EOF > ldap_init_passwd.ldif
dn: olcDatabase={0}config,cn=config
changeType: modify
add: olcRootPW
olcRootPW: ${spw}
EOF
```

```
$ sudo ldapadd -Y EXTERNAL -H ldapi:// -f ldap_init_passwd.ldif
SASL/EXTERNAL authentication started
SASL username: gidNumber=1000+uidNumber=1000,cn=peercred,cn=external,cn=auth
SASL SSF: 0
modifying entry "olcDatabase={0}config,cn=config"
```

```
cat <<EOF>ldapconf_init_suffix.ldif
dn: olcDatabase={1}monitor,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0}to * by dn.base="gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth"
  read by dn.base="cn=Manager,dc=testcompany,dc=com" read by * none

dn: olcDatabase={2}bdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: dc=testcompany,dc=com

dn: olcDatabase={2}bdb,cn=config
changetype: modify
replace: olcRootDN
olcRootDN: cn=Manager,dc=testcompany,dc=com

dn: olcDatabase={2}bdb,cn=config
changetype: modify
add: olcRootPW
olcRootPW: ${spw}
EOF
```
```
ldapmodify -x -D "cn=config" -w password -f ldapconf_init_suffix.ldif
```
