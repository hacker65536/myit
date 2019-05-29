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
diff --side-by-side | -y  a.txt b.txt
```
also see sdiff


diff unified
```
diff -u a.txt b.txt
```

patch作成
```console
$ diff -up a.txt b.txt > test.patch
```
