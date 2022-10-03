# 楽々glang開発のための読み物


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


## project layoutを学ぶ

https://github.com/golang-standards/project-layout

プロジェクトの中のディレクトリわけはセオリーがあるので知っておくと便利


パーツは`/pkg` or `/internal`に書く

あとは他のgolangで書いてるプロジェクトから学ぶ


https://github.com/trending/go?since=daily

<img width="1057" alt="image" src="https://user-images.githubusercontent.com/2577368/193654918-88145801-87c4-4879-80fd-d6c152acc076.png">

## goignore

golang用 gitignore

https://github.com/golang/go/blob/master/.gitignore


## makefile

https://sohlich.github.io/post/go_makefile/

[簡単なやつ](https://github.com/hacker65536/findlb/blob/main/Makefile)

いろんな人のmakefileを参考にちょっとずつチューニングするしか無いかもしれない



## aws-sdk-go-v2

awsを使っていると結構お世話になるやつです  
https://github.com/aws/aws-sdk-go-v2


[developer guide](https://aws.github.io/aws-sdk-go-v2/docs/)


[コード例](https://github.com/awsdocs/aws-doc-sdk-examples/tree/main/gov2)


## godoc

よくリファレンスとしてみるgodocですが、自分で作成するときにどうやるのか公式で書かれています

コメントの書き方のガイドラインがある


https://go.dev/blog/godoc

https://go.dev/doc/comment



godocはインストールする必要がある
```
go install golang.org/x/tools/cmd/godoc@latest
```

サーバが起動する
```console
$ godoc

using module mode; GOMOD=/Users/USERNAME/asg/go.mod

2022/10/04 04:10:17 cannot find package "." in:
	/src/github.com/hacker65536
```

ローカルアドレスをブラウザでみる

http://localhost:6060/

書いていれば何かしらが見えるようになる  
<img width="645" alt="image" src="https://user-images.githubusercontent.com/2577368/193659680-2feec547-0fde-4396-ae78-d6b66464aad3.png">




## デバッグ

golangのdebbugは[delve](https://github.com/go-delve/delve)が有名

[usage](https://github.com/go-delve/delve/tree/master/Documentation/usage)


vscodeの場合はtoolと一緒にinstallしているので、[vscodeからデバッグ](https://code.visualstudio.com/docs/editor/debugging)するほうが楽



`launch.json`を作成する [書き方の詳細](https://go.microsoft.com/fwlink/?linkid=830387)
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch Package",
            "type": "go",
            "request": "launch",
            "mode": "auto",
            "program": "${fileDirname}",
            "args": ["status"]
        }
    ]
}
```

止めたいコードにbreakpointを入れ、main.goを選んで実行する

<img width="1193" alt="image" src="https://user-images.githubusercontent.com/2577368/193661066-80e8674f-5062-40e1-a82b-155b4926260a.png">


## test


テストは書きましょう


とりあえずファイルは作っておく  
そして中身はただ関数を呼び出すだけのやつでもよい

<img width="484" alt="image" src="https://user-images.githubusercontent.com/2577368/193665089-b20ba6ec-1aad-4cf2-97a4-d56a4b7b9c87.png">


`want`と`got`にほしい結果と、実際関数を呼び出して得た結果を比べる

```go
if want != got {
    t.Errorf("input=%v\nwant=%v\ngot=%", input, want,got)
}
```

## snippet


vscodeではコマンドパレット開いて`snippets:`を入力して新しいuser snippetsの設定ができる
<img width="604" alt="image" src="https://user-images.githubusercontent.com/2577368/193666606-84449490-ab09-4355-a736-9d40bbba17bc.png">

[昔のやつ](https://github.com/microsoft/vscode-go/blob/master/snippets/go.json)

今は[こいつ](https://github.com/features/copilot)がいるのでもう必要無い気がする

<img width="344" alt="image" src="https://user-images.githubusercontent.com/2577368/193667101-c7b5e30d-f7a8-47a7-9c90-4732dc77d4d5.png">


## lint

https://golangci-lint.run/

[こういう](https://github.com/hacker65536/goapptemplate/blob/main/.github/workflows/golangci-lint.yml)のを設定するとciの方でチェックしてくれるようになる

手元で簡単に走らせる場合は
```
golangci-lint run -v
```

最近こういうのもあるらしいけどあまり知らない

https://staticcheck.io/


## goreleaser

githubで公開するときにバージョン作成してbinaryを上げて、changelog書いてとか色々面倒なことを自動でやってくれる


github workflowsに[こういう](https://github.com/hacker65536/goapptemplate/blob/main/.github/workflows/goreleaser.yml)のを用意する  
[こういう](https://github.com/hacker65536/goapptemplate/blob/main/.goreleaser.yml)のも用意する

tagを打つと
https://github.com/hacker65536/findlb/releases
こんな感じのやつが自動でやってくれるようになる


## log

標準のものよりも人気のものを使おう

https://github.com/sirupsen/logrus


```go
package main

import (
  log "github.com/sirupsen/logrus"
)

func main() {
  log.WithFields(log.Fields{
    "animal": "walrus",
  }).Info("A walrus appears")
}

```



## 正規表現

https://pkg.go.dev/regexp

https://gobyexample.com/regular-expressions


よく利用するサイト

https://regex101.com/

## 時間

https://pkg.go.dev/time

golangの時間計算はとてもいい感じ

layoutと数字は決まっているので最初はよく分からなかった。。。
(Y-m-d の代わりに 2006-01-02)

## json

メッチャ使う


```go
j, _ := json.Marshal(v)
fmt.Println(string(j))
```




## awesome go

https://awesome-go.com/

https://github.com/avelino/awesome-go
