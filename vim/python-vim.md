```
cd ~/.vim
mkdir -p bundle && cd bundle
git clone https://github.com/python-mode/python-mode.git
```
```vim
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
```
