```bash
yum install --enablerepo=epel ansible
```

troubleshoot
```bash
$ ansible --version
Traceback (most recent call last):
  File "/usr/bin/ansible", line 36, in <module>
    from ansible.runner import Runner
ImportError: No module named ansible.runner
```

```bash
$ python --version
Python 2.7.10
```
if python is dfferent version, use pip installation

```
