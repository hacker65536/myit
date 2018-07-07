
https://github.com/fatih/vim-go

vim-plug
----

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/fatih/vim-go.git ~/.vim/plugged/vim-go
```

```
cat <<'EOF' >> ~/.vimrc
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()
EOF
```

https://vimawesome.com/plugin/vim-go-sparks-fly

pathogen
----
```consle
$ cd ~/.vim/bundle
$ git clone https://github.com/fatih/vim-go
```

install dependencies
```vim
:GoInstallBinaries
```
