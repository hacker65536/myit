# git alias

https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases

```console
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'
```

`~/.gitconfig`
```gitconfig
[alias]
        co = checkout
        br = branch
        ci = commit
        st = status
        last = log -1 HEAD
```
