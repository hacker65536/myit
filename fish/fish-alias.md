
https://orako-column.com/fish-shell/

https://wiki.archlinux.org/index.php/Fish#Setting_fish_as_default_shell

`~/.config/fish/config.fish`

```fish
alias ef 'vim ~/.config/fish/config.fish'
alias t 'terraform'

function reload
  source ~/.config/fish/config.fish
end
```
```fish
. ~/.config/fish/config.fish
```
