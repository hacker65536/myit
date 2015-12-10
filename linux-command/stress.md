
#stress
 tool to impose load on and stress test systems
##install

```bash
 yum install stress
```


##example

```bash
stress --cpu 2 --timeout 10s --verbose
```

```
stress: info: [27048] dispatching hogs: 2 cpu, 0 io, 0 vm, 0 hdd
stress: dbug: [27048] using backoff sleep of 6000us
stress: dbug: [27048] setting timeout to 10s
stress: dbug: [27048] --> hogcpu worker 2 [27049] forked
stress: dbug: [27048] using backoff sleep of 3000us
stress: dbug: [27048] setting timeout to 10s
stress: dbug: [27048] --> hogcpu worker 1 [27050] forked
stress: dbug: [27048] <-- worker 27049 signalled normally
stress: dbug: [27048] <-- worker 27050 signalled normally
stress: info: [27048] successful run completed in 10s
```
