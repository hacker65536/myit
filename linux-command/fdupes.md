# fdupes

fdupes - finds duplicate files in a given set of directories

```
$ yum install fdupes --enablerepo=epel
```


```
$ fdupes -S ./
4 bytes each:
./ccc
./ddd

4 bytes each:
./aaa
./bbb

```


omit first file
```
$ fdupes -f ./
./ddd

./bbb
```


delete immediately(omit first and noprompt)

```
$ fdupes -dI ./
   [+] ./ccc
   [-] ./ddd

   [+] ./aaa
   [-] ./bbb
```

```
$ ls -l
total 8
-rw-rw-r-- 1 ec2-user ec2-user 4 Sep  9 08:03 aaa
-rw-rw-r-- 1 ec2-user ec2-user 4 Sep  9 08:06 ccc
```
