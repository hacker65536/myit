# pigz 
http://www.zlib.net/pigz/


pigz, which stands for parallel implementation of gzip



```
       pigz [ -cdfhikKlLnNqrRtTz0..9,11 ] [ -b blocksize ] [ -p threads ] [ -S suffix ] [ name ...  ]
       unpigz [ -cfhikKlLnNqrRtTz ] [ -b blocksize ] [ -p threads ] [ -S suffix ] [ name ...  ]
```



fast pack
```
tar -cf bigsizeback.tar.gz -I pigz /path/to/bigsizedir
```
`-I, --use-compress-program=PROG`

fast unpack
```
tar -I pigz -xf bigsizeback.tar.gz -C /tmp
```
