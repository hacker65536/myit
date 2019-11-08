
ヒストリ件数を増やす
```console
$ echo "HISTSIZE=100000" >> ~/.bashrc
```


複数terminal上の操作をヒストリに残す設定
```
$ echo "export PROMPT_COMMAND='history -a'" >> ~/.bashrc
```

ヒストリを残さい設定
```
$ HISTCONTROL=ignoreboth
$ HISTIGNORE=*
```
解除
```
$ unset HISTIGNORE
```
