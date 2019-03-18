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
