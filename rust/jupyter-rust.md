install rust

install jupyter

install libzmq

```
pkg-config --cflags --libs libzmq
-DZMQ_BUILD_DRAFT_API=1 -I/usr/local/include  -L/usr/local/lib -lzmq
```
