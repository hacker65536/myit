
upper case lower case
--
- gUw 
- guw



go file
--
- gf
- ctrl + o


No newline at end of file
--

Vim will adds a new line to file is saved.
If don't need this change for commit into github, set binary noeol.

`\ No newline at end of file`
```
:set binary noeol
```

use nothing 
--

https://codeyarns.com/2014/05/20/how-to-start-vim-without-any-settings-or-plugins/

```
vim -u NONE file
```

## brew install vim on mac 

```
% vim index.json
Warning: Failed to set locale category LC_NUMERIC to en_JP.
Warning: Failed to set locale category LC_TIME to en_JP.
Warning: Failed to set locale category LC_COLLATE to en_JP.
Warning: Failed to set locale category LC_MONETARY to en_JP.
Warning: Failed to set locale category LC_MESSAGES to en_JP.
```

solution
https://discourse.brew.sh/t/failed-to-set-locale-category-lc-numeric-to-en-ru/5092/6

`.bash_profile` or `.zshrc`
```
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
```

to open file and go to a particular line
```console
$ vim +30 filename
```
