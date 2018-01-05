
https://dev.mysql.com/downloads/repo/yum/

```
curl -SsLO https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum install !$:t
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
