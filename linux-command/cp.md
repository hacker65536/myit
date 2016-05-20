
1 argument
```bash
cp long-long-long-file-name.txt{,.old}

ls -la long-long-long-file-name.txt*
-rw-r--r-- 1 root root 0 May 20 02:19 long-long-long-file-name.txt
-rw-r--r-- 1 root root 0 May 20 02:19 long-long-long-file-name.txt.old
```

backup numbered
```
cp --backup=numbered -f long-long-long-file-name.txt long-long-long-file-name.txt
cp --backup=numbered -f long-long-long-file-name.txt long-long-long-file-name.txt

ls -la long-long-long-file-name.txt*
-rw-r--r-- 1 root root 0 May 20 02:19 long-long-long-file-name.txt
-rw-r--r-- 1 root root 0 May 20 02:23 long-long-long-file-name.txt.~1~
-rw-r--r-- 1 root root 0 May 20 02:23 long-long-long-file-name.txt.~2~
-rw-r--r-- 1 root root 0 May 20 02:19 long-long-long-file-name.txt.old
```

backup option
* none, off : never backups (even if --backup is given)
* numbered, t : make numbered backups
* existing, nil : numbered if numbered backup exist, simple otherwise
* simple, never : always make simple backups
