# tar


`-x`  extract

`-z` gzip

`-v` verbose

`-f` file


uncompress

```
tar xf file.tar.gz
```

compress

```
tar cfzv dir.tar.gz dir/
```



`c` create new archive   
`x` extract,get  
`t` list  


`a` auto--compress  
`J` .xz  
`j` .bg2  
`z` .gz  


```
EXAMPLES
       tar -cf archive.tar foo bar
              # Create archive.tar from files foo and bar.

       tar -tvf archive.tar
              # List all files in archive.tar verbosely.

       tar -xf archive.tar
              # Extract all files from archive.tar.
```


specify dir
```
mkdir tmp
tar xf archive.tar.gz -C tmp
```


tips
--



```
tar: Removing leading `/' from member names
```

絶対パスでアーカイブする場合、展開時に問題が起こるので `-P` ではなく `-C`をつける 


https://curecode.jp/tech/tar-removing-leading-from-member-names/

https://unix.stackexchange.com/questions/59243/tar-removing-leading-from-member-names



with pigz

```
tar -cf bigsizeback.tar.gz -I pigz /path/to/bigsizedir
```
```
tar -I pigz -xf bigsizeback.tar.gz -C /tmp
```
