```bash
cat foo.txt | diff bar.txt -
```

```bash
diff <(cat foo.txt) <(cat bar.txt)
```

diff directory 
```
diff -rq dir1 dir2
```
diff side by side
```
diff --side-by-side a.txt b.txt
```

also see sdiff
