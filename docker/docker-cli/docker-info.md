```console
$ docker info --help

Usage:	docker info [OPTIONS]

Display system-wide information

Options:
  -f, --format string   Format the output using the given Go template
```

```console
$ docker info
Client:
 Debug Mode: false
 Plugins:
  buildx: Build with BuildKit (Docker Inc.)

Server:
 Containers: 1
  Running: 0
  Paused: 0
  Stopped: 1
 Images: 25
 Server Version: 19.03.13-ce
 Storage Driver: overlay2
  Backing Filesystem: xfs
  Supports d_type: true
  Native Overlay Diff: true
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
 Swarm: inactive
 Runtimes: runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: c623d1b36f09f8ef6536a057bd658b3aa8632828
 runc version: ff819c7e9184c13b7c2607fe6c30ae19403a7aff
 init version: de40ad0 (expected: fec3683)
 Security Options:
  seccomp
   Profile: default
 Kernel Version: 5.4.80-40.140.amzn2.x86_64
 Operating System: Amazon Linux 2
 OSType: linux
 Architecture: x86_64
 CPUs: 8
 Total Memory: 15.08GiB
 Name: ip-172-31-7-9.us-east-2.compute.internal
 ID: 2VKD:GGB5:UDLF:2PBN:6RI7:GMI6:CLGF:ZSAV:53FE:JDKJ:JBVU:EK4P
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Registry: https://index.docker.io/v1/
 Labels:
 Experimental: false
 Insecure Registries:
  127.0.0.0/8
 Live Restore Enabled: false
```


```console
$ docker info -f '{{.ServerVersion}}'
19.03.13-ce
```
