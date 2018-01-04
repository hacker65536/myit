

```
[ec2-user@ip-172-31-34-252 ~]$ cat /proc/version
Linux version 4.9.62-10.57.amzn2.x86_64 (mockbuild@ip-10-0-1-120) (gcc version 7.2.1 20170915 (Red Hat 7.2.1-2) (GCC) ) #1 SMP Wed Dec 6 00:07:49 UTC 2017
```

```
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
```

```
sudo yum install php72-php-fpm
```

```
[ec2-user@ip-172-31-34-252 ~]$ sudo yum list installed "php*"
Loaded plugins: langpacks, update-motd
Installed Packages
php72-php-common.x86_64                         7.2.1-1.el7.remi                          @remi-safe
php72-php-fpm.x86_64                            7.2.1-1.el7.remi                          @remi-safe
php72-php-json.x86_64                           7.2.1-1.el7.remi                          @remi-safe
php72-runtime.x86_64                            1.0-1.el7.remi                            @remi-safe
```
