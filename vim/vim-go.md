
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

```
vim-go: gogetdoc not found. Installing github.com/zmb3/gogetdoc to folder /home/ec2-user/go/bin/
vim-go: guru not found. Installing golang.org/x/tools/cmd/guru to folder /home/ec2-user/go/bin/
vim-go: gopls not found. Installing golang.org/x/tools/gopls@latest to folder /home/ec2-user/go/bin/
vim-go: fillstruct not found. Installing github.com/davidrjenni/reftools/cmd/fillstruct to folder /home/ec2-user/go/bin/
vim-go: godef not found. Installing github.com/rogpeppe/godef to folder /home/ec2-user/go/bin/
vim-go: motion not found. Installing github.com/fatih/motion to folder /home/ec2-user/go/bin/
vim-go: errcheck not found. Installing github.com/kisielk/errcheck to folder /home/ec2-user/go/bin/
vim-go: dlv not found. Installing github.com/go-delve/delve/cmd/dlv to folder /home/ec2-user/go/bin/
vim-go: gocode not found. Installing github.com/mdempsky/gocode to folder /home/ec2-user/go/bin/
vim-go: impl not found. Installing github.com/josharian/impl to folder /home/ec2-user/go/bin/
vim-go: golangci-lint not found. Installing github.com/golangci/golangci-lint/cmd/golangci-lint to folder /home/ec2-user/g
o/bin/
vim-go: gotags not found. Installing github.com/jstemmer/gotags to folder /home/ec2-user/go/bin/
vim-go: gorename not found. Installing golang.org/x/tools/cmd/gorename to folder /home/ec2-user/go/bin/
vim-go: goimports not found. Installing golang.org/x/tools/cmd/goimports to folder /home/ec2-user/go/bin/
vim-go: gocode-gomod not found. Installing github.com/stamblerre/gocode to folder /home/ec2-user/go/bin/
vim-go: gomodifytags not found. Installing github.com/fatih/gomodifytags to folder /home/ec2-user/go/bin/
vim-go: keyify not found. Installing honnef.co/go/tools/cmd/keyify to folder /home/ec2-user/go/bin/
vim-go: golint not found. Installing golang.org/x/lint/golint to folder /home/ec2-user/go/bin/
vim-go: iferr not found. Installing github.com/koron/iferr to folder /home/ec2-user/go/bin/
vim-go: asmfmt not found. Installing github.com/klauspost/asmfmt/cmd/asmfmt to folder /home/ec2-user/go/bin/
vim-go: gometalinter not found. Installing github.com/alecthomas/gometalinter to folder /home/ec2-user/go/bin/
vim-go: installing finished!
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

```
autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal tabstop=4
autocmd FileType go setlocal shiftwidth=4
```

tutorial
--

https://github.com/fatih/vim-go-tutorial#go-to-definition

*go to definition*  
jump to definition
`gd` or `ctrl+]`
return 
`ctrl+t`(recommend)  or `ctrl+o`
