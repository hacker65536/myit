
```Dockerfile
From debian:wheezy
RUN apt-get update && apt-get install -y cowsay fortune
```


```
$ docker history test/cowsayimage
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
59c7382efee7        39 hours ago        bash                                            57.1 MB
a20fd0d59cf1        3 weeks ago         /bin/sh -c #(nop)  CMD ["bash"]                 0 B
<missing>           3 weeks ago         /bin/sh -c #(nop) ADD file:ebba725fb97cea4...   100 MB
```
