https://jupyter.readthedocs.io/en/latest/install.html


```
pip3 install --upgrade pip
pip3 install jupyter
```


run server public
--------------
http://jupyter-notebook.readthedocs.io/en/stable/public_server.html


### generate config

```
jupyter notebook --generate-config
```

### set password 
auto
```
$ jupyter notebook password
Enter password:
Verify password:
[NotebookPasswordApp] Wrote hashed password to /home/ec2-user/.jupyter/jupyter_notebook_config.json
```
man
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

### allow host

.jupyter/jupyter_notebook_config.py
```
c.NotebookApp.ip = '*'
```

exmaple
```
# Set options for certfile, ip, password, and toggle off
# browser auto-opening
c.NotebookApp.certfile = u'/absolute/path/to/your/certificate/mycert.pem'
c.NotebookApp.keyfile = u'/absolute/path/to/your/certificate/mykey.key'
# Set ip to '*' to bind on all interfaces (ips) for the public server
c.NotebookApp.ip = '*'
c.NotebookApp.password = u'sha1:bcd259ccf...<your hashed password here>'
c.NotebookApp.open_browser = False

# It is a good idea to set a known, fixed port for server access
c.NotebookApp.port = 9999
```


