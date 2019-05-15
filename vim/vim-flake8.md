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


plus
--

ignore E501

```vim
let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_flake8_args = '--ignore="E501"'
```

```
E501 line too long (96 characters)

```
