
```
$ cat /proc/version
Linux version 4.9.76-3.78.amzn1.x86_64 (mockbuild@gobi-build-60009) (gcc version 7.2.1 20170915 (Red Hat 7.2.1-2) (GCC) ) #1 SMP Fri Jan 12 19:51:35 UTC 2018
```

```
$ whereis virtualenv
virtualenv: /usr/bin/virtualenv
```

```
$ rpm -qf /usr/bin/virtualenv
python27-virtualenv-15.1.0-1.14.amzn1.noarch
```

```
$ mkdir project
$ cd !$

$ virtualenv my_env
New python executable in /home/ec2-user/project/my_env/bin/python2.7
Also creating executable in /home/ec2-user/project/my_env/bin/python
Installing setuptools, pip, wheel...done.
```
```
$ source my_env/bin/activate
```

```
$ whereis pip
pip: /usr/bin/pip /home/ec2-user/project/my_env/bin/pip2.7 /home/ec2-user/project/my_env/bin/pip
$ echo $PATH
/home/ec2-user/project/my_env/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/aws/bin:/home/ec2-user/.local/bin:/home/ec2-user/bin
```
