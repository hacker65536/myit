
```
$ docker run --rm --name gitlab gitlab/gitlab-ce
```

```
Multiple failures occurred:
* Errno::ENOMEM occurred in chef run: execute[/opt/gitlab/bin/gitlab-ctl start logrotate] (gitlab::logrotate line 28) had an error: Errno::ENOMEM: Cannot allocate memory - fork(2)
* Errno::ENOMEM occurred in delayed notification: execute[clear the gitlab-rails cache] (gitlab::gitlab-rails line 395) had an error: Errno::ENOMEM: Cannot allocate memory - fork(2)
* Errno::ENOMEM occurred in delayed notification: service[gitlab-workhorse] (gitlab::gitlab-workhorse line 227) had an error: Errno::ENOMEM: Cannot allocate memory - fork(2)


    - execute the ruby block reload logrotate svlogd configuration

Running handlers:
Running handlers complete
Chef Client failed. 268 resources updated in 05 minutes 54 seconds
```
```
$ ec2-metadata |grep instance-type
instance-type: t2.micro
```
