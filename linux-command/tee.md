# tee

read from standard input and write to standard output and files

## option
-a,--append  
- append to the given FILEs don't overwrite

-i, --ignore-interrupts

- ignore interrupt signals

--help

--version

## exsample

```bash
echo "contents" | tee -a file
```


### my解説

通常ファイルに書き出す場合はよく下記のように入力することがある

```bash
echo "contents" > file
```
これだと標準出力がファイルにリダイレクションされる  
標準出力のデフォルトは画面(ディスプレイ)なのでこれをファイルに切り替える(リダイレクション)  
言い換えると画面には表示されなくなる  
この例では`echo`なので、ファイルに入る文字列は予めわかってるが、logなどの動的に出力されるものだとファイルを開いてみるまではわからない

```
$ ps axu|grep mongod |grep -v grep
mongod    1230  0.1  1.7 452876 30388 ?        Sl   17:11   0:10 /usr/bin/mongod -f /etc/mongod.conf
```
mongodbのプロセスIDを確認した後に記憶しておきたいとする
```
$ ps axu|grep mongod |grep -v grep > file
```
これでは何も表示されない

ファイルにも記述したいし画面でも確認したいときはこれ
```
$ ps axu|grep mongod |grep -v grep | tee -a file
mongod    1230  0.1  1.7 452876 30388 ?        Sl   17:11   0:10 /usr/bin/mongod -f /etc/mongod.conf
```

## error判定

```
bash -c 'sh hoge.sh | tee -a log ; exit ${PIPESTATUS}'
```

## stdout & pipe

```
echo aaa | tee >(cat >/dev/null)
aaa
```
