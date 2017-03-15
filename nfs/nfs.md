/etc/exports


/home/nfs 192.168.175.0/255.255.255.0(rw)


```
/etc/rc.d/init.d/portmap start
chkconfig portmap on
```
```
/etc/rc.d/init.d/nfs start
chkconfig nfs on
```
サーバが起動した後は設定変更後は以下のコマンド
```
exportfs -ra
```


```
portmap: 127.0.0.1 192.168.175.0/255.255.255.0  
mountd: 127.0.0.1 192.168.175.0/255.255.255.0  
```


(cidrは使えないみたい)

centos6.xでは
```
rpcbind :
mountd:
```


クライアント


/etc/hosts.allow
```
ALL: 127.0.0.1
```

これがないと以下のエラーが出る

NFS クォータを起動中: サービスを登録できません: RPC: 認証エラー; why = クライアントの信任が弱すぎます

```
rpc.rquotad: unable to register (RQUOTAPROG, RQUOTAVERS, udp). 　　 [失敗]

NFS デーモンを起動中: [失敗]
```


上は必要なし
centos6のclientは rpcbindもnfsも,nfslockもrpcidmapdも立ち上げなくてもmountできる



server5　client6ではversionが違うので接続できない

mount -t nfs -o nfsvers=3　入れてもダメだった





macから接続する場合
refused mount request from 114.179.112.240 for /mnt/nfs (/mnt/nfs): illegal port 49136
↑のエラーがでたら
insecureを入れると回避される

uidとgidのマッピングは anonuidとanongidを使用する



```
yum install rpcbind nfs-utils
```
```
vim /etc/exports
/mount/pint xxx.xxx.xxx.xxx/255.255.255.255 (rw,anonuid=xxx,anongid=xxx,insecure)
```


uidとgidはサーバ側に準じる
つまりサーバ側のユーザ領域なのでnfsnobdy以外のユーザであれば書き換えないと書込権限が制限される

insecureはrpcbindでのポート許可設定

```
chkconfig nfslock on
chkconfig nfs on
chkconfig rpcbind on
```
```
service rpcbind start
service nfslock start
service nfs start
```


```
mount 192.168.1.1:/home/transmission/Downloads /home/mykola/nfs
mount.nfs: rpc.statd is not running but is required for remote locking.
mount.nfs: Either use '-o nolock' to keep locks local, or start statd.
mount.nfs: an incorrect mount option was specified
```

↑これが出るケースはクライアント側に問題がある
クライアント側で service nfslock start をするとでなくなる
勿論上述のようにオプションつけれてもOK
