# gh



install
--

```console
$ brew install gh
```


https://cli.github.com/manual/

alias
--
```
gh alias set --shell sync 'gh repo sync $(git remote get-url origin  | sed -e "s#https://github.com/##" -e "s:\.git::")'
```

```
❯ gh sync
✓ Synced the "hacker65536:master" branch from "upstream:master"
```
