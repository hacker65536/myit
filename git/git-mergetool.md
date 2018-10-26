https://gist.github.com/karenyyng/f19ff75c60f18b4b8149

```console
$ git config merge.tool vimdiff
```

```
Auto-merging animals.txt
CONFLICT (content): Merge conflict in animals.txt
Automatic merge failed; fix conflicts and then commit the result.
```


```
git mergetool animals.txt
```

move to next point of conflict `]c` or `[c`


```
:diffg <RE/BA/LO>
```


```
rm animals.txt.orig
```

or

```
git config --global mergetool.keepBackup false
```
