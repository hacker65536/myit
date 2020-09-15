# zsh aws completion

https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-configure-completion.html

`~/.zshrc`

```zsh
autoload bashcompinit
bashcompinit
complete -C 'aws_completer' aws
```
