# 楽々glang開発


## go の install

### 公式からdlする
https://go.dev/doc/install

### package マネージャから instlal

mac だと brew

windowsだと最近はwinget? WSLはubuntuと一緒かな


linux yum
```
sudo yum -y install golang
```

linux apt

```
apt -y update
apt install -y golang
```

[asdf](https://asdf-vm.com/) とかも 大丈夫

[linux brew](https://docs.brew.sh/Homebrew-on-Linux)　とかも大丈夫
個人的に linux brew 使う意味あるのかなと思うところがある


### source から install

https://go.dev/doc/install/source

[手順](https://github.com/hacker65536/myit/blob/master/golang/go-install-from-src.md)
go を installするにのに go が必要



## editor


### vim 

vimでgoといえばこれ [vim-go](https://github.com/fatih/vim-go)  
一番有名なやつだと思う 

[入れ方](https://github.com/hacker65536/myit/blob/master/vim/vim-go.md)

lspが台頭してから正解がわからない
pluginの沼、nvimとvimもどっちがいいのかが良くわからない


### vscode

私は [insiders派](https://code.visualstudio.com/insiders/)

毎日アップデートがあって、たまにおかしくなる

>Insiders has the most recent code pushes and may lead to the occasional broken build.

破壊がないと創造もない


goの[extension](https://marketplace.visualstudio.com/items?itemName=golang.go)をinstall

cmd + shfit + Pでコマンドパレット立ち上げて
`go: install` と入力する
<img width="604" alt="image" src="https://user-images.githubusercontent.com/2577368/193644546-ff505c03-c281-4cf8-88a9-0bfdca0fe3dd.png">

全部選択してinstall/updateをする  
<img width="601" alt="image" src="https://user-images.githubusercontent.com/2577368/193644968-404b3938-9f14-4efe-b664-c664d0d5dcec.png">

outputのペインでインストールの状況が確認できる
```console
Tools environment: GOPATH=/Users/UESRNAME/go
Installing 7 tools at /Users/USERNAME/go/bin in module mode.
  gotests
  gomodifytags
  impl
  goplay
  dlv
  golangci-lint
  gopls

Installing github.com/cweill/gotests/gotests@latest (/Users/USERNAME/go/bin/gotests) SUCCEEDED
Installing github.com/fatih/gomodifytags@latest (/Users/USERNAME/go/bin/gomodifytags) SUCCEEDED
Installing github.com/josharian/impl@latest (/Users/USERNAME/go/bin/impl) SUCCEEDED
Installing github.com/haya14busa/goplay/cmd/goplay@latest (/Users/USERNAME/go/bin/goplay) SUCCEEDED
Installing github.com/go-delve/delve/cmd/dlv@latest (/Users/USERNAME/go/bin/dlv) SUCCEEDED
Installing github.com/golangci/golangci-lint/cmd/golangci-lint@latest (/Users/USERNAME/go/bin/golangci-lint) SUCCEEDED
Installing golang.org/x/tools/gopls@latest (/Users/USERNAME/go/bin/gopls) SUCCEEDED

All tools successfully installed. You are ready to Go. :)
```


## project 作成


[go module以前は](https://go.dev/doc/gopath_code)

```
mkdir $GOPATH/src/github.com/user/hello
```

[今は](https://go.dev/doc/code)

```
$ mkdir hello 
$ cd hello
$ go mod init example/user/hello
```

毎回タイプして設定するの面倒なので、私はディレクトリに入ってからこのコマンドを実行しています。

`go mod init github.com/hacker65536/$(basename $(pwd))`


## cobra 準備

cliで使えるコマンド自体を作成するケースが多い、cobraをインストールしておく

kubectl,helm,hugo。。使ってない[cli系ツール](https://github.com/spf13/cobra/blob/main/projects_using_cobra.md)の方が少ないくらい

install
```
go get -u github.com/spf13/cobra@latest
```

準備できたら、これからコマンドをgoで開発したいと思っているディレクトリで初期化コマンドを実行する

```
cobra-cli init
```

サブコマンドを追加するコマンド

```
$ cobra-cli add subcmd
subcmd created at /Users/USERNAME/anygoprj
```

`cmd`の下にファイルが作られるので、必要な処理のコードを追加していく
```console
$ tree
.
|-- LICENSE
|-- cmd
|   |-- root.go
|   `-- subcmd.go
|-- go.mod
|-- go.sum
`-- main.go
```

[getopt](https://man7.org/linux/man-pages/man3/getopt.3.html)を自前でやるのは意外と面倒なのでこういうのを自動で生成してくれるのはとても便利。

そして変数やオプションからの読み込み、また設定ファイルを読み込み、コマンドに渡すための処理も自前で実装するのも面倒いので、同じ作者のViperがこの辺を便利に取り扱ってくれる、これもメッチャ便利

