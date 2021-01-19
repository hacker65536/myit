# lazygit

https://github.com/jesseduffield/lazygit


install
--


```console
$ brew install jesseduffield/lazygit/lazygit
```

`~/.zshrc`

```zsh
lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}
```
