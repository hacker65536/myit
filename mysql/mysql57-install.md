
https://dev.mysql.com/downloads/repo/yum/

```
curl -SsLO https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum install -y !$:t
yum install -y mysql-server
```

```
# yum list installed "mysql*"
Loaded plugins: langpacks, update-motd
Installed Packages
mysql-community-client.x86_64                       5.7.20-1.el7                  @mysql57-community
mysql-community-common.x86_64                       5.7.20-1.el7                  @mysql57-community
mysql-community-libs.x86_64                         5.7.20-1.el7                  @mysql57-community
mysql-community-libs-compat.x86_64                  5.7.20-1.el7                  @mysql57-community
mysql-community-server.x86_64                       5.7.20-1.el7                  @mysql57-community
mysql57-community-release.noarch                    el7-11                        installed
```

```
systemctl start mysqld
```

```
# journalctl -u mysqld
-- Logs begin at Thu 2018-01-04 09:17:56 UTC, end at Fri 2018-01-05 05:40:14 UTC. --
Jan 05 05:39:54 ip-172-31-34-252 systemd[1]: Starting MySQL Server...
Jan 05 05:40:14 ip-172-31-34-252 systemd[1]: Started MySQL Server.
```
