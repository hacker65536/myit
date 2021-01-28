```
git grep -e 'pattern1' --and 'pattern2'
```


search from history
```
git grep <regexp> $(git rev-list --all)
```

file name only

```console
$ git grep --files-with-matches 'word'
```
