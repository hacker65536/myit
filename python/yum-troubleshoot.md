```console
$ sudo yum search pip
  File "/bin/yum", line 30
    except KeyboardInterrupt, e:
                            ^
SyntaxError: invalid syntax
```

https://stackoverflow.com/questions/11213520/yum-crashed-with-keyboard-interrupt-error
> because yum dose not support python3

workaround

```console
$ ls -la /usr/bin/python2
lrwxrwxrwx 1 root root 9 May  9 23:56 /usr/bin/python2 -> python2.7
$ sudo sed -e '1s/.*/#!\/usr\/bin\/python2/g' -i /usr/bin/yum
```
