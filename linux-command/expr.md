evalute expression
==================

```bash
$ a='';b='abcd';c='abcd'

$ expr "$a" = "$b"
0

$ expr "$b" = "$c"
1

$ expr "$a" \| "$b"
abcd

$ expr length $b
4

$ expr index  $b c
3

$ expr substr $b 1 3
abc
```
