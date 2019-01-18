
https://github.com/fatih/vim-go  
https://vimawesome.com/plugin/vim-go-sparks-fly


vim-plug
----

```console
$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$ git clone https://github.com/fatih/vim-go.git ~/.vim/plugged/vim-go
```

```vim
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()
```


pathogen
----
```consle
$ git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
```

install dependencies
```vim
:GoInstallBinaries
```


usage
---
`:GoRun` `:GoBuild` `:GoBuild!` `:GoInstall` `:GoTest`

```vim
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
```
