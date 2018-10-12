
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



```console
$ cat setup.py
from setuptools import setup

setup(
    name='snek',
    install_requires=[
    'docopt',
    ],
    entry_points={
        'console_scripts': [
            'snek = snek:main',
        ],
    }
)
```

```console
$ sudo python setup.py develop
running develop
running egg_info
writing requirements to snek.egg-info/requires.txt
writing snek.egg-info/PKG-INFO
writing top-level names to snek.egg-info/top_level.txt
writing dependency_links to snek.egg-info/dependency_links.txt
writing entry points to snek.egg-info/entry_points.txt
reading manifest file 'snek.egg-info/SOURCES.txt'
writing manifest file 'snek.egg-info/SOURCES.txt'
running build_ext
Creating /usr/lib/python2.7/site-packages/snek.egg-link (link to .)
snek 0.0.0 is already the active version in easy-install.pth
Installing snek script to /usr/bin

Installed /home/ec2-user/py
Processing dependencies for snek==0.0.0
Searching for docopt
Reading https://pypi.python.org/simple/docopt/
Downloading https://files.pythonhosted.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz#sha256=49b3a825280bd66b3aa83585ef59c4a8c82f2c8a522dbe754a8bc8d08c85c491
Best match: docopt 0.6.2
Processing docopt-0.6.2.tar.gz
Writing /tmp/easy_install-rHABcQ/docopt-0.6.2/setup.cfg
Running docopt-0.6.2/setup.py -q bdist_egg --dist-dir /tmp/easy_install-rHABcQ/docopt-0.6.2/egg-dist-tmp-mvcADV
zip_safe flag not set; analyzing archive contents...
Moving docopt-0.6.2-py2.7.egg to /usr/lib/python2.7/site-packages
Adding docopt 0.6.2 to easy-install.pth file

Installed /usr/lib/python2.7/site-packages/docopt-0.6.2-py2.7.egg
Finished processing dependencies for snek==0.0.0
```

`snek.py`
```python
"""Print an ASCII Snek.

Usage:
    snek [--type=TYPE]
    
"""
import docopt

normal_snek = """\
    --..,_                     _,.--.
       `'.'.                .'`__ o  `;__.
          '.'.            .'.'`  '---'`  `
            '.`'--....--'`.'
              `'--....--'`
"""

fancy_snek = """\
                          _,..,,,_
                     '``````^~"-,_`"-,_
       .-~c~-.                    `~:. ^-.
   `~~~-.c    ;                      `:.  `-,     _.-~~^^~:.
         `.   ;      _,--~~~~-._       `:.   ~. .~          `.
          .` ;'   .:`           `:       `:.   `    _.:-,.    `.
        .' .:   :'    _.-~^~-.    `.       `..'   .:      `.    '
       :  .' _:'   .-'        `.    :.     .:   .'`.        :    ;
       :  `-'   .:'             `.    `^~~^`   .:.  `.      ;    ;
        `-.__,-~                  ~-.        ,' ':    '.__.`    :'
                                     ~--..--'     ':.         .:'
                                                     ':..___.:'
"""

def get_sneks():
    return {
        'normal': normal_snek,
        'fancy': fancy_snek,
    }


def main():
    args = docopt.docopt(__doc__)
    snek_type = args['--type'] or 'normal'
    print(get_sneks()[snek_type])
    
if __name__ == '__main__':
    main()
```

```console
$ snek
    --..,_                     _,.--.
       `'.'.                .'`__ o  `;__.
          '.'.            .'.'`  '---'`  `
            '.`'--....--'`.'
              `'--....--'`
```
```console
$ snek --type fancy
                          _,..,,,_
                     '``````^~"-,_`"-,_
       .-~c~-.                    `~:. ^-.
   `~~~-.c    ;                      `:.  `-,     _.-~~^^~:.
         `.   ;      _,--~~~~-._       `:.   ~. .~          `.
          .` ;'   .:`           `:       `:.   `    _.:-,.    `.
        .' .:   :'    _.-~^~-.    `.       `..'   .:      `.    '
       :  .' _:'   .-'        `.    :.     .:   .'`.        :    ;
       :  `-'   .:'             `.    `^~~^`   .:.  `.      ;    ;
        `-.__,-~                  ~-.        ,' ':    '.__.`    :'
                                     ~--..--'     ':.         .:'
                                                     ':..___.:'

```


```console
$ mkdir cute_snek
$ cd !$
```

```console
$ cat <<'EOF' > cute_snek.py
cute_snek = r"""
                    /^\/^\
                  _|__|  O|
         \/     /~     \_/ \
          \____|__________/  \
                 \_______      \
                         `\     \                 \
                           |     |                  \
                          /      /                    \
                         /     /                       \
                       /      /                         \ \
                      /     /                            \  \
                    /     /             _----_            \   \
                   /     /           _-~      ~-_         |   |
                  (      (        _-~    _--_    ~-_     _/   |
                   \      ~-____-~    _-~    ~-_    ~-_-~    /
                     ~-_           _-~          ~-_       _-~
                        ~--______-~                ~-___-~
"""
EOF
```

```console
$ cat <<'EOF' > setup.py
from setuptools import setup

setup(
    name='cute_snek',
    entry_points={
        'snek_types': [
            'cute = cute_snek:cute_snek',
        ],
    }
)
EOF
```

```console
$ sudo python setup.py  develop
running develop
running egg_info
creating cute_snek.egg-info
writing cute_snek.egg-info/PKG-INFO
writing top-level names to cute_snek.egg-info/top_level.txt
writing dependency_links to cute_snek.egg-info/dependency_links.txt
writing entry points to cute_snek.egg-info/entry_points.txt
writing manifest file 'cute_snek.egg-info/SOURCES.txt'
reading manifest file 'cute_snek.egg-info/SOURCES.txt'
writing manifest file 'cute_snek.egg-info/SOURCES.txt'
running build_ext
Creating /usr/lib/python2.7/site-packages/cute-snek.egg-link (link to .)
Adding cute-snek 0.0.0 to easy-install.pth file

Installed /home/ec2-user/py/cute_snek
Processing dependencies for cute-snek==0.0.0
Finished processing dependencies for cute-snek==0.0.0
```

`setup.py`
```python
from setuptools import setup

setup(
    name='snek',
    install_requires=[
    'docopt',
    ],
    entry_points={
        'console_scripts': [
            'snek = snek:main',
        ],
        'snek_types': [
           'normal = snek:normal_snek',
           'fancy = snek:fancy_snek',
        ],
    }
)
```

`snek.py`
```python
"""Print an ASCII Snek.

Usage:
    snek [--type=TYPE]

"""
import docopt
import pkg_resources

normal_snek = """\
    --..,_                     _,.--.
       `'.'.                .'`__ o  `;__.
          '.'.            .'.'`  '---'`  `
            '.`'--....--'`.'
              `'--....--'`
"""

fancy_snek = """\
                          _,..,,,_
                     '``````^~"-,_`"-,_
       .-~c~-.                    `~:. ^-.
   `~~~-.c    ;                      `:.  `-,     _.-~~^^~:.
         `.   ;      _,--~~~~-._       `:.   ~. .~          `.
          .` ;'   .:`           `:       `:.   `    _.:-,.    `.
        .' .:   :'    _.-~^~-.    `.       `..'   .:      `.    '
       :  .' _:'   .-'        `.    :.     .:   .'`.        :    ;
       :  `-'   .:'             `.    `^~~^`   .:.  `.      ;    ;
        `-.__,-~                  ~-.        ,' ':    '.__.`    :'
                                     ~--..--'     ':.         .:'
                                                     ':..___.:'
"""

def get_sneks():
     sneks = {}
     for entry_point in pkg_resources.iter_entry_points('snek_types'):
         sneks[entry_point.name] = entry_point.load()
     return sneks


def main():
    args = docopt.docopt(__doc__)
    snek_type = args['--type'] or 'normal'
    print(get_sneks()[snek_type])

if __name__ == '__main__':
    main()
```

```console
$ sudo python setup.py develop
running develop
running egg_info
writing requirements to snek.egg-info/requires.txt
writing snek.egg-info/PKG-INFO
writing top-level names to snek.egg-info/top_level.txt
writing dependency_links to snek.egg-info/dependency_links.txt
writing entry points to snek.egg-info/entry_points.txt
reading manifest file 'snek.egg-info/SOURCES.txt'
writing manifest file 'snek.egg-info/SOURCES.txt'
running build_ext
Creating /usr/lib/python2.7/site-packages/snek.egg-link (link to .)
snek 0.0.0 is already the active version in easy-install.pth
Installing snek script to /usr/bin

Installed /home/ec2-user/py
Processing dependencies for snek==0.0.0
Searching for docopt==0.6.2
Best match: docopt 0.6.2
Processing docopt-0.6.2-py2.7.egg
docopt 0.6.2 is already the active version in easy-install.pth

Using /usr/lib/python2.7/site-packages/docopt-0.6.2-py2.7.egg
Finished processing dependencies for snek==0.0.0
```

```console
$ snek
    --..,_                     _,.--.
       `'.'.                .'`__ o  `;__.
          '.'.            .'.'`  '---'`  `
            '.`'--....--'`.'
              `'--....--'`

```
```console
$ snek --type fancy
                          _,..,,,_
                     '``````^~"-,_`"-,_
       .-~c~-.                    `~:. ^-.
   `~~~-.c    ;                      `:.  `-,     _.-~~^^~:.
         `.   ;      _,--~~~~-._       `:.   ~. .~          `.
          .` ;'   .:`           `:       `:.   `    _.:-,.    `.
        .' .:   :'    _.-~^~-.    `.       `..'   .:      `.    '
       :  .' _:'   .-'        `.    :.     .:   .'`.        :    ;
       :  `-'   .:'             `.    `^~~^`   .:.  `.      ;    ;
        `-.__,-~                  ~-.        ,' ':    '.__.`    :'
                                     ~--..--'     ':.         .:'
                                                     ':..___.:'

```
```console
$ snek --type cute

                    /^\/^\
                  _|__|  O|
         \/     /~     \_/ \
          \____|__________/  \
                 \_______      \
                         `\     \                 \
                           |     |                  \
                          /      /                    \
                         /     /                       \
                       /      /                         \ \
                      /     /                            \  \
                    /     /             _----_            \   \
                   /     /           _-~      ~-_         |   |
                  (      (        _-~    _--_    ~-_     _/   |
                   \      ~-____-~    _-~    ~-_    ~-_-~    /
                     ~-_           _-~          ~-_       _-~
                        ~--______-~                ~-___-~

```
