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
