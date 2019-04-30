
3 nodes kubernetes


individual
```console
# apt-get update && apt-get install -y apt-transport-https
# curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
OK
```

```console
# cat << EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
# apt-get update
```
```console
# apt-get install -y kubelet kubeadm kubectl docker.io
```

```console
# sysctl net.bridge.bridge-nf-call-iptables=1
net.bridge.bridge-nf-call-iptables = 1
```
