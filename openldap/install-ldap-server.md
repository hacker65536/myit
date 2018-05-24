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
