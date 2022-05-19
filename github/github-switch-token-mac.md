mac で github の token を switchするときにうまく行かない
--

configで設定しているユーザと違うユーザでアクセ使用として、permission deniedになるパターン


```console 
$ git push
remote: Permission to hacker65536/aws-cdk.git denied to XXXXATHERUSER.
fatal: unable to access 'https://github.com/hacker65536/aws-cdk.git/': The requested URL returned error: 403
```


```console
$ git config -l
credential.helper=osxkeychain
----
```


どこで設定されているか確認
```console
$ git config --show-origin --get credential.helper
file:/Library/Developer/CommandLineTools/usr/share/git-core/gitconfig	osxkeychain
```

2022/05/19
```console
$ git config --show-origin -l |grep credential.helper
file:/Applications/Xcode.app/Contents/Developer/usr/share/git-core/gitconfig	credential.helper=osxkeychain
```

```console
$ cat /Library/Developer/CommandLineTools/usr/share/git-core/gitconfig
[credential]
	helper = osxkeychain
$ cat /Applications/Xcode.app/Contents/Developer/usr/share/git-core/gitconfig
[credential]
	helper = osxkeychain
```

グローバル設定のファイルを削除 or コメントアウト
```console
$ sudo rm /Library/Developer/CommandLineTools/usr/share/git-core/gitconfig
$ sudo rm /Applications/Xcode.app/Contents/Developer/usr/share/git-core/gitconfig
```

helperをstoreに変える
```console
$ git config --local credential.helper "store --file ~/.myname-credentials"
```
ref
--

http://ropupu-ropupu.hatenablog.com/entry/2018/02/06/204431  
https://git-scm.com/book/ja/v2/Git-%E3%81%AE%E3%81%95%E3%81%BE%E3%81%96%E3%81%BE%E3%81%AA%E3%83%84%E3%83%BC%E3%83%AB-%E8%AA%8D%E8%A8%BC%E6%83%85%E5%A0%B1%E3%81%AE%E4%BF%9D%E5%AD%98
