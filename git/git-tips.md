

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


multi users , multi keys
--

https://superuser.com/questions/232373/how-to-tell-git-which-private-key-to-use

```console
$ GIT_SSH_COMMAND='ssh -i ~/.ssh/mykey01' hub clone git@github.com:myname/myrepo.git
```
```console
$ cd myrepo
$ git config --local core.sshCommand 'ssh -i ~/.ssh/mykey01' 
```

最初に空commitをする
--

```
git init
git commit --allow-empty -m "first commit"
```

git refname 'origin/master' is ambiguous
--

```
❯ git branch -u origin/master master
warning: refname 'origin/master' is ambiguous.
fatal: Ambiguous object name: 'origin/master'.
```


solution

```
❯ git branch -l
* master
  origin/master
```

```
❯ git branch -d origin/master
Deleted branch origin/master (was xxxxxx).
```

```
❯ git branch -u origin/master master
Branch 'master' set up to track remote branch 'master' from 'origin'.
```
