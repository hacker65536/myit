
## amazonlinux2 + python3.7

```console
$ sudo yum search pip
  File "/bin/yum", line 30
    except KeyboardInterrupt, e:
                            ^
SyntaxError: invalid syntax
```

https://stackoverflow.com/questions/11213520/yum-crashed-with-keyboard-interrupt-error
> because yum dose not support python3

workaround

```console
$ ls -la /usr/bin/python2
lrwxrwxrwx 1 root root 9 May  9 23:56 /usr/bin/python2 -> python2.7
$ sudo sed -e '1s/.*/#!\/usr\/bin\/python2/g' -i /usr/bin/yum
```


http://gamsj2015.hatenablog.com/entry/2018/03/04/114132

```console
$ sudo yum install python2-pip
Loaded plugins: langpacks, priorities, update-motd
amzn2-core                                                                          | 2.4 kB  00:00:00
Resolving Dependencies
--> Running transaction check
---> Package python2-pip.noarch 0:9.0.3-1.amzn2.0.1 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

===========================================================================================================
 Package                  Arch                Version                        Repository               Size
===========================================================================================================
Installing:
 python2-pip              noarch              9.0.3-1.amzn2.0.1              amzn2-core              1.9 M

Transaction Summary
===========================================================================================================
Install  1 Package

Total download size: 1.9 M
Installed size: 8.3 M
Is this ok [y/d/N]: y
Downloading packages:
  File "/usr/libexec/urlgrabber-ext-down", line 28
    except OSError, e:
                  ^
SyntaxError: invalid syntax


Exiting on user cancel
```

```console
$ sudo sed -e '1s/.*/#!\/usr\/bin\/python2/g' -i /usr/libexec/urlgrabber-ext-down
```

```
$ python --version
Python 3.7.0b3
$ sudo yum install python2-pip
Loaded plugins: langpacks, priorities, update-motd
Resolving Dependencies
--> Running transaction check
---> Package python2-pip.noarch 0:9.0.3-1.amzn2.0.1 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

===========================================================================================================
 Package                  Arch                Version                        Repository               Size
===========================================================================================================
Installing:
 python2-pip              noarch              9.0.3-1.amzn2.0.1              amzn2-core              1.9 M

Transaction Summary
===========================================================================================================
Install  1 Package

Total download size: 1.9 M
Installed size: 8.3 M
Is this ok [y/d/N]: y
Downloading packages:
python2-pip-9.0.3-1.amzn2.0.1.noarch.rpm                                            | 1.9 MB  00:00:00
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : python2-pip-9.0.3-1.amzn2.0.1.noarch                                                    1/1
  Verifying  : python2-pip-9.0.3-1.amzn2.0.1.noarch                                                    1/1

Installed:
  python2-pip.noarch 0:9.0.3-1.amzn2.0.1

Complete!
```

configure amazon-linux-extras
```console
$ amazon-linux-extras
/usr/bin/python: No module named amazon_linux_extras
$ python --version
Python 3.7.0b3
```

/usr/bin/amazon-linux-extras
```sh
if test "$ENVROOT"; then
        PATH=$ENVROOT:$PATH
fi
py=$(command -v python2)
exec env PYTHONIOENCODING=UTF-8 $py -m amazon_linux_extras "$@"
```
/usr/bin/repoquery
```
#!/usr/bin/python2 -tt
```
