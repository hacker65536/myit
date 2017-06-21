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
