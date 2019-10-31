```console
$ ssh-agent
SSH_AUTH_SOCK=/tmp/ssh-3DjDsP0yjkkg/agent.21336; export SSH_AUTH_SOCK;
SSH_AGENT_PID=21337; export SSH_AGENT_PID;
echo Agent pid 21337;
```

If you didn't set env when start, so you can't kill ssh-agent.
```console
$ ssh-agent -k
SSH_AGENT_PID not set, cannot kill agent
```

```console
$ SSH_AGENT_PID=21337; export SSH_AGENT_PID;
$ ssh-agent -k
unset SSH_AUTH_SOCK;
unset SSH_AGENT_PID;
echo Agent pid 21337 killed;
```

The following will avoid above the problem.
```console
$ ssh-agent bash 
```



```console
$ eval $(ssh-agent)
Agent pid 21399
```
```console
$ ps axu|grep ssh-agen[t]
ec2-user 21399  0.0  0.0  70244   780 ?        Ss   03:15   0:00 ssh-agent
```

