https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/sec-working_with_yum_cache

```console
# yum clean all
Loaded plugins: priorities, update-motd, upgrade-helper
Cleaning repos: amzn-main amzn-updates mysql-connectors-community mysql-tools-community mysql57-community
Cleaning up everything
# yum install --enablerepo=mysql57-community mysql
Loaded plugins: priorities, update-motd, upgrade-helper
amzn-main                                                                                                                                                                                                            | 2.1 kB  00:00:00
amzn-updates                                                                                                                                                                                                         | 2.5 kB  00:00:00
mysql-connectors-community                                                                                                                                                                                           | 2.5 kB  00:00:00
mysql-tools-community                                                                                                                                                                                                | 2.5 kB  00:00:00
mysql57-community                                                                                                                                                                                                    | 2.5 kB  00:00:00
(1/8): amzn-main/latest/group_gz                                                                                                                                                                                     | 4.4 kB  00:00:00
(2/8): amzn-updates/latest/group_gz                                                                                                                                                                                  | 4.4 kB  00:00:00
(3/8): amzn-updates/latest/updateinfo                                                                                                                                                                                | 493 kB  00:00:00
(4/8): amzn-updates/latest/primary_db                                                                                                                                                                                | 200 kB  00:00:00
(5/8): mysql-tools-community/x86_64/primary_db                                                                                                                                                                       |  41 kB  00:00:00
(6/8): mysql-connectors-community/x86_64/primary_db                                                                                                                                                                  |  20 kB  00:00:00
(7/8): amzn-main/latest/primary_db                                                                                                                                                                                   | 4.0 MB  00:00:00
(8/8): mysql57-community/x86_64/primary_db                                                                                                                                                                           | 148 kB  00:00:00
11 packages excluded due to repository priority protections
Package mysql is obsoleted by mysql-community-client, trying to install mysql-community-client-5.7.22-1.el6.x86_64 instead
Resolving Dependencies
--> Running transaction check
---> Package mysql-community-client.x86_64 0:5.7.22-1.el6 will be installed
--> Processing Dependency: mysql-community-libs(x86-64) >= 5.7.9 for package: mysql-community-client-5.7.22-1.el6.x86_64
--> Running transaction check
---> Package mysql-community-libs.x86_64 0:5.7.22-1.el6 will be installed
--> Processing Dependency: mysql-community-common(x86-64) >= 5.7.9 for package: mysql-community-libs-5.7.22-1.el6.x86_64
--> Running transaction check
---> Package mysql-community-common.x86_64 0:5.7.22-1.el6 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

```
