# git update-ref

https://git-scm.com/docs/git-update-ref



最初のcommitをやり直す

```
git update-ref -d HEAD
```

```
git rm --cached secretfile
```

```
git commit -m "first commit"
```


最初はからコミットを入れていまう方法

```
git init
git commit --allow-empty -m "first commit"
```
