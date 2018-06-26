
amazonlinux2
-------------
error
```
    Complete output from command python setup.py egg_info:
    Package libffi was not found in the pkg-config search path.
    Perhaps you should add the directory containing `libffi.pc'
    to the PKG_CONFIG_PATH environment variable
    No package 'libffi' found

---snip---
    ----------------------------------------
Command "python setup.py egg_info" failed with error code 1 in /tmp/pip-install-pmf3qwt7/pynacl/
```


```
$ sudo yum search libffi
Loaded plugins: langpacks, priorities, update-motd
======================================= N/S matched: libffi ========================================
libffi-devel.x86_64 : Development files for libffi
libffi.x86_64 : A portable foreign function interface library

  Name and summary matches only, use "search all" for everything.
```

error
```
    c/_cffi_backend.c: In function ‘b_do_dlopen’:
    c/_cffi_backend.c:4197:31: warning: assignment discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
             *p_printable_filename = PyText_AsUTF8(s);
```

python3.7
```
sudo pip install -U pip
sudo pip install -U setuptools
pip install --user ansible
```



https://github.com/eliben/pycparser/issues/251
https://github.com/pypa/setuptools/issues/1257
