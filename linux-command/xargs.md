

https://stackoverflow.com/questions/6958689/calling-multiple-commands-through-xargs


```console
$ ls | xargs -n1 -I % sh -i -c 'echo 1 %; echo 2 %'
```
