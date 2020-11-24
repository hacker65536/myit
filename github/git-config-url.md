
# url.\<base\>.insteadof

https://git-scm.com/docs/git-config#Documentation/git-config.txt-urlltbasegtinsteadOf

```
[url "https://github.com/"]
  insteadOf = git@github.com:
```

```
git config --global url."https://github.com/private".insteadOf git@github.com:private/
```

```
git config --global url."https://github.com/private".insteadOf ssh://git@github.com/private
```
