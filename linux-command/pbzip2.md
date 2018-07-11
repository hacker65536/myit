
```console
$ sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
```


```console
$ sudo yum install -y --enablerepo=epel pbzip2
```

```
$ sudo yum list installed "pbzip2"
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
141 packages excluded due to repository priority protections
Installed Packages
pbzip2.x86_64                                   1.1.12-1.el7                                   @epel
```


```
$ grep processor /proc/cpuinfo | wc -l
8
```

```
$ dd if=/dev/zero of=20GBdummyfile bs=64M count=320
320+0 records in
320+0 records out
21474836480 bytes (21 GB) copied, 111.655 s, 192 MB/s
```

```
$ pbzip2 -v 20GBdummyfile
Parallel BZIP2 v1.1.12 [Dec 21, 2014]
By: Jeff Gilchrist [http://compression.ca]
Major contributions: Yavor Nikolov [http://javornikolov.wordpress.com]
Uses libbzip2 by Julian Seward

         # CPUs: 8
 BWT Block Size: 900 KB
File Block Size: 900 KB
 Maximum Memory: 100 MB
-------------------------------------------
         File #: 1 of 1
     Input Name: 20GBdummyfile
    Output Name: 20GBdummyfile.bz2

     Input Size: 21474836480 bytes
Compressing data...
    Output Size: 1145328 bytes
-------------------------------------------

     Wall Clock: 107.075937 seconds
```
