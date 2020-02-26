# GNU make

https://www.gnu.org/software/make/manual/make.html

## rule

```makefile
target ... : prerequisites ...
      recipe
      ...
      ...
```

target = プログラムによって生成されるファイル名 || アクション名 e.g. clean

prerequisites = 依存ファイル

recipe = command (recipeのlineの先頭にはtabが必要
