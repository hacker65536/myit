https://github.com/jeffkreeftmeijer/vim-numbertoggle

pathogen
```
cd ~/.vim/bundle
git clone https://github.com/jeffkreeftmeijer/vim-numbertoggle
```


`~/.vimrc`
```vim
set number relativenumber
```


enable disable toggle
```
:set number norelativenumber
```

```
" turn absolute line numbers on
:set number
:set nu

" turn absolute line numbers off
:set nonumber
:set nonu

" toggle absolute line numbers
:set number!
:set nu!
```
```
" turn relative line numbers on
:set relativenumber
:set rnu

" turn relative line numbers off
:set norelativenumber
:set nornu

" toggle relative line numbers
:set relativenumber!
:set rnu!
```

```
" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" turn hybrid line numbers off
:set nonumber norelativenumber
:set nonu nornu

" toggle hybrid line numbers
:set number! relativenumber!
:set nu! rnu!
```
