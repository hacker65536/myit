# jo

https://github.com/jpmens/jo


install
--

require autoconf automake


```console
$ git clone git://github.com/jpmens/jo.git
$ cd jo
$ autoreconf -i
$ ./configure
$ make check
$ sudo make install
```

```
$ jo -p name=jo n=17 parser=false
{
    "name": "jo",
    "n": 17,
    "parser": false
}
```
