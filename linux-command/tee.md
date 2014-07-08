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
echo "abcdefg" | tee -a file
```


### my解説

通常ファイルに書き出す場合は

```bash
echo "contents" > file
```
これだと標準出力がファイルにリダイレクションされる  
この例では`echo`なので、何がファイルに入るかは事前にわかってるが、動的に出力されるものだとファイルを開いてみるまではわからない

```
$ ps axu|grep mongod |grep -v grep
mongod    1230  0.1  1.7 452876 30388 ?        Sl   17:11   0:10 /usr/bin/mongod -f /etc/mongod.conf
```
mongdbのプロセスIDを確認した後に記憶しておきたいとする
```
$ ps axu|grep mongod |grep -v grep > file
```
これでは何も表示されない

記憶もしたいし画面でも確認したいときはこれ
```
$ ps axu|grep mongod |grep -v grep | tee -a file
mongod    1230  0.1  1.7 452876 30388 ?        Sl   17:11   0:10 /usr/bin/mongod -f /etc/mongod.conf
```
