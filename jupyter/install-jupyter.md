https://jupyter.readthedocs.io/en/latest/install.html


```
pip3 install --upgrade pip
pip3 install jupyter
```


http://jupyter-notebook.readthedocs.io/en/stable/public_server.html


generate config
--------
```
jupyter notebook --generate-config
```

set password (auto)
```
$ jupyter notebook password
Enter password:
Verify password:
[NotebookPasswordApp] Wrote hashed password to /home/ec2-user/.jupyter/jupyter_notebook_config.json
```

set password(man)
```
$ ipython
Python 2.7.14 (default, Mar 16 2018, 18:20:07)
Type "copyright", "credits" or "license" for more information.

IPython 5.6.0 -- An enhanced Interactive Python.
?         -> Introduction and overview of IPython's features.
%quickref -> Quick reference.
help      -> Python's own help system.
object?   -> Details about 'object', use 'object??' for extra details.

In [1]: from notebook.auth import passwd

In [2]: passwd()
Enter password:
Verify password:
Out[2]: 'sha1:46320bc265ad:086e0af382f33913bb37696df4570a276fb3bbd7'
```

.jupyter/jupyter_notebook_config.py
```
c.NotebookApp.password = u'sha1:67c9e60bb8b6:9ffede0825894254b2e042ea597d771089e11aed'
```
