
#first
pathogen

https://github.com/tpope/vim-pathogen

```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

.vimrc
```vim
execute pathogen#infect()
```

#dl and settings
```
cd ~/.vim/bundle
git clone https://github.com/hashivim/vim-terraform.git
```
