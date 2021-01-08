```bash
git log -S "keyword"
```

```bash
git show COMMIT
```


search commiter | author
```bash
git log --pretty=full --committer=COMMITTER
git log --pretty=full --author=AUTHOR
```

```bash
git log --pretty=full
```

```
git log --since="4 days ago" --until="2017/03/33"
```


```
git log -n 10
```

```
git log -- /path/file
```


```
git log --grep="comment"
```

```
git log --merges
```

```
git log --reverse
```


search deleted files

```
git log --diff-filter=D --summary
```

all branch
```
git log --all
```


```
git log --stat
```

## format date hash author comment
```console
$ git log --pretty=format:"%C(auto)[%as] %h %<(18)%an : %s"
```
```
[2020-12-15] 189df2e4 Claudia            : Use eksbuild.1 coredns image (#2951)
[2020-12-15] b0ff6d69 Mike               : Add oneOf support to schema generation (#2949)
[2020-12-15] 09b1cca7 Claudia            : Merge pull request #2947 from Callisto13/cb-remove-code
[2020-12-15] fdd12ef4 Claudia Beresford  : Delete UpdateAddonsTask
[2020-12-15] 44493c57 Claudia            : Merge pull request #2941 from Callisto13/cb-1-14-unsupported
[2020-12-14] 9e001238 Claudia Beresford  : Deprecate v1.14
[2020-12-15] 528d4bdd Claudia            : Merge pull request #2932 from Callisto13/cb-odd-fixes
[2020-12-15] dfadb303 Mike               : Merge branch 'master' into cb-odd-fixes
[2020-12-15] fa81ff96 Mike               : Don't run bootstrap scripts twice and before preBootstrap (#2924)
[2020-12-11] afb230f0 Claudia Beresford  : Use coredns:v1.7.0
[2020-12-11] b70ea895 Claudia Beresford  : Bump pause image
[2020-12-11] 48fa170f Claudia Beresford  : Use AMITypesAl2X8664 constant
[2020-12-11] 79f484bc Claudia Beresford  : Fix typo
```

```console
 git config --global format.pretty format:"%C(auto)[%as] %h %<(18)%an : %s"
