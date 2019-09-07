# deoplete

https://github.com/Shougo/deoplete.nvim


install
--


```vim
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1
```



require
--

```
$ pip3 install --user pynvim
```


```
[vim-hug-neovim-rpc] Vim(pythonx):ModuleNotFoundError: No module named 'neovim'
```



