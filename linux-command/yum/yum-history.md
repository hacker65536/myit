
https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/6/html/deployment_guide/sec-yum-transaction_history

```
$ sudo yum history
Loaded plugins: langpacks, priorities, update-motd
ID     | Command line             | Date and time    | Action(s)      | Altered
-------------------------------------------------------------------------------
     2 | install gcc              | 2018-01-24 03:11 | Install        |   13
     1 | install -q -y vim-enhanc | 2018-01-24 03:10 | Update         |    4
history list
```


```
$ sudo yum history info 2
Loaded plugins: langpacks, priorities, update-motd
Transaction ID : 2
Begin time     : Wed Jan 24 03:11:28 2018
Begin rpmdb    : 412:430247c306aad7d81fa4105ac6c918998685fef8
End time       :            03:11:33 2018 (5 seconds)
End rpmdb      : 425:16e7c0cdb7b47f1f3e473b29132730e8864c6725
User           : EC2 Default User <ec2-user>
Return-Code    : Success
Command Line   : install gcc
Transaction performed with:
    Installed     rpm-4.11.3-25.amzn2.0.1.x86_64 installed
    Installed     yum-3.4.3-154.amzn2.0.1.noarch installed
Packages Altered:
    Dep-Install cpp-7.2.1-2.amzn2.0.2.x86_64             @amzn2-core
    Install     gcc-7.2.1-2.amzn2.0.2.x86_64             @amzn2-core
    Dep-Install glibc-devel-2.25-10.amzn2.0.1.x86_64     @amzn2-core
    Dep-Install glibc-headers-2.25-10.amzn2.0.1.x86_64   @amzn2-core
    Dep-Install kernel-headers-4.9.76-38.79.amzn2.x86_64 @amzn2-core
    Dep-Install libatomic-7.2.1-2.amzn2.0.2.x86_64       @amzn2-core
    Dep-Install libcilkrts-7.2.1-2.amzn2.0.2.x86_64      @amzn2-core
    Dep-Install libitm-7.2.1-2.amzn2.0.2.x86_64          @amzn2-core
    Dep-Install libmpc-1.0.1-3.amzn2.x86_64              @amzn2-core
    Dep-Install libmpx-7.2.1-2.amzn2.0.2.x86_64          @amzn2-core
    Dep-Install libquadmath-7.2.1-2.amzn2.0.2.x86_64     @amzn2-core
    Dep-Install libsanitizer-7.2.1-2.amzn2.0.2.x86_64    @amzn2-core
    Dep-Install mpfr-3.1.1-4.amzn2.x86_64                @amzn2-core
history info
```

```
$ sudo yum history undo 2
Loaded plugins: langpacks, priorities, update-motd
Undoing transaction 2, from Wed Jan 24 03:11:28 2018
    Dep-Install cpp-7.2.1-2.amzn2.0.2.x86_64             @amzn2-core
    Install     gcc-7.2.1-2.amzn2.0.2.x86_64             @amzn2-core
    Dep-Install glibc-devel-2.25-10.amzn2.0.1.x86_64     @amzn2-core
    Dep-Install glibc-headers-2.25-10.amzn2.0.1.x86_64   @amzn2-core
    Dep-Install kernel-headers-4.9.76-38.79.amzn2.x86_64 @amzn2-core
    Dep-Install libatomic-7.2.1-2.amzn2.0.2.x86_64       @amzn2-core
    Dep-Install libcilkrts-7.2.1-2.amzn2.0.2.x86_64      @amzn2-core
    Dep-Install libitm-7.2.1-2.amzn2.0.2.x86_64          @amzn2-core
    Dep-Install libmpc-1.0.1-3.amzn2.x86_64              @amzn2-core
    Dep-Install libmpx-7.2.1-2.amzn2.0.2.x86_64          @amzn2-core
    Dep-Install libquadmath-7.2.1-2.amzn2.0.2.x86_64     @amzn2-core
    Dep-Install libsanitizer-7.2.1-2.amzn2.0.2.x86_64    @amzn2-core
    Dep-Install mpfr-3.1.1-4.amzn2.x86_64                @amzn2-core
Resolving Dependencies
--> Running transaction check
---> Package cpp.x86_64 0:7.2.1-2.amzn2.0.2 will be erased
---> Package gcc.x86_64 0:7.2.1-2.amzn2.0.2 will be erased
---> Package glibc-devel.x86_64 0:2.25-10.amzn2.0.1 will be erased
---> Package glibc-headers.x86_64 0:2.25-10.amzn2.0.1 will be erased
---> Package kernel-headers.x86_64 0:4.9.76-38.79.amzn2 will be erased
---> Package libatomic.x86_64 0:7.2.1-2.amzn2.0.2 will be erased
---> Package libcilkrts.x86_64 0:7.2.1-2.amzn2.0.2 will be erased
---> Package libitm.x86_64 0:7.2.1-2.amzn2.0.2 will be erased
---> Package libmpc.x86_64 0:1.0.1-3.amzn2 will be erased
---> Package libmpx.x86_64 0:7.2.1-2.amzn2.0.2 will be erased
---> Package libquadmath.x86_64 0:7.2.1-2.amzn2.0.2 will be erased
---> Package libsanitizer.x86_64 0:7.2.1-2.amzn2.0.2 will be erased
---> Package mpfr.x86_64 0:3.1.1-4.amzn2 will be erased
--> Finished Dependency Resolution

Dependencies Resolved

====================================================================================================
 Package                  Arch             Version                      Repository             Size
====================================================================================================
Removing:
 cpp                      x86_64           7.2.1-2.amzn2.0.2            @amzn2-core            24 M
 gcc                      x86_64           7.2.1-2.amzn2.0.2            @amzn2-core            56 M
 glibc-devel              x86_64           2.25-10.amzn2.0.1            @amzn2-core           1.1 M
 glibc-headers            x86_64           2.25-10.amzn2.0.1            @amzn2-core           2.2 M
 kernel-headers           x86_64           4.9.76-38.79.amzn2           @amzn2-core           3.7 M
 libatomic                x86_64           7.2.1-2.amzn2.0.2            @amzn2-core            26 k
 libcilkrts               x86_64           7.2.1-2.amzn2.0.2            @amzn2-core           128 k
 libitm                   x86_64           7.2.1-2.amzn2.0.2            @amzn2-core           129 k
 libmpc                   x86_64           1.0.1-3.amzn2                @amzn2-core           111 k
 libmpx                   x86_64           7.2.1-2.amzn2.0.2            @amzn2-core            34 k
 libquadmath              x86_64           7.2.1-2.amzn2.0.2            @amzn2-core           292 k
 libsanitizer             x86_64           7.2.1-2.amzn2.0.2            @amzn2-core           2.8 M
 mpfr                     x86_64           3.1.1-4.amzn2                @amzn2-core           553 k

Transaction Summary
====================================================================================================
Remove  13 Packages

Installed size: 91 M
Is this ok [y/N]: y
Downloading packages:
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Erasing    : gcc-7.2.1-2.amzn2.0.2.x86_64                                                    1/13
  Erasing    : glibc-devel-2.25-10.amzn2.0.1.x86_64                                            2/13
  Erasing    : cpp-7.2.1-2.amzn2.0.2.x86_64                                                    3/13
  Erasing    : glibc-headers-2.25-10.amzn2.0.1.x86_64                                          4/13
  Erasing    : libmpc-1.0.1-3.amzn2.x86_64                                                     5/13
  Erasing    : kernel-headers-4.9.76-38.79.amzn2.x86_64                                        6/13
  Erasing    : mpfr-3.1.1-4.amzn2.x86_64                                                       7/13
  Erasing    : libsanitizer-7.2.1-2.amzn2.0.2.x86_64                                           8/13
  Erasing    : libatomic-7.2.1-2.amzn2.0.2.x86_64                                              9/13
  Erasing    : libcilkrts-7.2.1-2.amzn2.0.2.x86_64                                            10/13
  Erasing    : libitm-7.2.1-2.amzn2.0.2.x86_64                                                11/13
  Erasing    : libmpx-7.2.1-2.amzn2.0.2.x86_64                                                12/13
  Erasing    : libquadmath-7.2.1-2.amzn2.0.2.x86_64                                           13/13
  Verifying  : gcc-7.2.1-2.amzn2.0.2.x86_64                                                    1/13
  Verifying  : libatomic-7.2.1-2.amzn2.0.2.x86_64                                              2/13
  Verifying  : libsanitizer-7.2.1-2.amzn2.0.2.x86_64                                           3/13
  Verifying  : libitm-7.2.1-2.amzn2.0.2.x86_64                                                 4/13
  Verifying  : mpfr-3.1.1-4.amzn2.x86_64                                                       5/13
  Verifying  : glibc-devel-2.25-10.amzn2.0.1.x86_64                                            6/13
  Verifying  : glibc-headers-2.25-10.amzn2.0.1.x86_64                                          7/13
  Verifying  : libmpc-1.0.1-3.amzn2.x86_64                                                     8/13
  Verifying  : libquadmath-7.2.1-2.amzn2.0.2.x86_64                                            9/13
  Verifying  : libmpx-7.2.1-2.amzn2.0.2.x86_64                                                10/13
  Verifying  : kernel-headers-4.9.76-38.79.amzn2.x86_64                                       11/13
  Verifying  : libcilkrts-7.2.1-2.amzn2.0.2.x86_64                                            12/13
  Verifying  : cpp-7.2.1-2.amzn2.0.2.x86_64                                                   13/13

Removed:
  cpp.x86_64 0:7.2.1-2.amzn2.0.2                    gcc.x86_64 0:7.2.1-2.amzn2.0.2
  glibc-devel.x86_64 0:2.25-10.amzn2.0.1            glibc-headers.x86_64 0:2.25-10.amzn2.0.1
  kernel-headers.x86_64 0:4.9.76-38.79.amzn2        libatomic.x86_64 0:7.2.1-2.amzn2.0.2
  libcilkrts.x86_64 0:7.2.1-2.amzn2.0.2             libitm.x86_64 0:7.2.1-2.amzn2.0.2
  libmpc.x86_64 0:1.0.1-3.amzn2                     libmpx.x86_64 0:7.2.1-2.amzn2.0.2
  libquadmath.x86_64 0:7.2.1-2.amzn2.0.2            libsanitizer.x86_64 0:7.2.1-2.amzn2.0.2
  mpfr.x86_64 0:3.1.1-4.amzn2

Complete!
```


```
$ sudo yum history
Loaded plugins: langpacks, priorities, update-motd
ID     | Command line             | Date and time    | Action(s)      | Altered
-------------------------------------------------------------------------------
     3 | history undo 2           | 2018-01-24 03:15 | Erase          |   13
     2 | install gcc              | 2018-01-24 03:11 | Install        |   13
     1 | install -q -y vim-enhanc | 2018-01-24 03:10 | Update         |    4
history list
```

```
$ sudo yum history summary
Loaded plugins: langpacks, priorities, update-motd
Login user                 | Time                | Action(s)        | Altered
-------------------------------------------------------------------------------
EC2 ... <ec2-user>         | Last day            | E, I, U          |       30
history summary
```

```
$ sudo yum history summary 2..3
Loaded plugins: langpacks, priorities, update-motd
Login user                 | Time                | Action(s)        | Altered
-------------------------------------------------------------------------------
EC2 ... <ec2-user>         | Last day            | E, I             |       26
history summary
```

```
$ sudo yum history redo 2
Loaded plugins: langpacks, priorities, update-motd
Repeating transaction 2, from Wed Jan 24 03:11:28 2018
    Dep-Install cpp-7.2.1-2.amzn2.0.2.x86_64             @amzn2-core
    Install     gcc-7.2.1-2.amzn2.0.2.x86_64             @amzn2-core
    Dep-Install glibc-devel-2.25-10.amzn2.0.1.x86_64     @amzn2-core
    Dep-Install glibc-headers-2.25-10.amzn2.0.1.x86_64   @amzn2-core
    Dep-Install kernel-headers-4.9.76-38.79.amzn2.x86_64 @amzn2-core
    Dep-Install libatomic-7.2.1-2.amzn2.0.2.x86_64       @amzn2-core
    Dep-Install libcilkrts-7.2.1-2.amzn2.0.2.x86_64      @amzn2-core
    Dep-Install libitm-7.2.1-2.amzn2.0.2.x86_64          @amzn2-core
    Dep-Install libmpc-1.0.1-3.amzn2.x86_64              @amzn2-core
    Dep-Install libmpx-7.2.1-2.amzn2.0.2.x86_64          @amzn2-core
    Dep-Install libquadmath-7.2.1-2.amzn2.0.2.x86_64     @amzn2-core
    Dep-Install libsanitizer-7.2.1-2.amzn2.0.2.x86_64    @amzn2-core
    Dep-Install mpfr-3.1.1-4.amzn2.x86_64                @amzn2-core
amzn2-core                                                                   | 2.0 kB  00:00:00
Resolving Dependencies
--> Running transaction check
---> Package gcc.x86_64 0:7.2.1-2.amzn2.0.2 will be installed
--> Processing Dependency: cpp = 7.2.1-2.amzn2.0.2 for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: glibc-devel >= 2.2.90-12 for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: libubsan.so.0()(64bit) for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: libtsan.so.0()(64bit) for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: libquadmath.so.0()(64bit) for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: libmpxwrappers.so.2()(64bit) for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: libmpx.so.2()(64bit) for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: libmpfr.so.4()(64bit) for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: libmpc.so.3()(64bit) for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: liblsan.so.0()(64bit) for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: libitm.so.1()(64bit) for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: libcilkrts.so.5()(64bit) for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: libatomic.so.1()(64bit) for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Processing Dependency: libasan.so.4()(64bit) for package: gcc-7.2.1-2.amzn2.0.2.x86_64
--> Running transaction check
---> Package cpp.x86_64 0:7.2.1-2.amzn2.0.2 will be installed
---> Package glibc-devel.x86_64 0:2.25-10.amzn2.0.1 will be installed
--> Processing Dependency: glibc-headers = 2.25-10.amzn2.0.1 for package: glibc-devel-2.25-10.amzn2.0.1.x86_64
--> Processing Dependency: glibc-headers for package: glibc-devel-2.25-10.amzn2.0.1.x86_64
---> Package libatomic.x86_64 0:7.2.1-2.amzn2.0.2 will be installed
---> Package libcilkrts.x86_64 0:7.2.1-2.amzn2.0.2 will be installed
---> Package libitm.x86_64 0:7.2.1-2.amzn2.0.2 will be installed
---> Package libmpc.x86_64 0:1.0.1-3.amzn2 will be installed
---> Package libmpx.x86_64 0:7.2.1-2.amzn2.0.2 will be installed
---> Package libquadmath.x86_64 0:7.2.1-2.amzn2.0.2 will be installed
---> Package libsanitizer.x86_64 0:7.2.1-2.amzn2.0.2 will be installed
---> Package mpfr.x86_64 0:3.1.1-4.amzn2 will be installed
--> Running transaction check
---> Package glibc-headers.x86_64 0:2.25-10.amzn2.0.1 will be installed
--> Processing Dependency: kernel-headers >= 2.2.1 for package: glibc-headers-2.25-10.amzn2.0.1.x86_64
--> Processing Dependency: kernel-headers for package: glibc-headers-2.25-10.amzn2.0.1.x86_64
--> Running transaction check
---> Package kernel-headers.x86_64 0:4.9.76-38.79.amzn2 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

====================================================================================================
 Package                  Arch             Version                       Repository            Size
====================================================================================================
Installing:
 gcc                      x86_64           7.2.1-2.amzn2.0.2             amzn2-core            21 M
Installing for dependencies:
 cpp                      x86_64           7.2.1-2.amzn2.0.2             amzn2-core           9.2 M
 glibc-devel              x86_64           2.25-10.amzn2.0.1             amzn2-core           962 k
 glibc-headers            x86_64           2.25-10.amzn2.0.1             amzn2-core           516 k
 kernel-headers           x86_64           4.9.76-38.79.amzn2            amzn2-core           1.0 M
 libatomic                x86_64           7.2.1-2.amzn2.0.2             amzn2-core            33 k
 libcilkrts               x86_64           7.2.1-2.amzn2.0.2             amzn2-core            73 k
 libitm                   x86_64           7.2.1-2.amzn2.0.2             amzn2-core            72 k
 libmpc                   x86_64           1.0.1-3.amzn2                 amzn2-core            52 k
 libmpx                   x86_64           7.2.1-2.amzn2.0.2             amzn2-core            38 k
 libquadmath              x86_64           7.2.1-2.amzn2.0.2             amzn2-core           178 k
 libsanitizer             x86_64           7.2.1-2.amzn2.0.2             amzn2-core           640 k
 mpfr                     x86_64           3.1.1-4.amzn2                 amzn2-core           208 k

Transaction Summary
====================================================================================================
Install  1 Package (+12 Dependent packages)

Total download size: 34 M
Installed size: 91 M
Is this ok [y/d/N]: y
Downloading packages:
(1/13): cpp-7.2.1-2.amzn2.0.2.x86_64.rpm                                     | 9.2 MB  00:00:00
(2/13): glibc-devel-2.25-10.amzn2.0.1.x86_64.rpm                             | 962 kB  00:00:00
(3/13): glibc-headers-2.25-10.amzn2.0.1.x86_64.rpm                           | 516 kB  00:00:00
(4/13): kernel-headers-4.9.76-38.79.amzn2.x86_64.rpm                         | 1.0 MB  00:00:00
(5/13): gcc-7.2.1-2.amzn2.0.2.x86_64.rpm                                     |  21 MB  00:00:00
(6/13): libatomic-7.2.1-2.amzn2.0.2.x86_64.rpm                               |  33 kB  00:00:00
(7/13): libitm-7.2.1-2.amzn2.0.2.x86_64.rpm                                  |  72 kB  00:00:00
(8/13): libcilkrts-7.2.1-2.amzn2.0.2.x86_64.rpm                              |  73 kB  00:00:00
(9/13): libmpc-1.0.1-3.amzn2.x86_64.rpm                                      |  52 kB  00:00:00
(10/13): libmpx-7.2.1-2.amzn2.0.2.x86_64.rpm                                 |  38 kB  00:00:00
(11/13): libquadmath-7.2.1-2.amzn2.0.2.x86_64.rpm                            | 178 kB  00:00:00
(12/13): libsanitizer-7.2.1-2.amzn2.0.2.x86_64.rpm                           | 640 kB  00:00:00
(13/13): mpfr-3.1.1-4.amzn2.x86_64.rpm                                       | 208 kB  00:00:00
----------------------------------------------------------------------------------------------------
Total                                                                39 MB/s |  34 MB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : mpfr-3.1.1-4.amzn2.x86_64                                                       1/13
  Installing : libmpc-1.0.1-3.amzn2.x86_64                                                     2/13
  Installing : cpp-7.2.1-2.amzn2.0.2.x86_64                                                    3/13
  Installing : libcilkrts-7.2.1-2.amzn2.0.2.x86_64                                             4/13
  Installing : libmpx-7.2.1-2.amzn2.0.2.x86_64                                                 5/13
  Installing : kernel-headers-4.9.76-38.79.amzn2.x86_64                                        6/13
  Installing : glibc-headers-2.25-10.amzn2.0.1.x86_64                                          7/13
  Installing : glibc-devel-2.25-10.amzn2.0.1.x86_64                                            8/13
  Installing : libquadmath-7.2.1-2.amzn2.0.2.x86_64                                            9/13
  Installing : libitm-7.2.1-2.amzn2.0.2.x86_64                                                10/13
  Installing : libsanitizer-7.2.1-2.amzn2.0.2.x86_64                                          11/13
  Installing : libatomic-7.2.1-2.amzn2.0.2.x86_64                                             12/13
  Installing : gcc-7.2.1-2.amzn2.0.2.x86_64                                                   13/13
  Verifying  : glibc-devel-2.25-10.amzn2.0.1.x86_64                                            1/13
  Verifying  : libatomic-7.2.1-2.amzn2.0.2.x86_64                                              2/13
  Verifying  : libsanitizer-7.2.1-2.amzn2.0.2.x86_64                                           3/13
  Verifying  : libitm-7.2.1-2.amzn2.0.2.x86_64                                                 4/13
  Verifying  : mpfr-3.1.1-4.amzn2.x86_64                                                       5/13
  Verifying  : glibc-headers-2.25-10.amzn2.0.1.x86_64                                          6/13
  Verifying  : libmpc-1.0.1-3.amzn2.x86_64                                                     7/13
  Verifying  : libquadmath-7.2.1-2.amzn2.0.2.x86_64                                            8/13
  Verifying  : kernel-headers-4.9.76-38.79.amzn2.x86_64                                        9/13
  Verifying  : libmpx-7.2.1-2.amzn2.0.2.x86_64                                                10/13
  Verifying  : gcc-7.2.1-2.amzn2.0.2.x86_64                                                   11/13
  Verifying  : libcilkrts-7.2.1-2.amzn2.0.2.x86_64                                            12/13
  Verifying  : cpp-7.2.1-2.amzn2.0.2.x86_64                                                   13/13

Installed:
  gcc.x86_64 0:7.2.1-2.amzn2.0.2

Dependency Installed:
  cpp.x86_64 0:7.2.1-2.amzn2.0.2                  glibc-devel.x86_64 0:2.25-10.amzn2.0.1
  glibc-headers.x86_64 0:2.25-10.amzn2.0.1        kernel-headers.x86_64 0:4.9.76-38.79.amzn2
  libatomic.x86_64 0:7.2.1-2.amzn2.0.2            libcilkrts.x86_64 0:7.2.1-2.amzn2.0.2
  libitm.x86_64 0:7.2.1-2.amzn2.0.2               libmpc.x86_64 0:1.0.1-3.amzn2
  libmpx.x86_64 0:7.2.1-2.amzn2.0.2               libquadmath.x86_64 0:7.2.1-2.amzn2.0.2
  libsanitizer.x86_64 0:7.2.1-2.amzn2.0.2         mpfr.x86_64 0:3.1.1-4.amzn2

Complete!
```
