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
