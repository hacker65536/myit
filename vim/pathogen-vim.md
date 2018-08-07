
https://github.com/tpope/vim-pathogen

```console
$ mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

vimrc
```vimr
execute pathogen#infect()
syntax on
filetype plugin indent on
```
