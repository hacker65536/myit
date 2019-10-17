

https://stackoverflow.com/questions/56377150/cant-combine-user-with-prefix-trying-to-create-zip-package-for-function-with

```
$ pip3 install -t python/ boto3
Collecting boto3
  Using cached https://files.pythonhosted.org/packages/65/5c/13362c8a4a863e84763e3ebdfba41908a117c3b26306580d172bbbcd7492/boto3-1.9.251-py2.py3-none-any.whl
Collecting s3transfer<0.3.0,>=0.2.0 (from boto3)
  Using cached https://files.pythonhosted.org/packages/16/8a/1fc3dba0c4923c2a76e1ff0d52b305c44606da63f718d14d3231e21c51b0/s3transfer-0.2.1-py2.py3-none-any.whl
Collecting jmespath<1.0.0,>=0.7.1 (from boto3)
  Using cached https://files.pythonhosted.org/packages/83/94/7179c3832a6d45b266ddb2aac329e101367fbdb11f425f13771d27f225bb/jmespath-0.9.4-py2.py3-none-any.whl
Collecting botocore<1.13.0,>=1.12.251 (from boto3)
  Using cached https://files.pythonhosted.org/packages/4c/f6/0f2b87d990e3e9511cf2fec31ce71093f021c70a133a59c2a482dc7d104a/botocore-1.12.251-py2.py3-none-any.whl
Collecting python-dateutil<3.0.0,>=2.1; python_version >= "2.7" (from botocore<1.13.0,>=1.12.251->boto3)
  Using cached https://files.pythonhosted.org/packages/41/17/c62faccbfbd163c7f57f3844689e3a78bae1f403648a6afb1d0866d87fbb/python_dateutil-2.8.0-py2.py3-none-any.whl
Collecting docutils<0.16,>=0.10 (from botocore<1.13.0,>=1.12.251->boto3)
  Using cached https://files.pythonhosted.org/packages/22/cd/a6aa959dca619918ccb55023b4cb151949c64d4d5d55b3f4ffd7eee0c6e8/docutils-0.15.2-py3-none-any.whl
Collecting urllib3<1.26,>=1.20; python_version >= "3.4" (from botocore<1.13.0,>=1.12.251->boto3)
  Using cached https://files.pythonhosted.org/packages/e0/da/55f51ea951e1b7c63a579c09dd7db825bb730ec1fe9c0180fc77bfb31448/urllib3-1.25.6-py2.py3-none-any.whl
Collecting six>=1.5 (from python-dateutil<3.0.0,>=2.1; python_version >= "2.7"->botocore<1.13.0,>=1.12.251->boto3)
  Using cached https://files.pythonhosted.org/packages/73/fb/00a976f728d0d1fecfe898238ce23f502a721c0ac0ecfedb80e0d88c64e9/six-1.12.0-py2.py3-none-any.whl
Installing collected packages: six, python-dateutil, jmespath, docutils, urllib3, botocore, s3transfer, boto3
Exception:
Traceback (most recent call last):
  File "/usr/lib/python3/dist-packages/pip/basecommand.py", line 215, in main
    status = self.run(options, args)
  File "/usr/lib/python3/dist-packages/pip/commands/install.py", line 360, in run
    prefix=options.prefix_path,
  File "/usr/lib/python3/dist-packages/pip/req/req_set.py", line 784, in install
    **kwargs
  File "/usr/lib/python3/dist-packages/pip/req/req_install.py", line 851, in install
    self.move_wheel_files(self.source_dir, root=root, prefix=prefix)
  File "/usr/lib/python3/dist-packages/pip/req/req_install.py", line 1064, in move_wheel_files
    isolated=self.isolated,
  File "/usr/lib/python3/dist-packages/pip/wheel.py", line 247, in move_wheel_files
    prefix=prefix,
  File "/usr/lib/python3/dist-packages/pip/locations.py", line 153, in distutils_scheme
    i.finalize_options()
  File "/usr/lib/python3.6/distutils/command/install.py", line 274, in finalize_options
    raise DistutilsOptionError("can't combine user with prefix, "
distutils.errors.DistutilsOptionError: can't combine user with prefix, exec_prefix/home, or install_(plat)base
```

workaround?
```
sudo pip3 install -t python/ boto3
```
