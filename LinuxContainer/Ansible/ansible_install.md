
install rpm from epel
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

```
# alternatives --config python

There are 2 programs which provide 'python'.

  Selection    Command
-----------------------------------------------
*+ 1           /usr/bin/python2.7
   2           /usr/bin/python2.6

Enter to keep the current selection[+], or type selection number: 2
```
```
# ansible --version
ansible 1.9.4
  configured module search path = None
```

if python is dfferent version, use pip installation

```
# pip install ansible
You are using pip version 6.1.1, however version 8.0.2 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
Collecting ansible
  Using cached ansible-2.0.0.2.tar.gz
Requirement already satisfied (use --upgrade to upgrade): paramiko in /usr/lib/python2.7/dist-packages (from ansible)
Requirement already satisfied (use --upgrade to upgrade): jinja2 in /usr/lib/python2.7/dist-packages (from ansible)
Requirement already satisfied (use --upgrade to upgrade): PyYAML in /usr/lib64/python2.7/dist-packages (from ansible)
Requirement already satisfied (use --upgrade to upgrade): setuptools in /usr/lib/python2.7/dist-packages (from ansible)
Requirement already satisfied (use --upgrade to upgrade): pycrypto>=2.6 in /usr/lib64/python2.7/dist-packages (from ansible)
Requirement already satisfied (use --upgrade to upgrade): ecdsa>=0.11 in /usr/lib/python2.7/dist-packages (from paramiko->ansible)
Requirement already satisfied (use --upgrade to upgrade): markupsafe in /usr/lib64/python2.7/dist-packages (from jinja2->ansible)
Installing collected packages: ansible
  Running setup.py install for ansible
Successfully installed ansible-2.0.0.2
```
show version
```
# ansible --version
ansible 2.0.0.2
  config file =
  configured module search path = Default w/o overrides

# python --version
Python 2.7.10
```
