https://github.com/amix/vimrc

## backup your vimrc before install
```console
$ cp ~/.vimrc{,_bak}
```


## Awesome
```console
$ git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
$ sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## basic
```console
$ git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
$ sh ~/.vim_runtime/install_basic_vimrc.sh
```


## update
```console
$ cd ~/.vim_runtime
$ git pull --rebase
```

## vimrc
```vim
set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
```

## add own config
```console
$ cp ~/.vimrc_bak  ~/.vim_runtime/my_configs.vim
```
