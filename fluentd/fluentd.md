
```console
$ cat /etc/system-release
Amazon Linux release 2 (Karoo)
```

```console
$ sudo amazon-linux-extras install ruby2.6
```
```console
$ ruby -v
ruby 2.6.6p146 (2020-03-31 revision 67876) [x86_64-linux]
```

```console
$ sudo yum install ruby-devel gcc
```


https://docs.fluentd.org/installation/install-by-rpm

```console
$ curl -L https://toolbelt.treasuredata.com/sh/install-amazon2-td-agent4.sh | sh
```

```console
$ sudo yum list installed td-agent
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
Installed Packages
td-agent.x86_64                4.1.0-1.amzn2                        @treasuredata
```

```console
$ sudo systemctl start td-agent
```
```console
$ sudo systemctl status td-agent
● td-agent.service - td-agent: Fluentd based data collector for Treasure Data
   Loaded: loaded (/usr/lib/systemd/system/td-agent.service; enabled; vendor preset: disabled)
   Active: active (running) since Sun 2021-04-11 17:32:09 UTC; 50min ago
     Docs: https://docs.treasuredata.com/articles/td-agent
  Process: 2923 ExecStart=/opt/td-agent/bin/fluentd --log $TD_AGENT_LOG_FILE --daemon /var/run/td-agent/td-agent.pid $TD_AGENT_OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 2929 (fluentd)
   CGroup: /system.slice/td-agent.service
           ├─2929 /opt/td-agent/bin/ruby /opt/td-agent/bin/fluentd --log /var/log/td-agent/td-agent.log --daemon /...
           └─2932 /opt/td-agent/bin/ruby -Eascii-8bit:ascii-8bit /opt/td-agent/bin/fluentd --log /var/log/td-agent...

Apr 11 17:32:08 ip-10-0-40-182.us-east-2.compute.internal systemd[1]: Starting td-agent: Fluentd based data coll.....
Apr 11 17:32:09 ip-10-0-40-182.us-east-2.compute.internal systemd[1]: Started td-agent: Fluentd based data colle...a.
Hint: Some lines were ellipsized, use -l to show in full.
```

```console
$ pstree -p -a td-agent
fluentd,2929 /opt/td-agent/bin/fluentd --log /var/log/td-agent/td-agent.log --daemon /var/run/td-agent/td-agent.pid
  ├─ruby,2932 -Eascii-8bit:ascii-8bit /opt/td-agent/bin/fluentd --log /var/log/td-agent/td-agent.log --daemon/var/run/td-agent/td-agent.pi
  │   ├─{ruby},2933
  │   ├─{ruby},2934
  │   ├─{ruby},2935
  │   ├─{ruby},2936
  │   └─{ruby},2938
  ├─{fluentd},2930
  └─{fluentd},2931
```

```console
$ sudo netstat -plunt |grep ruby
tcp        0      0 127.0.0.1:24230         0.0.0.0:*               LISTEN      2932/ruby
tcp        0      0 0.0.0.0:8888            0.0.0.0:*               LISTEN      2929/ruby
tcp        0      0 0.0.0.0:24224           0.0.0.0:*               LISTEN      2932/ruby
udp        0      0 0.0.0.0:24224           0.0.0.0:*                           2932/ruby
```


```console
$ curl -X POST -d 'json={"json":"message"}' http://localhost:8888/debug.test
```

```console
$ tail -n 1 /var/log/td-agent/td-agent.log
2021-04-11 18:31:22.164842963 +0000 debug.test: {"json":"message"}
```


```console
$ mkdir rubyapp
$ cd rubyapp
```

```console
$ cat <<'EOF'> Gemfile
source 'https://rubygems.org'
gem 'fluent-logger', "~> 0.7.1"
EOF
```

```console
$ gem install bundle
```
```console
$ bundle install --path vendor/bundle
```

`app.rb`
```ruby
require 'fluent-logger'
Fluent::Logger::FluentLogger.open(nil, :host=>'localhost', :port=>24224)
Fluent::Logger.post("fluentd.test.follow", {"from"=>"userA", "to"=>"userB"})
```


add below to /etc/td-agent/td-agent.conf
```
<match fluentd.test.**>
  @type stdout
</match>
```


```console
$ sudo systemctl restart td-agent
```

```console
$ bundle ex ruby app.rb
```

```console
$ tail -f /var/log/td-agent/td-agent.log
2021-04-11 19:04:28.000000000 +0000 fluentd.test.follow: {"from":"userA","to":"userB"}
```
