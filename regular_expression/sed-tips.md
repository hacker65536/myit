

先頭文字取得
```console
$ echo "93015c336f0b06ce089ad3d3533f62ed67b646bd" | sed-go 's/(.{7}).*/$1/'
93015c3
```

数字にカンマ
```console
$ echo "8760 * 16 * 103" | bc | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta'
14,436,480
```


crlf->lf
```console
$ sed -i 's/\r//g' crlf.txt
```
