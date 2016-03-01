show formatoptions
```
:se fo

formatoptions=crocql
```

        t - textwidth
        c - comments (plus leader -- see :help comments)
        o - Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
        q - allogw 'gq' to work
        n - numbered lists
        2 - keep second line indent
        1 - single letter words on next line
        r - (in mail) comment leader after 
      
      
.vimrc
```
au FileType * setlocal formatoptions-=ro
```
