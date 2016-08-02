
githubにcommitミスしたときにひとつ前のcommitに戻す場合

```bash
git reset --hard HEAD^
#git reset --soft HEAD^ #leave the file
git push -f origin HEAD^:master
```

直前のcommitをやり直す

```bash
git add .
git commit --amend
```

