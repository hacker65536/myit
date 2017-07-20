
for windows


https://www.vagrantup.com/downloads.html


```
vagrant init centos/7
vagrant up 
```



hyper-vの設定と何かしら問題があり、hyper-vを切ると動く(virtualbox5.x)


```
C:\WINDOWS\system32>vagrant --version
Vagrant 1.9.7
```

```
C:\WINDOWS\system32>systeminfo | findstr /B /C:"OS 名" /C:"OS バージョン"
OS 名:                  Microsoft Windows 10 Pro
OS バージョン:          10.0.14393 N/A ビルド 14393
```
