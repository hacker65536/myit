```vim
" starnderd settings
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=0
set paste
```

```vim
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
```

```vim
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
```

```vim
" for java
syntax on
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1
```
