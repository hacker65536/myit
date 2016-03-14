
#sed

初回のみ置換(一回目のパターンまで=初回のみ置換)  
```bash
sed -i '1,/parttern/s/pattern/replace/' file
```

行の置き換え
8から9行をstrに置き換え
```bash
sed -i '8,9c\str' file
```
