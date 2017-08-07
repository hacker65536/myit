The System Security Services Daemon (SSSD)
==========================================

# ldap_sssd
sssd+ldapの設定


uname
----
```bash
uname -a
Linux ip-172-31-0-145 4.4.14-24.50.amzn1.x86_64 #1 SMP Fri Jun 24 19:56:04 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
```
install pkg
----
```bash
yum install -y sssd openldap-clients sssd-ldap
```

backup
----
```bash
authconfig --savebackup=2016-07-05
```

```
ls -la /var/lib/authconfig/
total 16
drwx------  4 root root 4096 Jul  5 20:17 .
drwxr-xr-x 18 root root 4096 Jul  5 20:14 ..
drwxr-xr-x  2 root root 4096 Jul  5 20:17 backup-2016-07-05
drwxr-xr-x  2 root root 4096 Jun 22 05:10 last
```

resotre
---
```bash
authconfig --restorebackup=2016-07-05
```

authconfig
---
```bash
authconfig \
--enablesssd \
--enablesssdauth \
--enablelocauthorize \
--enableldap \
--enableldapauth \
--disableldaptls \
--ldapserver=ldaps://ldapserver \
--ldapbasedn=dc=company,dc=local \
--enablemkhomedir \
--update
```

```
chkconfig --list sssd
sssd            0:off   1:off   2:off   3:on    4:on    5:on    6:off
```

## edit sshd


amzlinux or centos7 
```
AuthorizedKeysCommand /usr/bin/sss_ssh_authorizedkeys
AuthorizedKeysCommandUser root
```

centos6 
```
AuthorizedKeysCommand /usr/bin/sss_ssh_authorizedkeys
AuthorizedKeysCommandRunAs root
```
