
centos6

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
