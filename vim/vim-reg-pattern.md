


否定


http://vimdoc.sourceforge.net/htmldoc/usr_27.html

https://vim-jp.org/vim-users-jp/2009/09/20/Hack-75.html


```vim
:%s#^negativewordstart\@!\(.*\)nagativewordend\@<!#[\1]#
```


example
```
title1
sometextt111
title2
sometext222
title3
sometext222
```

```vim
:%s/^\(some\)\@!\(.*\)$\@<!/[\2]/
```

```
[title1]
sometextt111
[title2]
sometext222
[title3]
sometext222
```
