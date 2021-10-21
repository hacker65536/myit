https://www.reddit.com/r/vim/comments/3oo156/whats_your_best_vim_related_shell_script/

https://vim-jp.org/blog/2015/10/15/tovim-on-shell-command-pipes.html


```bash
cat <<"EOF" > ~/.local/bin/tovim
#!/bin/bash
set -e

TOVIMTMP=~/.tovim_tmp_`date +%Y-%m-%d_%H-%M-%S.txt`
trap 'rm $TOVIMTMP' ERR

cat > $TOVIMTMP
vim $TOVIMTMP < /dev/tty > /dev/tty
cat $TOVIMTMP
rm $TOVIMTMP
EOF
```

```bash
chmod 755 ~/.local/bin/tovim
```


