
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
let g:go_highlight_operators = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_extra_types = 1
```



tutorial
--

https://github.com/fatih/vim-go-tutorial#go-to-definition

*go to definition*  
jump to definition
`gd` or `ctrl+]`
return 
`ctrl+t`(recommend)  or `ctrl+o`
