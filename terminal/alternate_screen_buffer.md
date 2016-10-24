
termcap/terminfo


terminfo
```
infocmp > infocmp.ti
cp infocmp.ti{,.org}
vim infocmp   # remove rmcup=\E[?1049l, smcup=\E[?1049m,

tic -o ~/.terminfo infocmp.ti
```


ref

http://srad.jp/~doda/journal/438524  
http://blog.clouder.jp/2009/10/06/terminfoalterna/  
http://doda.b.osdn.me/2013/01/02/%E4%BB%A3%E6%9B%BF%E7%94%BB%E9%9D%A2%E3%83%90%E3%83%83%E3%83%95%E3%82%A1-1/  
