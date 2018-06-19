
## amzlinux2

install python3
```console
$ sudo yum install python3
Loaded plugins: langpacks, priorities, update-motd
amzn2-core                                                                   | 2.4 kB  00:00:00
Resolving Dependencies
--> Running transaction check
---> Package python3.x86_64 0:3.7.0-0.16.b3.amzn2.0.1 will be installed
--> Processing Dependency: python3-libs(x86-64) = 3.7.0-0.16.b3.amzn2.0.1 for package: python3-3.7.0                                      -0.16.b3.amzn2.0.1.x86_64
--> Processing Dependency: python3-setuptools for package: python3-3.7.0-0.16.b3.amzn2.0.1.x86_64
--> Processing Dependency: python3-pip for package: python3-3.7.0-0.16.b3.amzn2.0.1.x86_64
--> Processing Dependency: libpython3.7m.so.1.0()(64bit) for package: python3-3.7.0-0.16.b3.amzn2.0.                                      1.x86_64
--> Running transaction check
---> Package python3-libs.x86_64 0:3.7.0-0.16.b3.amzn2.0.1 will be installed
---> Package python3-pip.noarch 0:9.0.3-1.amzn2.0.1 will be installed
---> Package python3-setuptools.noarch 0:38.4.0-3.amzn2.0.6 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

====================================================================================================
 Package                    Arch           Version                         Repository          Size
====================================================================================================
Installing:
 python3                    x86_64         3.7.0-0.16.b3.amzn2.0.1         amzn2-core          64 k
Installing for dependencies:
 python3-libs               x86_64         3.7.0-0.16.b3.amzn2.0.1         amzn2-core         8.0 M
 python3-pip                noarch         9.0.3-1.amzn2.0.1               amzn2-core         1.9 M
 python3-setuptools         noarch         38.4.0-3.amzn2.0.6              amzn2-core         617 k

Transaction Summary
====================================================================================================
Install  1 Package (+3 Dependent packages)

Total download size: 11 M
Installed size: 51 M
Is this ok [y/d/N]: y
Downloading packages:
(1/4): python3-3.7.0-0.16.b3.amzn2.0.1.x86_64.rpm                            |  64 kB  00:00:00
(2/4): python3-pip-9.0.3-1.amzn2.0.1.noarch.rpm                              | 1.9 MB  00:00:00
(3/4): python3-libs-3.7.0-0.16.b3.amzn2.0.1.x86_64.rpm                       | 8.0 MB  00:00:00
(4/4): python3-setuptools-38.4.0-3.amzn2.0.6.noarch.rpm                      | 617 kB  00:00:00
----------------------------------------------------------------------------------------------------
Total                                                                27 MB/s |  11 MB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : python3-libs-3.7.0-0.16.b3.amzn2.0.1.x86_64                                      1/4
  Installing : python3-3.7.0-0.16.b3.amzn2.0.1.x86_64                                           2/4
  Installing : python3-setuptools-38.4.0-3.amzn2.0.6.noarch                                     3/4
  Installing : python3-pip-9.0.3-1.amzn2.0.1.noarch                                             4/4
  Verifying  : python3-setuptools-38.4.0-3.amzn2.0.6.noarch                                     1/4
  Verifying  : python3-3.7.0-0.16.b3.amzn2.0.1.x86_64                                           2/4
  Verifying  : python3-libs-3.7.0-0.16.b3.amzn2.0.1.x86_64                                      3/4
  Verifying  : python3-pip-9.0.3-1.amzn2.0.1.noarch                                             4/4

Installed:
  python3.x86_64 0:3.7.0-0.16.b3.amzn2.0.1

Dependency Installed:
  python3-libs.x86_64 0:3.7.0-0.16.b3.amzn2.0.1        python3-pip.noarch 0:9.0.3-1.amzn2.0.1
  python3-setuptools.noarch 0:38.4.0-3.amzn2.0.6

Complete!
```
configure
```console
$ python --version
Python 2.7.14
$ whereis python
python: /usr/bin/python /usr/bin/python2.7 /usr/bin/python3.7 /usr/bin/python3.7m /usr/lib/python2.7 /usr/lib/python3.7 /usr/lib64/python2.7 /usr/lib64/python3.7 /etc/python /usr/include/python2.7 /usr/include/python3.7m /usr/share/man/man1/python.1.gz
$ alternatives --config python
```
```console
$ sudo alternatives --install /usr/bin/python python /usr/bin/python2.7 1
$ sudo alternatives --install /usr/bin/python python /usr/bin/python3.7 2
$ sudo alternatives --set python /usr/bin/python2.7
$ python --version
Python 2.7.14
$ sudo alternatives --set python /usr/bin/python3.7
$ python --version
Python 3.7.0b3
```

or
```console
$ sudo alternatives --config python

There are 2 programs which provide 'python'.

  Selection    Command
-----------------------------------------------
*+ 1           /usr/bin/python3.7
   2           /usr/bin/python2.7

Enter to keep the current selection[+], or type selection number:
```

## centos6

```
[centos@ip-10-0-0-102 ~]$ sudo su -
[root@ip-10-0-0-102 ~]# cat /etc/centos-release
CentOS release 6.9 (Final)
[root@ip-10-0-0-102 ~]# ls -la /usr/bin/python*
-rwxr-xr-x. 2 root root 4864 Aug 18  2016 /usr/bin/python
lrwxrwxrwx. 1 root root    6 Jan  8 16:14 /usr/bin/python2 -> python
-rwxr-xr-x. 2 root root 4864 Aug 18  2016 /usr/bin/python2.6
[root@ip-10-0-0-102 ~]# python --version
Python 2.6.6
```


```
yum install -y https://centos6.iuscommunity.org/ius-release.rpm
yum install -y python36u
```

```
rm -f /usr/bin/python
alternatives --install /usr/bin/python python /usr/bin/python2.6 1
alternatives --install /usr/bin/python python /usr/bin/python3.6 2
```

configure python
```
# intercative
alternatives --config python 

# nonintercative
alternatives --set python /usr/bin/python2.6
python --version # Python 2.6.6

alternatives --set python /usr/bin/python3.6
python --version # Python 3.6.4
```


remove config
```
alternatives --remove python /usr/bin/python2.6
```

