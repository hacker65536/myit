
```
[ec2-user@ip-172-31-33-9 ~]$ cat /etc/system-release
Amazon Linux release 2.0 (2017.12) LTS Release Candidate
```

```
sudo yum install ruby
```
```
ruby --version
ruby 2.0.0p648 (2015-12-16) [x86_64-linux]
```


Amazon Linux 2
```
curl -L https://toolbelt.treasuredata.com/sh/install-amazon2-td-agent3.sh | sh
```

```
sudo yum list installed td-agent
Loaded plugins: langpacks, update-motd
Installed Packages
td-agent.x86_64                3.1.1-0.el2                @treasuredata
```

```
sudo systemctl start td-agent
^start^status
sudo systemctl status td-agent

● td-agent.service - td-agent: Fluentd based data collector for Treasure Data
   Loaded: loaded (/usr/lib/systemd/system/td-agent.service; disabled; vendor preset: disabled)
   Active: active (running) since Wed 2017-12-27 03:29:49 UTC; 4s ago
     Docs: https://docs.treasuredata.com/articles/td-agent
  Process: 3527 ExecStart=/opt/td-agent/embedded/bin/fluentd --log /var/log/td-agent/td-agent.log --daemon /var/run/td-agent/td-agent.pid (code=exited, status=0/SUCCESS)
 Main PID: 3532 (fluentd)
   CGroup: /system.slice/td-agent.service
           ├─3532 /opt/td-agent/embedded/bin/ruby /opt/td-agent/embe...
           └─3537 /opt/td-agent/embedded/bin/ruby -Eascii-8bit:ascii...

Dec 27 03:29:49 ip-172-31-33-9.us-east-2.compute.internal systemd[1]: ...
Dec 27 03:29:49 ip-172-31-33-9.us-east-2.compute.internal systemd[1]: ...
Hint: Some lines were ellipsized, use -l to show in full.
```
