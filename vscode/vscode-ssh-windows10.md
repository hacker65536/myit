
ssh key for github
--

鍵が正しく設定しているにもかかわらず pullなどで失敗する場合
```
Cloning into 'repo'...
Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```


1. `設定->アプリと機能->オプション機能の管理`でopenssh クライアントがインストール済みかどうか確認
2. 検索から`サービス`を起動、`OpenSSH Authentication Agent`の項目でプロパティからスタートアップの種類を`無効`から`自動`に設定
3. ssh-agentを`開始`
4. ssh-add に指定の鍵をインポートする
5. gitconfigにsshのコマンドを指定する

sshコマンドを設定する
```console
PS C:\Users\MyName\Documents\Github> git config --global core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe"
```
