```bash
rsync -rtp --partial --append --progress user@host:/path/  /path/
```

option
---

- -a  -rlptgoD no -H, -A , -X
  - -r --recursive recurse into directories
  - -l --links  copy symlinks as symlinks
  - -p --perms preserve permissions
  - -t --times preserve modification times
  - -g --group preserve group
  - -o --owner 
  - -D same as --devices --specials
- -H --hard-links preserve hard links
- -A --acls preserve ACLs (implies -p)
- -X --xattrs preserve extended attributes



ref  
---

http://www.atmarkit.co.jp/ait/articles/1702/02/news031.html  
https://qiita.com/smallpalace/items/dd18a1e53830c58c6fe1  

