# vim-terraform

https://github.com/hashivim/vim-terraform

# first
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

# dl and settings
```
cd ~/.vim/bundle
git clone https://github.com/hashivim/vim-terraform.git
```

show script

`:script`

```
--snip--
 26: /usr/share/vim/vim74/indent/tf.vim
 27: ~/.vim/bundle/vim-terraform/after/ftplugin/terraform.vim
 28: ~/.vim/bundle/vim-terraform/syntax/terraform.vim
 29: ~/.vim/bundle/vim-terraform/indent/terraform.vim
 Press ENTER or type command to continue
```

.vimrc
```vim
let g:terraform_align=1
let g:terraform_fmt_on_save=1
```
