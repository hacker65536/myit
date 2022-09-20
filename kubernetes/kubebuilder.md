# kubebuilder tutorial

https://zoetrope.github.io/kubebuilder-training/introduction/installation.html



## prerequisite

amazonlinux:2

### install golang
```
sudo rpm --import https://mirror.go-repo.io/centos/RPM-GPG-KEY-GO-REPO
curl -s https://mirror.go-repo.io/centos/go-repo.repo | sudo tee /etc/yum.repos.d/go-repo.repo
sudo sed -e 's/\$releasever/7/' -i /etc/yum.repos.d/go-repo.repo  #amzlinu2
sudo yum install -y  gcc # before install golang 1.11 from outside of amzn2-core
sudo yum install -y golang --disablerepo=amzn2-core,amzn2extra-golang1.9 --enablerepo=go-repo
```

```console
# go version
go version go1.19.1 linux/amd64
```


```
echo 'export PATH="$PATH:$(go env GOPATH)/bin"' >>~/.bashrc
```
### install docker 
```
sudo amazon-linux-extras install -y docker
sudo usermod -a -G docker ec2-user
sudo systemctl start docker
```

```
bash -l
```

```
sudo docker version
```

### install kubectl / kind

```
curl -SsL -O "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

```
curl -SsL -o ./kind https://kind.sigs.k8s.io/dl/v0.15.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```
```
echo 'alias k=kubectl' >>~/.bashrc
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc

```

### install kubebuilder

```
# download kubebuilder and install locally.
sudo curl -SsL -o kubebuilder https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)
sudo chmod +x kubebuilder && sudo mv kubebuilder /usr/local/bin/
```

### install misc

#### tree
```
yum install -y git tree
```

#### stern
```
go install github.com/stern/stern@latest
```
```
echo 'source <(stern --completion=bash)' >> ~/.bashrc
. ~/.bashrc
```

#### krew
```
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)


echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> ~/.bashrc
. ~/.bashrc
```


```
kubectl krew update
```

```
k krew install ctx
k krew install ns
```

### configure git

```
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.sw switch
git config --global alias.last "log -1 HEAD"
```

## create project



```
mkdir markdown-view
cd markdown-view
kubebuilder init --domain zoetrope.github.io --repo github.com/zoetrope/markdown-view
```

```console
$ tree -C .
.
├── config
│   ├── default
│   │   ├── kustomization.yaml
│   │   ├── manager_auth_proxy_patch.yaml
│   │   └── manager_config_patch.yaml
│   ├── manager
│   │   ├── controller_manager_config.yaml
│   │   ├── kustomization.yaml
│   │   └── manager.yaml
│   ├── prometheus
│   │   ├── kustomization.yaml
│   │   └── monitor.yaml
│   └── rbac
│       ├── auth_proxy_client_clusterrole.yaml
│       ├── auth_proxy_role_binding.yaml
│       ├── auth_proxy_role.yaml
│       ├── auth_proxy_service.yaml
│       ├── kustomization.yaml
│       ├── leader_election_role_binding.yaml
│       ├── leader_election_role.yaml
│       ├── role_binding.yaml
│       └── service_account.yaml
├── Dockerfile
├── go.mod
├── go.sum
├── hack
│   └── boilerplate.go.txt
├── main.go
├── Makefile
├── PROJECT
└── README.md

6 directories, 25 files
```

```
git init
git config --local user.name yourname
git config --local user.email yourmail
git commit --allow-empty -m "first commit"
git add .
git commit -m "init project"
```
## create api

```console
$ kubebuilder create api --group view --version v1 --kind MarkdownView
Create Resource [y/n]
y
Create Controller [y/n]
y
```



```console
$ git status -u -s
 M PROJECT
 M go.mod
 M go.sum
 M main.go
?? api/v1/groupversion_info.go
?? api/v1/markdownview_types.go
?? api/v1/zz_generated.deepcopy.go
?? config/crd/kustomization.yaml
?? config/crd/kustomizeconfig.yaml
?? config/crd/patches/cainjection_in_markdownviews.yaml
?? config/crd/patches/webhook_in_markdownviews.yaml
?? config/rbac/markdownview_editor_role.yaml
?? config/rbac/markdownview_viewer_role.yaml
?? config/samples/view_v1_markdownview.yaml
?? controllers/markdownview_controller.go
?? controllers/suite_test.go
```

```diff
diff --git a/main.go b/main.go
index 97fd920..70865a6 100644
--- a/main.go
+++ b/main.go
@@ -30,6 +30,9 @@ import (
        ctrl "sigs.k8s.io/controller-runtime"
        "sigs.k8s.io/controller-runtime/pkg/healthz"
        "sigs.k8s.io/controller-runtime/pkg/log/zap"
+
+       viewv1 "github.com/zoetrope/markdown-view/api/v1"
+       "github.com/zoetrope/markdown-view/controllers"
        //+kubebuilder:scaffold:imports
 )
 
@@ -41,6 +44,7 @@ var (
 func init() {
        utilruntime.Must(clientgoscheme.AddToScheme(scheme))
 
+       utilruntime.Must(viewv1.AddToScheme(scheme))
        //+kubebuilder:scaffold:scheme
 }
 
@@ -85,6 +89,13 @@ func main() {
                os.Exit(1)
        }
 
+       if err = (&controllers.MarkdownViewReconciler{
+               Client: mgr.GetClient(),
+               Scheme: mgr.GetScheme(),
+       }).SetupWithManager(mgr); err != nil {
+               setupLog.Error(err, "unable to create controller", "controller", "MarkdownView")
+               os.Exit(1)
+       }
        //+kubebuilder:scaffold:builder
 
        if err := mgr.AddHealthzCheck("healthz", healthz.Ping); err != nil {
```


```
git add .
git commit -m "add api"
```


```console
$ make manifests
/home/ec2-user/markdown-view/bin/controller-gen rbac:roleName=manager-role crd webhook paths="./..." output:crd:artifacts:config=config/crd/bases
```

```console
$ git st -su
?? config/crd/bases/view.zoetrope.github.io_markdownviews.yaml
?? config/rbac/role.yaml
```
```
git add .
git ci -m "add api manifests"
```


## create  webhook

```console
$ kubebuilder create webhook --group view --version v1 --kind MarkdownView --programmatic-validation --defaulting
```

```console
$ git st -su
 M PROJECT
 M api/v1/zz_generated.deepcopy.go
 M go.mod
 M main.go
?? api/v1/markdownview_webhook.go
?? api/v1/webhook_suite_test.go
?? config/certmanager/certificate.yaml
?? config/certmanager/kustomization.yaml
?? config/certmanager/kustomizeconfig.yaml
?? config/default/manager_webhook_patch.yaml
?? config/default/webhookcainjection_patch.yaml
?? config/webhook/kustomization.yaml
?? config/webhook/kustomizeconfig.yaml
?? config/webhook/service.yaml
```


```diff
diff --git a/main.go b/main.go
index 70865a6..3b6b199 100644
--- a/main.go
+++ b/main.go
@@ -96,6 +96,10 @@ func main() {
                setupLog.Error(err, "unable to create controller", "controller", "MarkdownView")
                os.Exit(1)
        }
+       if err = (&viewv1.MarkdownView{}).SetupWebhookWithManager(mgr); err != nil {
+               setupLog.Error(err, "unable to create webhook", "webhook", "MarkdownView")
+               os.Exit(1)
+       }
        //+kubebuilder:scaffold:builder
 
        if err := mgr.AddHealthzCheck("healthz", healthz.Ping); err != nil {
```

```
git add .
git ci -m "add webhook"
```

```
make manifests
```

```console
$ git st -su
?? config/webhook/manifests.yaml
```
```
git add .
git ci -m "add webhook manifests"
```





### edit kustomization.yaml

`config/default/kustomization.yaml`

```diff
diff --git a/config/default/kustomization.yaml b/config/default/kustomization.yaml
index c850af7..1c89fac 100644
--- a/config/default/kustomization.yaml
+++ b/config/default/kustomization.yaml
@@ -18,9 +18,9 @@ bases:
 - ../manager
 # [WEBHOOK] To enable webhook, uncomment all the sections with [WEBHOOK] prefix including the one in
 # crd/kustomization.yaml
-#- ../webhook
+- ../webhook
 # [CERTMANAGER] To enable cert-manager, uncomment all sections with 'CERTMANAGER'. 'WEBHOOK' components are required.
-#- ../certmanager
+- ../certmanager
 # [PROMETHEUS] To enable prometheus monitor, uncomment all sections with 'PROMETHEUS'.
 #- ../prometheus
 
@@ -36,39 +36,39 @@ patchesStrategicMerge:
 
 # [WEBHOOK] To enable webhook, uncomment all the sections with [WEBHOOK] prefix including the one in
 # crd/kustomization.yaml
-#- manager_webhook_patch.yaml
+- manager_webhook_patch.yaml
 
 # [CERTMANAGER] To enable cert-manager, uncomment all sections with 'CERTMANAGER'.
 # Uncomment 'CERTMANAGER' sections in crd/kustomization.yaml to enable the CA injection in the admission webhooks.
 # 'CERTMANAGER' needs to be enabled to use ca injection
-#- webhookcainjection_patch.yaml
+- webhookcainjection_patch.yaml
 
 # the following config is for teaching kustomize how to do var substitution
 vars:
 # [CERTMANAGER] To enable cert-manager, uncomment all sections with 'CERTMANAGER' prefix.
-#- name: CERTIFICATE_NAMESPACE # namespace of the certificate CR
-#  objref:
-#    kind: Certificate
-#    group: cert-manager.io
-#    version: v1
-#    name: serving-cert # this name should match the one in certificate.yaml
-#  fieldref:
-#    fieldpath: metadata.namespace
-#- name: CERTIFICATE_NAME
-#  objref:
-#    kind: Certificate
-#    group: cert-manager.io
-#    version: v1
-#    name: serving-cert # this name should match the one in certificate.yaml
-#- name: SERVICE_NAMESPACE # namespace of the service
-#  objref:
-#    kind: Service
-#    version: v1
-#    name: webhook-service
-#  fieldref:
-#    fieldpath: metadata.namespace
-#- name: SERVICE_NAME
-#  objref:
-#    kind: Service
-#    version: v1
-#    name: webhook-service
+- name: CERTIFICATE_NAMESPACE # namespace of the certificate CR
+  objref:
+    kind: Certificate
+    group: cert-manager.io
+    version: v1
+    name: serving-cert # this name should match the one in certificate.yaml
+  fieldref:
+    fieldpath: metadata.namespace
+- name: CERTIFICATE_NAME
+  objref:
+    kind: Certificate
+    group: cert-manager.io
+    version: v1
+    name: serving-cert # this name should match the one in certificate.yaml
+- name: SERVICE_NAMESPACE # namespace of the service
+  objref:
+    kind: Service
+    version: v1
+    name: webhook-service
+  fieldref:
+    fieldpath: metadata.namespace
+- name: SERVICE_NAME
+  objref:
+    kind: Service
+    version: v1
+    name: webhook-service
```
```
git add .
git ci -m "edit kustomization"
```

### launch cluster

```console
$ kind create cluster
Creating cluster "kind" ...
 ✓ Ensuring node image (kindest/node:v1.25.0) 🖼
 ✓ Preparing nodes 📦  
 ✓ Writing configuration 📜 
 ✓ Starting control-plane 🕹️ 
 ✓ Installing CNI 🔌 
 ✓ Installing StorageClass 💾 
Set kubectl context to "kind-kind"
You can now use your cluster with:

kubectl cluster-info --context kind-kind

Have a nice day! 👋
```

```console
$ docker ps
CONTAINER ID   IMAGE                  COMMAND                  CREATED          STATUS          PORTS                       NAMES
d84e998bac1f   kindest/node:v1.25.0   "/usr/local/bin/entr…"   56 seconds ago   Up 52 seconds   127.0.0.1:38897->6443/tcp   kind-control-plane
```
```console
$ k config current-context
kind-kind
```

```console
$ k get pod -A
NAMESPACE            NAME                                         READY   STATUS    RESTARTS   AGE
kube-system          coredns-565d847f94-cwv2q                     1/1     Running   0          52s
kube-system          coredns-565d847f94-kvc4n                     1/1     Running   0          52s
kube-system          etcd-kind-control-plane                      1/1     Running   0          65s
kube-system          kindnet-bwwqq                                1/1     Running   0          52s
kube-system          kube-apiserver-kind-control-plane            1/1     Running   0          65s
kube-system          kube-controller-manager-kind-control-plane   1/1     Running   0          64s
kube-system          kube-proxy-2qt9v                             1/1     Running   0          52s
kube-system          kube-scheduler-kind-control-plane            1/1     Running   0          65s
local-path-storage   local-path-provisioner-684f458cdd-zxl24      1/1     Running   0          52s
```

### install cert-manager

```console
$ kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/latest/download/cert-manager.yaml
namespace/cert-manager created
customresourcedefinition.apiextensions.k8s.io/certificaterequests.cert-manager.io created
customresourcedefinition.apiextensions.k8s.io/certificates.cert-manager.io created
customresourcedefinition.apiextensions.k8s.io/challenges.acme.cert-manager.io created
customresourcedefinition.apiextensions.k8s.io/clusterissuers.cert-manager.io created
customresourcedefinition.apiextensions.k8s.io/issuers.cert-manager.io created
customresourcedefinition.apiextensions.k8s.io/orders.acme.cert-manager.io created
serviceaccount/cert-manager-cainjector created
serviceaccount/cert-manager created
serviceaccount/cert-manager-webhook created
configmap/cert-manager-webhook created
clusterrole.rbac.authorization.k8s.io/cert-manager-cainjector created
clusterrole.rbac.authorization.k8s.io/cert-manager-controller-issuers created
clusterrole.rbac.authorization.k8s.io/cert-manager-controller-clusterissuers created
clusterrole.rbac.authorization.k8s.io/cert-manager-controller-certificates created
clusterrole.rbac.authorization.k8s.io/cert-manager-controller-orders created
clusterrole.rbac.authorization.k8s.io/cert-manager-controller-challenges created
clusterrole.rbac.authorization.k8s.io/cert-manager-controller-ingress-shim created
clusterrole.rbac.authorization.k8s.io/cert-manager-view created
clusterrole.rbac.authorization.k8s.io/cert-manager-edit created
clusterrole.rbac.authorization.k8s.io/cert-manager-controller-approve:cert-manager-io created
clusterrole.rbac.authorization.k8s.io/cert-manager-controller-certificatesigningrequests created
clusterrole.rbac.authorization.k8s.io/cert-manager-webhook:subjectaccessreviews created
clusterrolebinding.rbac.authorization.k8s.io/cert-manager-cainjector created
clusterrolebinding.rbac.authorization.k8s.io/cert-manager-controller-issuers created
clusterrolebinding.rbac.authorization.k8s.io/cert-manager-controller-clusterissuers created
clusterrolebinding.rbac.authorization.k8s.io/cert-manager-controller-certificates created
clusterrolebinding.rbac.authorization.k8s.io/cert-manager-controller-orders created
clusterrolebinding.rbac.authorization.k8s.io/cert-manager-controller-challenges created
clusterrolebinding.rbac.authorization.k8s.io/cert-manager-controller-ingress-shim created
clusterrolebinding.rbac.authorization.k8s.io/cert-manager-controller-approve:cert-manager-io created
clusterrolebinding.rbac.authorization.k8s.io/cert-manager-controller-certificatesigningrequests created
clusterrolebinding.rbac.authorization.k8s.io/cert-manager-webhook:subjectaccessreviews created
role.rbac.authorization.k8s.io/cert-manager-cainjector:leaderelection created
role.rbac.authorization.k8s.io/cert-manager:leaderelection created
role.rbac.authorization.k8s.io/cert-manager-webhook:dynamic-serving created
rolebinding.rbac.authorization.k8s.io/cert-manager-cainjector:leaderelection created
rolebinding.rbac.authorization.k8s.io/cert-manager:leaderelection created
rolebinding.rbac.authorization.k8s.io/cert-manager-webhook:dynamic-serving created
service/cert-manager created
service/cert-manager-webhook created
deployment.apps/cert-manager-cainjector created
deployment.apps/cert-manager created
deployment.apps/cert-manager-webhook created
mutatingwebhookconfiguration.admissionregistration.k8s.io/cert-manager-webhook created
validatingwebhookconfiguration.admissionregistration.k8s.io/cert-manager-webhook created
```

```console
$ kubectl get pod -n cert-manager
NAME                                       READY   STATUS    RESTARTS   AGE
cert-manager-cainjector-857ff8f7cb-cbcb8   1/1     Running   0          61s
cert-manager-d58554549-hkrrd               1/1     Running   0          61s
cert-manager-webhook-76fdf7c485-6xwsw      1/1     Running   0          61s
```

### docker build


```
make docker-build
```


```
$ git st -su
 M api/v1/groupversion_info.go
```

```diff
diff --git a/api/v1/groupversion_info.go b/api/v1/groupversion_info.go
index e6798e3..88b3af3 100644
--- a/api/v1/groupversion_info.go
+++ b/api/v1/groupversion_info.go
@@ -15,8 +15,8 @@ limitations under the License.
 */
 
 // Package v1 contains API Schema definitions for the view v1 API group
-//+kubebuilder:object:generate=true
-//+groupName=view.zoetrope.github.io
+// +kubebuilder:object:generate=true
+// +groupName=view.zoetrope.github.io
 package v1
 
 import (
```

```
git add .
git ci -m "auto fmt by dockerbuild"
```
### edit `config/manager/manager.yaml`


```diff
diff --git a/config/manager/manager.yaml b/config/manager/manager.yaml
index 878ad48..ea3a068 100644
--- a/config/manager/manager.yaml
+++ b/config/manager/manager.yaml
@@ -39,6 +39,7 @@ spec:
         args:
         - --leader-elect
         image: controller:latest
+        imagePullPolicy: IfNotPresent
         name: manager
         securityContext:
           allowPrivilegeEscalation: false
```

```
git add .
git ci -m"fix imagepullpolicy"
```


```console
$ kind load docker-image controller:latest
Image: "controller:latest" with ID "sha256:3ce9ae85b547319abc611ddcbb39c3f44ed21608bea6f77697e29474853d6d7f" not yet present on node "kind-control-plane", loading...
```

### deploy controller
```
make install
```
```
make deploy
```
```console
$ git st -su
 M config/manager/kustomization.yaml
```

```diff
diff --git a/config/manager/kustomization.yaml b/config/manager/kustomization.yaml
index 2bcd3ee..5e793dd 100644
--- a/config/manager/kustomization.yaml
+++ b/config/manager/kustomization.yaml
@@ -5,6 +5,12 @@ generatorOptions:
   disableNameSuffixHash: true
 
 configMapGenerator:
-- name: manager-config
-  files:
+- files:
   - controller_manager_config.yaml
+  name: manager-config
+apiVersion: kustomize.config.k8s.io/v1beta1
+kind: Kustomization
+images:
+- name: controller
+  newName: controller
+  newTag: latest
```
```
git add .
git ci -m"deploy controller"
```


```console
$ kubectl get pod -n markdown-view-system
NAME                                                READY   STATUS    RESTARTS   AGE
markdown-view-controller-manager-6c684dbdfd-5jkkh   2/2     Running   0          93s
```

```console
k ns markdown-view-system
```
```console
$ stern --since=10m markdown-view-controller-manager
+ markdown-view-controller-manager-6c684dbdfd-5jkkh › manager
+ markdown-view-controller-manager-6c684dbdfd-5jkkh › kube-rbac-proxy
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517465425e+09        INFO    controller-runtime.metrics      Metrics server is starting to listen    {"addr": "127.0.0.1:8080"}
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.663669051746759e+09 INFO    controller-runtime.builder      Registering a mutating webhook  {"GVK": "view.zoetrope.github.io/v1, Kind=MarkdownView", "path": "/mutate-view-zoetrope-github-io-v1-markdownview"}
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517468295e+09        INFO    controller-runtime.webhook      Registering webhook     {"path": "/mutate-view-zoetrope-github-io-v1-markdownview"}
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517468789e+09        INFO    controller-runtime.builder      Registering a validating webhook        {"GVK": "view.zoetrope.github.io/v1, Kind=MarkdownView", "path": "/validate-view-zoetrope-github-io-v1-markdownview"}
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517469127e+09        INFO    controller-runtime.webhook      Registering webhook     {"path": "/validate-view-zoetrope-github-io-v1-markdownview"}
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517469697e+09        INFO    setup   starting manager
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517471147e+09        INFO    controller-runtime.webhook.webhooks     Starting webhook server
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517471483e+09        INFO    Starting server {"kind": "health probe", "addr": "[::]:8081"}
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517471936e+09        INFO    Starting server {"path": "/metrics", "kind": "metrics", "addr": "127.0.0.1:8080"}
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517472675e+09        INFO    controller-runtime.certwatcher  Updated current TLS certificate
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.663669051747319e+09 INFO    controller-runtime.webhook      Serving webhook server  {"host": "", "port": 9443}
markdown-view-controller-manager-6c684dbdfd-5jkkh manager I0920 10:17:31.747399       1 leaderelection.go:248] attempting to acquire leader lease markdown-view-system/3ca5b296.zoetrope.github.io...
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517475576e+09        INFO    controller-runtime.certwatcher  Starting certificate watcher
markdown-view-controller-manager-6c684dbdfd-5jkkh manager I0920 10:17:31.750400       1 leaderelection.go:258] successfully acquired lease markdown-view-system/3ca5b296.zoetrope.github.io
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517505648e+09        DEBUG   events  Normal  {"object": {"kind":"Lease","namespace":"markdown-view-system","name":"3ca5b296.zoetrope.github.io","uid":"d4a2a060-6659-4166-b20d-daa1576a5955","apiVersion":"coordination.k8s.io/v1","resourceVersion":"1319"}, "reason": "LeaderElection", "message": "markdown-view-controller-manager-6c684dbdfd-5jkkh_9842d70a-2532-4831-9098-aa4442be9b0b became leader"}
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517506897e+09        INFO    Starting EventSource    {"controller": "markdownview", "controllerGroup": "view.zoetrope.github.io", "controllerKind": "MarkdownView", "source": "kind source: *v1.MarkdownView"}
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.6636690517507148e+09        INFO    Starting Controller     {"controller": "markdownview", "controllerGroup": "view.zoetrope.github.io", "controllerKind": "MarkdownView"}
markdown-view-controller-manager-6c684dbdfd-5jkkh manager 1.663669051851831e+09 INFO    Starting workers        {"controller": "markdownview", "controllerGroup": "view.zoetrope.github.io", "controllerKind": "MarkdownView", "worker count": 1}
markdown-view-controller-manager-6c684dbdfd-5jkkh kube-rbac-proxy I0920 10:17:31.630883       1 main.go:186] Valid token audiences: 
markdown-view-controller-manager-6c684dbdfd-5jkkh kube-rbac-proxy I0920 10:17:31.630946       1 main.go:316] Generating self signed cert as no cert is provided
markdown-view-controller-manager-6c684dbdfd-5jkkh kube-rbac-proxy I0920 10:17:32.959896       1 main.go:366] Starting TCP socket on 0.0.0.0:8443
markdown-view-controller-manager-6c684dbdfd-5jkkh kube-rbac-proxy I0920 10:17:32.960111       1 main.go:373] Listening securely on 0.0.0.0:8443
```

### deploy samples

```
kubectl apply -f config/samples/view_v1_markdownview.yaml
```

### controller-gen

```
export PATH=$PATH:$(pwd)/bin
```

```console
$ controller-gen crd -w

CRD

+groupName=<string>                                                                                                               package  specifies the API group name for this package.                                    
+kubebuilder:deprecatedversion[:warning=<string>]                                                                                 type     marks this version as deprecated.                                                 
+kubebuilder:printcolumn:JSONPath=<string>[,description=<string>][,format=<string>],name=<string>[,priority=<int>],type=<string>  type     adds a column to "kubectl get" output for this CRD.                               
+kubebuilder:resource[:categories=<[]string>][,path=<string>][,scope=<string>][,shortName=<[]string>][,singular=<string>]         type     configures naming and scope for a CRD.                                            
+kubebuilder:skip                                                                                                                 package  don't consider this package as an API version.                                    
+kubebuilder:skipversion                                                                                                          type     removes the particular version of the CRD from the CRDs spec.                     
+kubebuilder:storageversion                                                                                                       type     marks this version as the "storage version" for the CRD for conversion.           
+kubebuilder:subresource:scale[:selectorpath=<string>],specpath=<string>,statuspath=<string>                                      type     enables the "/scale" subresource on a CRD.                                        
+kubebuilder:subresource:status                                                                                                   type     enables the "/status" subresource on a CRD.                                       
+kubebuilder:unservedversion                                                                                                      type     does not serve this version.                                                      
+versionName=<string>                                                                                                             package  overrides the API group version for this package (defaults to the package name).  


CRD processing

+kubebuilder:pruning:PreserveUnknownFields      type   PreserveUnknownFields stops the apiserver from pruning fields which are not specified.                                                                            
+kubebuilder:pruning:PreserveUnknownFields      field  PreserveUnknownFields stops the apiserver from pruning fields which are not specified.                                                                            
+kubebuilder:validation:XPreserveUnknownFields  type   PreserveUnknownFields stops the apiserver from pruning fields which are not specified.                                                                            
+kubebuilder:validation:XPreserveUnknownFields  field  PreserveUnknownFields stops the apiserver from pruning fields which are not specified.                                                                            
+listMapKey=<string>                            type   specifies the keys to map listTypes.                                                                                                                              
+listMapKey=<string>                            field  specifies the keys to map listTypes.                                                                                                                              
+listType=<string>                              type   specifies the type of data-structure that the list represents (map, set, atomic).                                                                                 
+listType=<string>                              field  specifies the type of data-structure that the list represents (map, set, atomic).                                                                                 
+mapType=<string>                               type   specifies the level of atomicity of the map; i.e. whether each item in the map is independent of the others, or all fields are treated as a single unit.          
+mapType=<string>                               field  specifies the level of atomicity of the map; i.e. whether each item in the map is independent of the others, or all fields are treated as a single unit.          
+structType=<string>                            type   specifies the level of atomicity of the struct; i.e. whether each field in the struct is independent of the others, or all fields are treated as a single unit.   
+structType=<string>                            field  specifies the level of atomicity of the struct; i.e. whether each field in the struct is independent of the others, or all fields are treated as a single unit.   


CRD validation

+kubebuilder:default=<any>                                            field    sets the default value for this field.                                                               
+kubebuilder:validation:EmbeddedResource                              field    EmbeddedResource marks a fields as an embedded resource with apiVersion, kind and metadata fields.   
+kubebuilder:validation:Enum=<[]any>                                  type     specifies that this (scalar) field is restricted to the *exact* values specified here.               
+kubebuilder:validation:Enum=<[]any>                                  field    specifies that this (scalar) field is restricted to the *exact* values specified here.               
+kubebuilder:validation:ExclusiveMaximum=<bool>                       type     indicates that the maximum is "up to" but not including that value.                                  
+kubebuilder:validation:ExclusiveMaximum=<bool>                       field    indicates that the maximum is "up to" but not including that value.                                  
+kubebuilder:validation:ExclusiveMinimum=<bool>                       type     indicates that the minimum is "up to" but not including that value.                                  
+kubebuilder:validation:ExclusiveMinimum=<bool>                       field    indicates that the minimum is "up to" but not including that value.                                  
+kubebuilder:validation:Format=<string>                               field    specifies additional "complex" formatting for this field.                                            
+kubebuilder:validation:Format=<string>                               type     specifies additional "complex" formatting for this field.                                            
+kubebuilder:validation:MaxItems=<int>                                type     specifies the maximum length for this list.                                                          
+kubebuilder:validation:MaxItems=<int>                                field    specifies the maximum length for this list.                                                          
+kubebuilder:validation:MaxLength=<int>                               field    specifies the maximum length for this string.                                                        
+kubebuilder:validation:MaxLength=<int>                               type     specifies the maximum length for this string.                                                        
+kubebuilder:validation:MaxProperties=<int>                           field    restricts the number of keys in an object                                                            
+kubebuilder:validation:MaxProperties=<int>                           type     restricts the number of keys in an object                                                            
+kubebuilder:validation:Maximum=<>                                    type     specifies the maximum numeric value that this field can have.                                        
+kubebuilder:validation:Maximum=<>                                    field    specifies the maximum numeric value that this field can have.                                        
+kubebuilder:validation:MinItems=<int>                                type     specifies the minimun length for this list.                                                          
+kubebuilder:validation:MinItems=<int>                                field    specifies the minimun length for this list.                                                          
+kubebuilder:validation:MinLength=<int>                               field    specifies the minimum length for this string.                                                        
+kubebuilder:validation:MinLength=<int>                               type     specifies the minimum length for this string.                                                        
+kubebuilder:validation:MinProperties=<int>                           type     restricts the number of keys in an object                                                            
+kubebuilder:validation:MinProperties=<int>                           field    restricts the number of keys in an object                                                            
+kubebuilder:validation:Minimum=<>                                    type     specifies the minimum numeric value that this field can have. Negative numbers are supported.        
+kubebuilder:validation:Minimum=<>                                    field    specifies the minimum numeric value that this field can have. Negative numbers are supported.        
+kubebuilder:validation:MultipleOf=<>                                 field    specifies that this field must have a numeric value that's a multiple of this one.                   
+kubebuilder:validation:MultipleOf=<>                                 type     specifies that this field must have a numeric value that's a multiple of this one.                   
+kubebuilder:validation:Optional                                      package  specifies that all fields in this package are optional by default.                                   
+kubebuilder:validation:Optional                                      field    specifies that this field is optional, if fields are required by default.                            
+kubebuilder:validation:Pattern=<string>                              field    specifies that this string must match the given regular expression.                                  
+kubebuilder:validation:Pattern=<string>                              type     specifies that this string must match the given regular expression.                                  
+kubebuilder:validation:Required                                      package  specifies that all fields in this package are required by default.                                   
+kubebuilder:validation:Required                                      field    specifies that this field is required, if fields are optional by default.                            
+kubebuilder:validation:Schemaless                                    field    marks a field as being a schemaless object.                                                          
+kubebuilder:validation:Type=<string>                                 type     overrides the type for this field (which defaults to the equivalent of the Go type).                 
+kubebuilder:validation:Type=<string>                                 field    overrides the type for this field (which defaults to the equivalent of the Go type).                 
+kubebuilder:validation:UniqueItems=<bool>                            field    specifies that all items in this list must be unique.                                                
+kubebuilder:validation:UniqueItems=<bool>                            type     specifies that all items in this list must be unique.                                                
+kubebuilder:validation:XEmbeddedResource                             type     EmbeddedResource marks a fields as an embedded resource with apiVersion, kind and metadata fields.   
+kubebuilder:validation:XEmbeddedResource                             field    EmbeddedResource marks a fields as an embedded resource with apiVersion, kind and metadata fields.   
+kubebuilder:validation:XIntOrString                                  field    IntOrString marks a fields as an IntOrString.                                                        
+kubebuilder:validation:XIntOrString                                  type     IntOrString marks a fields as an IntOrString.                                                        
+kubebuilder:validation:XValidation[:message=<string>],rule=<string>  field    marks a field as requiring a value for which a given expression evaluates to true.                   
+kubebuilder:validation:XValidation[:message=<string>],rule=<string>  type     marks a field as requiring a value for which a given expression evaluates to true.                   
+nullable                                                             field    marks this field as allowing the "null" value.                                                       
+optional                                                             field    specifies that this field is optional, if fields are required by default.   
```


```console
$ controller-gen webhook -w

Webhook

+kubebuilder:webhook:admissionReviewVersions=<[]string>,failurePolicy=<string>,groups=<[]string>[,matchPolicy=<string>],mutating=<bool>,name=<string>,path=<string>,resources=<[]string>[,sideEffects=<string>],verbs=<[]string>,versions=<[]string>[,webhookVersions=<[]string>]  package  specifies how a webhook should be served.   
```
