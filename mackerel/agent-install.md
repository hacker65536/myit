
Host -> エージェントインストール

Amazon Linux -> Amazon Linux 2 LTS

```console
$ curl -fsSL https://mackerel.io/file/script/amznlinux/setup-all-yum-v2.sh | \
MACKEREL_APIKEY='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' sh
```

or

```console
$ curl -fsSL https://mackerel.io/file/script/amznlinux/setup-yum-v2.sh | sh
$ sudo yum install -y mackerel-agent
$ sudo mackerel-agent init -apikey="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
$ sudo systemctl start mackerel-agent
```




```console
$ sudo journalctl -u mackerel-agent.service
Aug 07 05:43:52 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: Starting mackerel.io agent...
Aug 07 05:43:52 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: Started mackerel.io agent.
Aug 07 05:43:52 ip-10-0-2-95.us-west-2.compute.internal mackerel-agent[4617]: 2018/08/07 05:43:52 INFO <main> Starting mackerel-agent version:0.56.0,
Aug 07 05:43:52 ip-10-0-2-95.us-west-2.compute.internal mackerel-agent[4617]: 2018/08/07 05:43:52 INFO <command> Start: apibase = https://api.mackerel
Aug 07 05:51:35 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: Stopping mackerel.io agent...
Aug 07 05:51:35 ip-10-0-2-95.us-west-2.compute.internal mackerel-agent[4617]: 2018/08/07 05:51:35 INFO <main> Received signal 'terminated', try gracef
Aug 07 05:51:35 ip-10-0-2-95.us-west-2.compute.internal mackerel-agent[4617]: 2018/08/07 05:51:35 INFO <main> Received signal 'terminated' again, forc
Aug 07 05:51:36 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: Starting mackerel.io agent...
Aug 07 05:51:36 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: Started mackerel.io agent.
Aug 07 05:51:36 ip-10-0-2-95.us-west-2.compute.internal mackerel-agent[4969]: failed to load the config file: Near line 67 (last key parsed 'plugin.me
Aug 07 05:51:36 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: mackerel-agent.service: main process exited, code=exited, status=1/FAILURE
Aug 07 05:51:36 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: Unit mackerel-agent.service entered failed state.
Aug 07 05:51:36 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: mackerel-agent.service failed.
Aug 07 05:53:31 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: Starting mackerel.io agent...
Aug 07 05:53:31 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: Started mackerel.io agent.
Aug 07 05:53:31 ip-10-0-2-95.us-west-2.compute.internal mackerel-agent[5090]: failed to load the config file: Near line 67 (last key parsed 'plugin.me
Aug 07 05:53:31 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: mackerel-agent.service: main process exited, code=exited, status=1/FAILURE
Aug 07 05:53:31 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: Unit mackerel-agent.service entered failed state.
Aug 07 05:53:31 ip-10-0-2-95.us-west-2.compute.internal systemd[1]: mackerel-agent.service failed.
```
