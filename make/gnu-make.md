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

## processs

defaultでは最初のtargetを実行する

依存関係のないtargetは個別で実行する e.g. make clean


## variables

重複を変数に格納することでエラーの誘発を防ぐ

```make
objects = main.o kbd.o command.o display.o \
          insert.o search.o files.o utils.o

edit : $(objects)
        cc -o edit $(objects)
```

