
install mysql5.7 on based el7
```console 
$ curl -SsLO https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
$ sudo yum install -y !$:t
$ sudo yum install -y mysql-server
```

```console
$ sudo yum list installed "mysql*"
Loaded plugins: langpacks, priorities, update-motd
11 packages excluded due to repository priority protections
Installed Packages
mysql-community-client.x86_64                       5.7.22-1.el7                  @mysql57-community
mysql-community-common.x86_64                       5.7.22-1.el7                  @mysql57-community
mysql-community-libs.x86_64                         5.7.22-1.el7                  @mysql57-community
mysql-community-libs-compat.x86_64                  5.7.22-1.el7                  @mysql57-community
mysql-community-server.x86_64                       5.7.22-1.el7                  @mysql57-community
mysql57-community-release.noarch                    el7-11                        installed
```
