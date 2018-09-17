
https://github.com/altercation/vim-colors-solarized





```console
$ mkdir -p ~/.vim/colors/
$ curl -LSs -o ~/.vim/colors/solarized.vim https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
```


```vim
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast='normal'
let g:solarized_visibility='normal'

syntax enable
set background=dark
colorscheme solarized
```


`let g:solarized_termtrans=1`

![before](./vim-solarized1.PNG)
![after](./vim-solarized2.PNG)

or
```
export TERM=xterm-256color
```
