
https://amir.rachum.com/blog/2017/07/28/python-entry-points/

```console
$ mkdir pystudy
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
