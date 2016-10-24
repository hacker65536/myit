install dein
https://github.com/Shougo/dein.vim


https://github.com/lambdalisue/vim-gista

~/.vimrc

```vim 
" dein.vim (Lazy)
call dein#add('lambdalisue/vim-gista', {
    \ 'on_cmd': 'Gista'
    \})
 
 
 
" set login user
let g:gista#client#default_username = "hacker65536"

" if use github

"let g:gista#client#use_git_config_github_username = "hacker65536"
```


```
$ vim file


:Gista login

:Gista list
```
