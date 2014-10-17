#aws s3 library for C/C++

become root from ec2-user ```sudo su -```

###update yum
```bash
yum update -y
```

###restart
```bash
reboot
```

###to become root 
```bash
sudo su -
```

###install package necessary
```bash
yum -y install git gcc libxml2-devel libcurl-devel
```

###move to work dir
```bash
cd /usr/local/src
```

###git clone
```bash
git clone https://github.com/bji/libs3.git
```
```bash
cd /usr/local/src/libs3/
```

###make install
```bash
make && make install
```

    /usr/bin/s3: Installing executable
    /usr/lib/libs3.so.2.0: Installing shared library
    /usr/lib/libs3.so.2: Linking shared library
    /usr/lib/libs3.so: Linking shared library
    /usr/lib/libs3.a: Installing static library
    /usr/include/libs3.h: Installing header


###access test
```bash
export S3_ACCESS_KEY_ID="your-key-id"
export S3_SECRET_ACCESS_KEY="your-access-key"

s3 list
```
```
                         Bucket                                 Created
--------------------------------------------------------  --------------------
companyapptest                                              2013-12-26T09:48:08Z
companycloudformation                                       2014-04-10T06:30:17Z
companycloudsearch                                          2014-07-04T08:27:01Z
companycloudtrail                                           2014-05-29T05:36:37Z
companydocument                                             2014-04-14T05:23:30Z

```



###install error
```bash
s3
```

    s3: error while loading shared libraries: libs3.so.2: cannot open shared object file: No such file or directory
    
```bash
ldd /usr/bin/s3
```

        linux-vdso.so.1 =>  (0x00007fff15ffe000)
        libs3.so.2 => not found  ←



#### configure dynamic linker 
```bash
ldconfig -v|grep libs3
```


