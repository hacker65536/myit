# root ssh login

cloud-init
--

```console
# diff <(sed -e 's/disable_root.*/disable_root: 0/' /etc/cloud/cloud.cfg) <(cat /etc/cloud/cloud.cfg)
4c4
< disable_root: 0
---
> disable_root: 1

```
```console
# sudo sed -e 's/disable_root.*/disable_root: 0/' -i /etc/cloud/cloud.cfg
```
デフォルトではrootの直下の`~/.ssh/authorized_keys`ではkey_pairの公開鍵は設定されているがsleepが実行されて終了する。
```
no-port-forwarding,no-agent-forwarding,no-X11-forwarding,command="echo 'Please login as the user \"centos\" rather than the user \"root\".';echo;sleep 10" ssh-rsa ....
```
cloud-initでrootのauthorized_keysのコマンド部を含めない設定にする`disable_root: 0`


sshd_config
--

```console
# diff <(sed -e 's/.*PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config) <(cat /etc/ssh/sshd_config)
49c49
< PermitRootLogin yes
---
> #PermitRootLogin yes
```
```console
# sudo sed -e 's/.*PermitRootLogin yes/PermitRootLogin yes/' -i /etc/ssh/sshd_config
```

rootのsshログインをsshd_configで許可する(コメントアウトを外す)
