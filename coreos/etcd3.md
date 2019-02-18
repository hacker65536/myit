


etc3の問題
--
http://www.fraction.jp/log/archives/2017/03/30/etcd3-on-coreos

https://github.com/coreos/bugs/issues/2395


coreosにcloud-initでetcd2の設定をいれてもログインするとコケている


```
$ sudo su -
Failed Units: 1
  oem-cloudinit.service
```


```
# journalctl -u oem-cloudinit.service
```
```
Feb 18 07:26:56 ip-10-0-1-17.ec2.internal coreos-cloudinit[797]: 2019/02/18 07:26:56 Masking unit file "locksmithd.service"
Feb 18 07:26:56 ip-10-0-1-17.ec2.internal coreos-cloudinit[797]: 2019/02/18 07:26:56 Calling unit command "start" on "etcd2.service"
Feb 18 07:26:56 ip-10-0-1-17.ec2.internal coreos-cloudinit[797]: 2019/02/18 07:26:56 Failed to apply cloud-config: Unit etcd2.service not found.
Feb 18 07:26:56 ip-10-0-1-17.ec2.internal systemd[1]: oem-cloudinit.service: Main process exited, code=exited, status=1/FAILURE
Feb 18 07:26:56 ip-10-0-1-17.ec2.internal systemd[1]: oem-cloudinit.service: Failed with result 'exit-code'.
Feb 18 07:26:56 ip-10-0-1-17.ec2.internal systemd[1]: Failed to start Cloudinit from platform metadata.
```
