https://github.com/mattn/gist-vim

install from pathogen 
------------------
install pathogen and settings
```console
$ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```
~/.vimrc
```vim
execute pathogen#infect()
```

install gist-vim and webapi-vim
```console
$ git clone https://github.com/mattn/gist-vim ~/.vim/bundle/gist-vim
$ git clone https://github.com/mattn/webapi-vim ~/.vim/bundle/webapi-vim
```


configure github
-----------------
```console
$ git config --global github.user Username
```


configure gist-vim
------------
`~/.vimrc`
```vim
" :w and :w! update a gist.
" let g:gist_update_on_write = 1

" Only :w! updates a gist.
let g:gist_update_on_write = 2
```


usage
---------
show list of gist

```vim
:Gist -l
```



if using neobundle
---------
```vim
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
```
