
change prefix from C-b to C-z ( as same as screen)


start tmux
```console
$ tmux
```

or

start tmux with session name
```console
$ tmux new -s mysession
```


list session
```console
$ tmux ls
0: 2 windows (created Mon Nov 19 01:34:38 2018) [121x41]
mysession: 1 windows (created Mon Nov 19 01:52:34 2018) [121x41]
```




detach  
`C-z -> d `


create  window   
`C-z -> c`

split horizontal window  
`C-z -> %`

split vertical window  
`C-z -> "`

