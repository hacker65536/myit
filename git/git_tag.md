```bash
git tag -a v0.1 -m "tag message"
```

delete tag (from remote)
```bash
git tag -d tagname

git push origin :tagname
```


```
repo=ttps://github.com/USER/REPO
git ls-remote --refs --sort="version:refname" --tags $repo | cut -d/ -f3-|tail -n1
```
