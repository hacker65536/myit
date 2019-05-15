# vimflake8

https://github.com/nvie/vim-flake8


install with pathogen
--
```console
$ cd ~/.vim/bundle
$ git clone https://github.com/nvie/vim-flake8
```

usage
--
1. open a python file
2. press `<F7>`


`~/vimrc`
```vim
autocmd BufWritePost,BufRead *.py call Flake8()
```


customize
--

`~/.config/flake8`


ignore E501,W293
```
[flake8]
max-line-length = 120
- `g:flake8_max_line_length=120`
- `g:flake8_ignore="E501,W293"`
```
