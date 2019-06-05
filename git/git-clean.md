
1. create repository from github via web browser
2. create repository on local device
3. merge

```console
$ cobra init github.com/hacker65536/tf
$ cd $GOPATH/src/!$
```

```console
$ git init
$ git config --local user.name xxxxx
$ git config --local user.email xxx@xxxx
$ git remote add git@github.com:hacker65536/tf
```

```console
$ git pull origin master
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 5 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (5/5), done.
From github.com:hacker65536/tf
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> origin/master
error: The following untracked working tree files would be overwritten by merge:
        LICENSE
Please move or remove them before you merge.
Aborting
```

```console
$ git clean -i
Would remove the following items:
  LICENSE  main.go
*** Commands ***
    1: clean                2: filter by pattern    3: select by numbers
    4: ask each             5: quit                 6: help
What now> 4
Remove LICENSE [y/N]? n
Remove main.go [y/N]? n
```
```console
$ git clean -i
Would remove the following items:
  LICENSE  main.go
*** Commands ***
    1: clean                2: filter by pattern    3: select by numbers
    4: ask each             5: quit                 6: help
What now> 3
    1: LICENSE    2: main.go
Select items to delete>> 
```
```console
$ git clean -i
Would remove the following items:
  LICENSE  main.go
*** Commands ***
    1: clean                2: filter by pattern    3: select by numbers
    4: ask each             5: quit                 6: help
What now> 2
  LICENSE  main.go
Input ignore patterns>>
```

```console
$ git clean --dry-run
Would remove LICENSE
Would remove main.go
```


dryrun
```console
$ git clean -d -x -n
```
delete all
```console
$ git clean -d -x -f
```
