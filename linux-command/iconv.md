
## convert text from one character encoding to another

* -f from-encoding
* -t to-encoding
* -o outputfile

```bash
$ cat vim_utf8
あいうえお
今日はいい天気です。
utf8

$ file -i vim_utf8
vim_utf8: text/plain; charset=utf-8

$ iconv -f utf-8 -t sjis vim_utf8 -o vim_sjis

$ file -i vim_sjis
vim_sjis: text/plain; charset=unknown-8bit

$ iconv -f utf-8 -t euc-jp vim_utf8 -o vim_euc

$ file -i vim_euc
vim_euc: text/plain; charset=iso-8859-1
```
