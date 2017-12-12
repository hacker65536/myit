
https://qiita.com/edo_m18/items/9b6be35907433e1c743e


```
yum install lldb
```

```
yum install clang
```


main.c
```c
#include <stdio.h>

int main(void) {
  printf("Hello World!");
  return 0;
}
```

```
gcc -o main -g main.c
```

```
lldb main
(lldb) target create "main"
Current executable set to 'main' (x86_64).
(lldb)
``
