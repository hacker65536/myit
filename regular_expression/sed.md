
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

複数条件適応し書換え
```bash
sed -e 's/aaa/bbb/g' -e 's/ccc/ddd/g' -i file
```

1行～５行まで削除して置き換え
```bash
sed -i 1,5d file
```

1行～5行`以外`削除して置き換え
```bash
sed -i 1,5\!d file
```

3行目のみ出力　defaultでは全部出力されるので -n silent modeにしてから `p`で出力
```bash
sed -n -e 3p file
```

