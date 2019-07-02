# gdrive

https://github.com/gdrive-org/gdrive


install
--

```console
$ curl -SsL -o gdrive \ 
'https://drive.google.com/uc?id=1Ej8VgsW5RgK66Btb9p74tSdHMH3p4UNb&export=download'  && \
chmod +x gdrive && sudo mv gdrive /usr/local/bin/
```

usage
--


```console
$ gdrive list
```

```console
$ gdrive upload files/ --parent <ID> -r
```
