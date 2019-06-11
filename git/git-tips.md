

pushする前にcommitのやり直す。追加で編集するファイルがあった場合。
---------------
```
# edit something
git add edited-file
git commit --amend
```
commentの書き直しのためにeditor(vi)がたちが上がる、変更があれば書き直しなければ閉じる


logから変更したファイルを確認
--------------
```
git log --stat 
git log --stat --oneline # simplified 
```


commitの差分確認
-------------
```
git diff SHA^..SHA
```

Remote branch と同期
--
remoteで削除されているbranchがlocalに残っている場合

```console
$ git remote update origin --prune
```

```console
$ git remote prune origi
```

```console
$ git fetch --prune
```
