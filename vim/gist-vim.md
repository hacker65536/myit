https://github.com/mattn/gist-vim


```vim
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
```


configure github

```bash
git config --global github.user Username
```

show list of gist
```vim
:Gist -l
```

`~/.vimrc`
```vim
" :w and :w! update a gist.
" let g:gist_update_on_write = 1

" Only :w! updates a gist.
let g:gist_update_on_write = 2
```
