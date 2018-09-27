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
