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
