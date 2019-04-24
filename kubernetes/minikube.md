# minikube

https://kubernetes.io/docs/tasks/tools/install-minikube/#install-minikube

https://github.com/kubernetes/minikube#other-ways-to-install


## cant install to ec2

```console
$ wget https://download.virtualbox.org/virtualbox/6.0.4/VirtualBox-6.0-6.0.4_128413_el7-1.x86_64.rpm
$ yum install VirtualBox-6.0-6.0.4_128413_el7-1.x86_64.rpm
```

```console
$ curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && \
sudo install minikube-linux-amd64 /usr/local/bin/minikube
``` 
```console
$ minikube start
😄  minikube v0.34.1 on linux (amd64)
🔥  Creating virtualbox VM (CPUs=2, Memory=2048MB, Disk=20000MB) ...
💿  Downloading Minikube ISO ...
 184.30 MB / 184.30 MB [============================================] 100.00% 0s
💣  Unable to start VM: create: precreate: We support Virtualbox starting with version 5. Your VirtualBox install is "WARNING: The vboxdrv kernel module is not loaded. Either there is no module\n         available for the current kernel (4.14.88-88.76.amzn2.x86_64) or it failed to\n         load. Please recompile the kernel module and install it by\n\n           sudo /sbin/vboxconfig\n\n         You will not be able to start VMs until this problem is fixed.\n6.0.4r128413". Please upgrade at https://www.virtualbox.org

😿  Sorry that minikube crashed. If this was unexpected, we would love to hear from you:
👉  https://github.com/kubernetes/minikube/issues/new
```


```console
$ sudo /sbin/vboxconfig
vboxdrv.sh: Stopping VirtualBox services.
vboxdrv.sh: Starting VirtualBox services.
vboxdrv.sh: failed: Running VirtualBox in a Xen environment is not supported.
This system is currently not set up to build kernel modules.
Please install the gcc make perl packages from your distribution.
Please install the Linux kernel "header" files matching the current kernel
for adding new hardware support to the system.

There were problems setting up VirtualBox.  To re-start the set-up process, run
  /sbin/vboxconfig
as root.
```

https://stackoverflow.com/questions/7601853/can-virtualbox-be-executed-under-amazon-ec2-instance



brew (install on mac)
--


https://gist.github.com/kevin-smets/b91a34cea662d0c523968472a81788f7

```console
$ brew install kubernetes-cli
$ brew cask install minikube docker virtualbox
```
if virtualbox installation is failure
1. open up system preferences
2. click on the security & Privacy 
3. allow apps download from App store and identified developers


```console
$  brew cask list docker
==> Apps
/Applications/Docker.app (286 files, 1.7GB)
```

run docker from application icon


### version
```console
⋊> ~ docker --version                                                                                          01:22:55
Docker version 18.09.2, build 6247962
⋊> ~ docker-compose --version                                                                                  01:23:05
docker-compose version 1.23.2, build 1110ad01
⋊> ~ docker-machine --version                                                                                  01:23:09
docker-machine version 0.16.1, build cce350d7
⋊> ~ minikube version                                                                                          01:23:14
minikube version: v1.0.0
⋊> ~ kubectl version --client                                                                                  01:23:18
Client Version: version.Info{Major:"1", Minor:"14", GitVersion:"v1.14.1", GitCommit:"b7394102d6ef778017f2ca4046abbaa23b88c290", GitTreeState:"clean", BuildDate:"2019-04-19T22:13:37Z", GoVersion:"go1.12.4", Compiler:"gc", Platform:"darwin/amd64"}
```


```console
⋊> ~ minikube start                                                                                            01:23:21
😄  minikube v1.0.0 on darwin (amd64)
🤹  Downloading Kubernetes v1.14.0 images in the background ...
🔥  Creating virtualbox VM (CPUs=2, Memory=2048MB, Disk=20000MB) ...
📶  "minikube" IP address is 192.168.99.100
🐳  Configuring Docker as the container runtime ...
🐳  Version of container runtime is 18.06.2-ce
⌛  Waiting for image downloads to complete ...
✨  Preparing Kubernetes environment ...
💾  Downloading kubeadm v1.14.0
💾  Downloading kubelet v1.14.0
🚜  Pulling images required by Kubernetes v1.14.0 ...
🚀  Launching Kubernetes v1.14.0 using kubeadm ...
⌛  Waiting for pods: apiserver proxy etcd scheduler controller dns
🔑  Configuring cluster permissions ...
🤔  Verifying component health .....
💗  kubectl is now configured to use "minikube"
🏄  Done! Thank you for using minikube!
```
```console
⋊> ~ kubectl get nodes                                                                                         01:27:44
NAME       STATUS   ROLES    AGE     VERSION
minikube   Ready    master   2m41s   v1.14.0
```

```console
$ minikube docker-env
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/<USER>/.minikube/certs"
export DOCKER_API_VERSION="1.35"
# Run this command to configure your shell:
# eval $(minikube docker-env)
```

```console
$ eval $(minikube docker-env)
```

```console
$ docker ps -a --format="table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Command}}\t{{.Status}}"
CONTAINER ID        NAMES                                                                                                         IMAGE                  COMMAND                  STATUS
66354fec1c96        k8s_storage-provisioner_storage-provisioner_kube-system_b8a046ed-66ad-11e9-8776-080027019f26_0                4689081edb10           "/storage-provisioner"   Up 32 minutes
d9985e361619        k8s_POD_storage-provisioner_kube-system_b8a046ed-66ad-11e9-8776-080027019f26_0                                k8s.gcr.io/pause:3.1   "/pause"                 Up 32 minutes
232ac49bf5ba        k8s_coredns_coredns-fb8b8dccf-dsz9s_kube-system_b7230dc2-66ad-11e9-8776-080027019f26_0                        eb516548c180           "/coredns -conf /etc…"   Up 32 minutes
97b683d1fc4d        k8s_coredns_coredns-fb8b8dccf-z4sh8_kube-system_b7240c37-66ad-11e9-8776-080027019f26_0                        eb516548c180           "/coredns -conf /etc…"   Up 32 minutes
6a9e311f7dca        k8s_POD_coredns-fb8b8dccf-dsz9s_kube-system_b7230dc2-66ad-11e9-8776-080027019f26_0                            k8s.gcr.io/pause:3.1   "/pause"                 Up 32 minutes
ae242da1659b        k8s_POD_coredns-fb8b8dccf-z4sh8_kube-system_b7240c37-66ad-11e9-8776-080027019f26_0                            k8s.gcr.io/pause:3.1   "/pause"                 Up 32 minutes
2899da057f4f        k8s_kube-proxy_kube-proxy-4pflf_kube-system_b76dac9d-66ad-11e9-8776-080027019f26_0                            5cd54e388aba           "/usr/local/bin/kube…"   Up 32 minutes
50fc30088041        k8s_POD_kube-proxy-4pflf_kube-system_b76dac9d-66ad-11e9-8776-080027019f26_0                                   k8s.gcr.io/pause:3.1   "/pause"                 Up 32 minutes
e1d6f465c9aa        k8s_kube-controller-manager_kube-controller-manager-minikube_kube-system_2899d819dcdb72186fb15d30a0cc5a71_0   b95b1efa0436           "kube-controller-man…"   Up 32 minutes
e6f8128c8446        k8s_etcd_etcd-minikube_kube-system_18c827a17f0a6b507c2029890cd786ad_0                                         2c4adeb21b4f           "etcd --advertise-cl…"   Up 32 minutes
17456e828cf7        k8s_kube-scheduler_kube-scheduler-minikube_kube-system_58272442e226c838b193bbba4c44091e_0                     00638a24688b           "kube-scheduler --bi…"   Up 32 minutes
4328a67d27fa        k8s_kube-apiserver_kube-apiserver-minikube_kube-system_023cdc77988402bd2101e9dc50c78f18_0                     ecf910f40d6e           "kube-apiserver --ad…"   Up 32 minutes
13e8fbe8711c        k8s_kube-addon-manager_kube-addon-manager-minikube_kube-system_0abcb7a1f0c9c0ebc9ec348ffdfb220c_0             119701e77cbc           "/opt/kube-addons.sh"    Up 32 minutes
b6d4725c06ae        k8s_POD_kube-scheduler-minikube_kube-system_58272442e226c838b193bbba4c44091e_0                                k8s.gcr.io/pause:3.1   "/pause"                 Up 32 minutes
62e0e1614faa        k8s_POD_kube-controller-manager-minikube_kube-system_2899d819dcdb72186fb15d30a0cc5a71_0                       k8s.gcr.io/pause:3.1   "/pause"                 Up 32 minutes
51b0c609a365        k8s_POD_kube-apiserver-minikube_kube-system_023cdc77988402bd2101e9dc50c78f18_0                                k8s.gcr.io/pause:3.1   "/pause"                 Up 32 minutes
1e1e09c5e3a2        k8s_POD_etcd-minikube_kube-system_18c827a17f0a6b507c2029890cd786ad_0                                          k8s.gcr.io/pause:3.1   "/pause"                 Up 32 minutes
c6d9ce7e6cc5        k8s_POD_kube-addon-manager-minikube_kube-system_0abcb7a1f0c9c0ebc9ec348ffdfb220c_0                            k8s.gcr.io/pause:3.1   "/pause"                 Up 32 minutes
```

```console
$ docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

```console
$ mkdir dockerapp
$ cd !$
$ cat <<'EOF' > Dockerfile
# Just for demo purposes obviously
FROM httpd:2.4-alpine

COPY ./index.html /usr/local/apache2/htdocs/
EOF
$ cat <<'EOF' > index.html
Hello world!
EOF
$ cat <<'EOF' > my-app.yml
# APP DEPLOYMENT

apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  labels:
    run: my-app
  name: my-app
spec:
  replicas: 1
  selector:
    matchLabels:
      run: my-app-exposed
  template:
    metadata:
      labels:
        run: my-app-exposed
    spec:
      containers:
      - image: localhost:5000/my-app:0.1.0
        name: my-app
        ports:
        - containerPort: 80
          protocol: TCP

---

# APP SERVICE

apiVersion: v1
kind: Service
metadata:
  labels:
    run: my-app
  name: my-app
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    run: my-app-exposed
  type: NodePort
EOF
```
```console
$ docker build . --tag my-app
$ docker tag my-app localhost:5000/my-app:0.1.0
```

```console
$ kubectl create -f my-app.yml
```
```console
$ kubectl get all                                                                                                                                   5.3m  木  4/25 02:23:04 2019
NAME                          READY   STATUS    RESTARTS   AGE
pod/my-app-5778f8459d-gs8bq   1/1     Running   0          6m29s

NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/kubernetes   ClusterIP   10.96.0.1       <none>        443/TCP        56m
service/my-app       NodePort    10.104.28.242   <none>        80:32304/TCP   6m29s

NAME                     READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/my-app   1/1     1            1           6m29s

NAME                                DESIRED   CURRENT   READY   AGE
replicaset.apps/my-app-5778f8459d   1         1         1       6m29s
```

```console
$ minikube service my-app --url
http://192.168.99.100:32304
```
open browser with command + click

```console
$ minikube dashboard
```
