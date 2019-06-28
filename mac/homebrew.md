# homebrew 

https://brew.sh/

mac version
--
```console
$ sw_vers
ProductName:	Mac OS X
ProductVersion:	10.13.6
BuildVersion:	17G6030
```

install
--
```console
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```


brew help
--
```console
$ brew help
Example usage:
  brew search [TEXT|/REGEX/]
  brew info [FORMULA...]
  brew install FORMULA...
  brew update
  brew upgrade [FORMULA...]
  brew uninstall FORMULA...
  brew list [FORMULA...]

Troubleshooting:
  brew config
  brew doctor
  brew install --verbose --debug FORMULA

Contributing:
  brew create [URL [--no-fetch]]
  brew edit [FORMULA...]

Further help:
  brew commands
  brew help [COMMAND]
  man brew
  https://docs.brew.sh
```

brew info
--

```console
$ brew info python
python: stable 3.7.3 (bottled), HEAD
Interpreted, interactive, object-oriented programming language
https://www.python.org/
/usr/local/Cellar/python/3.7.3 (3,862 files, 59.9MB) *
  Poured from bottle on 2019-06-28 at 20:12:50
From: https://github.com/Homebrew/homebrew-core/blob/master/Formula/python.rb
==> Dependencies
Build: pkg-config ✘
Required: gdbm ✔, openssl ✔, readline ✔, sqlite ✔, xz ✔
==> Options
--HEAD
	Install HEAD version
==> Caveats
Python has been installed as
  /usr/local/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /usr/local/opt/python/libexec/bin

If you need Homebrew's Python 2.7 run
  brew install python@2

You can install Python packages with
  pip3 install <package>
They will install into the site-package directory
  /usr/local/lib/python3.7/site-packages

See: https://docs.brew.sh/Homebrew-and-Python
==> Analytics
install: 347,209 (30 days), 1,225,662 (90 days), 4,301,088 (365 days)
install_on_request: 165,616 (30 days), 593,969 (90 days), 2,417,585 (365 days)
build_error: 0 (30 days)
```
