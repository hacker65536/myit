リモート含めてすべてのブランチ表示

```
git branch -a
```

マージ済み一覧表示

```
git branch --merged
```

マージ済みブランチ削除
```
git branch --merged  | egrep -v '* master' | xargs git branch -d
```

リモートでブランチを削除したら　リモート追跡ブランチを削除
```
git fetch --prune
```

tracking
```
git branch --set-upstream-to=origin/master master
```

1.8+
```
git branch -u upstream/foo
git branch -u upstream/foo foo
git branch --set-upstream-to=upstream/foo
git branch --set-upstream-to=upstream/foo foo
```


```console
$ git remote
hacker65536
origin
```

```console
$ git branch --v
* fix    d4939d5 fix
  master 6f1143e Create pull_request_template.md
```
```console
$ git branch -vv
* fix    d4939d5 [hacker65536/fix] fix
  master 6f1143e [hacker65536/master] Create pull_request_template.md
```
```console
$ git branch --set-upstream-to origin/master
Branch 'fix' set up to track remote branch 'master' from 'origin'.
```
```console
$ git branch -vv
* fix    d4939d5 [origin/master: ahead 1] fix
  master 6f1143e [hacker65536/master] Create pull_request_template.md
```
```console
$ git branch master --set-upstream-to origin/master
Branch 'master' set up to track remote branch 'master' from 'origin'.
```
```console
$ git branch -vv
* fix    d4939d5 [origin/master: ahead 1] fix
  master 6f1143e [origin/master] Create pull_request_template.md
```
