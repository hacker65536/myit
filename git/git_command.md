#git command




##settings
###user

default will use `--local` when omit `--local` or `--global`

####local 
only current repository
```bash
git config --local user.name  MyName
git config --local user.email My@address
```
repo/.git/config

####global
all repository of current user will be adapted this settings 
```bash
git config --global user.name  MyName
git config --global user.email My@address
```
~/.gitconfig 

`repo/.git/config` or `~/.gitconfig`
```
[user]
        name = mytest
        email = my@address
```

###push.default

```bash
git config --global push.default simple
```
http://git-scm.com/docs/git-config

* nothing 明示的にRefSpec(参照仕様)の記述がなければ何もしない(ミスを回避するための厳格な設定)
* current リモートの同名のブランチに対してpushする
* upstream カレントブランチに追跡ブランチを設定している場合追跡ブランチに対してpush。使用するケースはFork元を上流ブランチとし、remoteにupstreamを追加し(originと区別する場合)、Fork元からpullしての運用など
* simple git2.0以降のデフォルト upstreamの設定がしていてかつ同名の場合はpush
* matching 旧仕様で、ローカル、リモートで同名のrepositoryであればすべてpush


###using github
setup  pubkey to github.
usericon > settings > ssh key


```bash
git clone git@github.com:username/reponame.git
```

