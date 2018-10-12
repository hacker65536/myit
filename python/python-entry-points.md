
https://amir.rachum.com/blog/2017/07/28/python-entry-points/

```console
$ mkdir py
$ cd !$
```

```console
$ cat <<'EOF' > snek.py
ascii_snek = """\
    --..,_                     _,.--.
       `'.'.                .'`__ o  `;__.
          '.'.            .'.'`  '---'`  `
            '.`'--....--'`.'
              `'--....--'`
"""

def main():
    print(ascii_snek)
    
if __name__ == '__main__':
    main()
EOF
```

```console
$ python snek.py
    --..,_                     _,.--.
       `'.'.                .'`__ o  `;__.
          '.'.            .'.'`  '---'`  `
            '.`'--....--'`.'
              `'--....--'`

```

```console
$ cat <<'EOF' > setup.py
from setuptools import setup

setup(
    name='snek',
    entry_points={
        'console_scripts': [
            'snek = snek:main',
        ],
    }
)
EOF
```

```console
$ sudo python setup.py develop
running develop
running egg_info
creating snek.egg-info
writing snek.egg-info/PKG-INFO
writing top-level names to snek.egg-info/top_level.txt
writing dependency_links to snek.egg-info/dependency_links.txt
writing entry points to snek.egg-info/entry_points.txt
writing manifest file 'snek.egg-info/SOURCES.txt'
reading manifest file 'snek.egg-info/SOURCES.txt'
writing manifest file 'snek.egg-info/SOURCES.txt'
running build_ext
Creating /usr/lib/python2.7/site-packages/snek.egg-link (link to .)
Adding snek 0.0.0 to easy-install.pth file
Installing snek script to /usr/bin

Installed /home/ec2-user/py
Processing dependencies for snek==0.0.0
Finished processing dependencies for snek==0.0.0
```

```console
$ cat /usr/lib/python2.7/site-packages/snek.egg-link
/home/ec2-user/py
```

```console
$ cat /usr/bin/snek
```
```python
#!/bin/python
# EASY-INSTALL-ENTRY-SCRIPT: 'snek','console_scripts','snek'
__requires__ = 'snek'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('snek', 'console_scripts', 'snek')()
    )
```
