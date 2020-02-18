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

グローバル設定のファイルを削除 or コメントアウト
```console
$ sudo rm /Library/Developer/CommandLineTools/usr/share/git-core/gitconfig
```


