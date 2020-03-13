https://github.com/joshdick/onedark.vim


```vim 
" for onedark
Plugin 'joshdick/onedark.vim'
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
```

```vim
:source %
```
```vim
:PluginInstall
```



option

```vim
Plugin 'itchyny/lightline.vim'
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
```


```console
$ cp ~/.vim/bundle/onedark.vim/autoload/airline/themes/onedark.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/
```

```vim
let g:airline_theme='onedark'
```
