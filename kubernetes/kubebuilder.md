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

## generate crd manifests

### edit manifest
`vim config/samples/view_v1_markdownview.yaml`

```diff
diff --git a/config/samples/view_v1_markdownview.yaml b/config/samples/view_v1_markdownview.yaml
index 71212b8..afee52a 100644
--- a/config/samples/view_v1_markdownview.yaml
+++ b/config/samples/view_v1_markdownview.yaml
@@ -3,4 +3,14 @@ kind: MarkdownView
 metadata:
   name: markdownview-sample
 spec:
-  # TODO(user): Add fields here
+  markdowns:
+    SUMMARY.md: |
+      # Summary
+
+      - [Page1](page1.md)
+    page1.md: |
+      # Page 1
+
+      一ページ目のコンテンツです。
+  replicas: 1
+  viewerImage: "peaceiris/mdbook:latest"
\ No newline at end of file
```

### edit crd struct

```diff
diff --git a/api/v1/markdownview_types.go b/api/v1/markdownview_types.go
index e76d377..64ee4e9 100644
--- a/api/v1/markdownview_types.go
+++ b/api/v1/markdownview_types.go
@@ -25,11 +25,21 @@ import (
 
 // MarkdownViewSpec defines the desired state of MarkdownView
 type MarkdownViewSpec struct {
-       // INSERT ADDITIONAL SPEC FIELDS - desired state of cluster
-       // Important: Run "make" to regenerate code after modifying this file
+       // Markdowns contain the markdown files you want to display.
+       // The key indicates the file name and must not overlap with the keys.
+       // The value is the content in markdown format.
+       //+kubebuilder:validation:Required
+       //+kubebuilder:validation:MinProperties=1
+       Markdowns map[string]string `json:"markdowns,omitempty"`
+
+       // Replicas is the number of viewers.
+       // +kubebuilder:default=1
+       // +optional
+       Replicas int32 `json:"replicas,omitempty"`
 
-       // Foo is an example field of MarkdownView. Edit markdownview_types.go to remove/update
-       Foo string `json:"foo,omitempty"`
+       // ViewerImage is the image name of the viewer.
+       // +optional
+       ViewerImage string `json:"viewerImage,omitempty"`
 }
 
 // MarkdownViewStatus defines the observed state of MarkdownView
 ```
 
 ```
 git add .
 git ci -m"edit markdownviewspec"
 ```
 
 ```diff
 diff --git a/api/v1/markdownview_types.go b/api/v1/markdownview_types.go
index 64ee4e9..34e1242 100644
--- a/api/v1/markdownview_types.go
+++ b/api/v1/markdownview_types.go
@@ -43,10 +43,14 @@ type MarkdownViewSpec struct {
 }
 
 // MarkdownViewStatus defines the observed state of MarkdownView
-type MarkdownViewStatus struct {
-       // INSERT ADDITIONAL STATUS FIELD - define observed state of cluster
-       // Important: Run "make" to regenerate code after modifying this file
-}
+// +kubebuilder:validation:Enum=NotReady;Available;Healthy
+type MarkdownViewStatus string
+
+const (
+       MarkdownViewNotReady  = MarkdownViewStatus("NotReady")
+       MarkdownViewAvailable = MarkdownViewStatus("Available")
+       MarkdownViewHealthy   = MarkdownViewStatus("Healthy")
+)
 
 //+kubebuilder:object:root=true
 //+kubebuilder:subresource:status
 ```

 ```
 git add .
 git ci -m"edit markdownviewstatus"
 ```
 
 ```diff
 diff --git a/api/v1/markdownview_types.go b/api/v1/markdownview_types.go
index 34e1242..4c52355 100644
--- a/api/v1/markdownview_types.go
+++ b/api/v1/markdownview_types.go
@@ -54,6 +54,8 @@ const (
 
 //+kubebuilder:object:root=true
 //+kubebuilder:subresource:status
+//+kubebuilder:printcolumn:name="REPLICAS",type="integer",JSONPath=".spec.replicas"
+//+kubebuilder:printcolumn:name="STATUS",type="string",JSONPath=".status"
 
 // MarkdownView is the Schema for the markdownviews API
 type MarkdownView struct {
 ```
 
 ```
 git add .
 git ci -m"edit markdownview"
 ```
 
 
 ```
 make manifests
 ```
 
 ```console
 $ git st -su
 M config/crd/bases/view.zoetrope.github.io_markdownviews.yaml
 ```
 
 ```
 git add .
 git ci -m "make crd manifest"
 ```
 
### edit rbac manifest

```diff
diff --git a/controllers/markdownview_controller.go b/controllers/markdownview_controller.go
index aa6bec2..911bce4 100644
--- a/controllers/markdownview_controller.go
+++ b/controllers/markdownview_controller.go
@@ -36,6 +36,10 @@ type MarkdownViewReconciler struct {
 //+kubebuilder:rbac:groups=view.zoetrope.github.io,resources=markdownviews,verbs=get;list;watch;create;update;patch;delete
 //+kubebuilder:rbac:groups=view.zoetrope.github.io,resources=markdownviews/status,verbs=get;update;patch
 //+kubebuilder:rbac:groups=view.zoetrope.github.io,resources=markdownviews/finalizers,verbs=update
+//+kubebuilder:rbac:groups=core,resources=configmaps,verbs=get;list;watch;create;update;patch;delete
+//+kubebuilder:rbac:groups=apps,resources=deployments,verbs=get;list;watch;create;update;patch;delete
+//+kubebuilder:rbac:groups=core,resources=services,verbs=get;list;watch;create;update;patch;delete
+//+kubebuilder:rbac:groups=core,resources=events,verbs=create;update;patch
 
 // Reconcile is part of the main kubernetes reconciliation loop which aims to
 // move the current state of the cluster closer to the desired state.
```

```
make manifests
```

```diff
diff --git a/config/rbac/role.yaml b/config/rbac/role.yaml
index 53039dd..bf8f0c1 100644
--- a/config/rbac/role.yaml
+++ b/config/rbac/role.yaml
@@ -5,6 +5,50 @@ metadata:
   creationTimestamp: null
   name: manager-role
 rules:
+- apiGroups:
+  - apps
+  resources:
+  - deployments
+  verbs:
+  - create
+  - delete
+  - get
+  - list
+  - patch
+  - update
+  - watch
+- apiGroups:
+  - ""
+  resources:
+  - configmaps
+  verbs:
+  - create
+  - delete
+  - get
+  - list
+  - patch
+  - update
+  - watch
+- apiGroups:
+  - ""
+  resources:
+  - events
+  verbs:
+  - create
+  - patch
+  - update
+- apiGroups:
+  - ""
+  resources:
+  - services
+  verbs:
+  - create
+  - delete
+  - get
+  - list
+  - patch
+  - update
+  - watch
 - apiGroups:
   - view.zoetrope.github.io
   resources:
```

```
git add .
git ci -m "make rbac manifest"
```


### how to use client

```diff
diff --git a/controllers/markdownview_controller.go b/controllers/markdownview_controller.go
index 911bce4..11b1713 100644
--- a/controllers/markdownview_controller.go
+++ b/controllers/markdownview_controller.go
@@ -18,13 +18,27 @@ package controllers
 
 import (
        "context"
+       "fmt"
 
+       viewv1 "github.com/zoetrope/markdown-view/api/v1"
+       appsv1 "k8s.io/api/apps/v1"
+       corev1 "k8s.io/api/core/v1"
+       "k8s.io/apimachinery/pkg/api/equality"
+       apierrors "k8s.io/apimachinery/pkg/api/errors"
+       metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
+       "k8s.io/apimachinery/pkg/apis/meta/v1/unstructured"
+       "k8s.io/apimachinery/pkg/labels"
        "k8s.io/apimachinery/pkg/runtime"
+       "k8s.io/apimachinery/pkg/runtime/schema"
+       "k8s.io/apimachinery/pkg/util/intstr"
+       applyappsv1 "k8s.io/client-go/applyconfigurations/apps/v1"
+       applycorev1 "k8s.io/client-go/applyconfigurations/core/v1"
+       applymetav1 "k8s.io/client-go/applyconfigurations/meta/v1"
+       "k8s.io/utils/pointer"
        ctrl "sigs.k8s.io/controller-runtime"
        "sigs.k8s.io/controller-runtime/pkg/client"
+       "sigs.k8s.io/controller-runtime/pkg/controller/controllerutil"
        "sigs.k8s.io/controller-runtime/pkg/log"
-
-       viewv1 "github.com/zoetrope/markdown-view/api/v1"
 )
 
 // MarkdownViewReconciler reconciles a MarkdownView object
@@ -58,6 +72,254 @@ func (r *MarkdownViewReconciler) Reconcile(ctx context.Context, req ctrl.Request
        return ctrl.Result{}, nil
 }
 
+func (r *MarkdownViewReconciler) Reconcile_get(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
+       var deployment appsv1.Deployment
+       err := r.Get(ctx, client.ObjectKey{Namespace: "default", Name: "sample"}, &deployment)
+       if err != nil {
+               return ctrl.Result{}, err
+       }
+       fmt.Printf("Got Deployment: %#v\n", deployment)
+       return ctrl.Result{}, nil
+}
+
+func (r *MarkdownViewReconciler) Reconcile_list(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
+       var services corev1.ServiceList
+       err := r.List(ctx, &services, &client.ListOptions{
+               Namespace:     "default",
+               LabelSelector: labels.SelectorFromSet(map[string]string{"app": "sample"}),
+       })
+       if err != nil {
+               return ctrl.Result{}, err
+       }
+       for _, svc := range services.Items {
+               fmt.Println(svc.Name)
+       }
+       return ctrl.Result{}, nil
+}
+
+func (r *MarkdownViewReconciler) Reconcile_pagination(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
+       token := ""
+       for i := 0; ; i++ {
+               var services corev1.ServiceList
+               err := r.List(ctx, &services, &client.ListOptions{
+                       Limit:    3,
+                       Continue: token,
+               })
+               if err != nil {
+                       return ctrl.Result{}, err
+               }
+
+               fmt.Printf("Page %d:\n", i)
+               for _, svc := range services.Items {
+                       fmt.Println(svc.Name)
+               }
+               fmt.Println()
+
+               token = services.ListMeta.Continue
+               if len(token) == 0 {
+                       return ctrl.Result{}, nil
+               }
+       }
+}
+
+func (r *MarkdownViewReconciler) Reconcile_create(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
+       dep := appsv1.Deployment{
+               ObjectMeta: metav1.ObjectMeta{
+                       Name:      "sample",
+                       Namespace: "default",
+               },
+               Spec: appsv1.DeploymentSpec{
+                       Replicas: pointer.Int32Ptr(1),
+                       Selector: &metav1.LabelSelector{
+                               MatchLabels: map[string]string{"app": "nginx"},
+                       },
+                       Template: corev1.PodTemplateSpec{
+                               ObjectMeta: metav1.ObjectMeta{
+                                       Labels: map[string]string{"app": "nginx"},
+                               },
+                               Spec: corev1.PodSpec{
+                                       Containers: []corev1.Container{
+                                               {
+                                                       Name:  "nginx",
+                                                       Image: "nginx:latest",
+                                               },
+                                       },
+                               },
+                       },
+               },
+       }
+       err := r.Create(ctx, &dep)
+       if err != nil {
+               return ctrl.Result{}, err
+       }
+       return ctrl.Result{}, nil
+}
+
+func (r *MarkdownViewReconciler) Reconcile_createOrUpdate(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
+       svc := &corev1.Service{}
+       svc.SetNamespace("default")
+       svc.SetName("sample")
+
+       op, err := ctrl.CreateOrUpdate(ctx, r.Client, svc, func() error {
+               svc.Spec.Type = corev1.ServiceTypeClusterIP
+               svc.Spec.Selector = map[string]string{"app": "nginx"}
+               svc.Spec.Ports = []corev1.ServicePort{
+                       {
+                               Name:       "http",
+                               Protocol:   corev1.ProtocolTCP,
+                               Port:       80,
+                               TargetPort: intstr.FromInt(80),
+                       },
+               }
+               return nil
+       })
+       if err != nil {
+               return ctrl.Result{}, err
+       }
+       if op != controllerutil.OperationResultNone {
+               fmt.Printf("Deployment %s\n", op)
+       }
+       return ctrl.Result{}, nil
+}
+
+func (r *MarkdownViewReconciler) Reconcile_patchMerge(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
+       var dep appsv1.Deployment
+       err := r.Get(ctx, client.ObjectKey{Namespace: "default", Name: "sample"}, &dep)
+       if err != nil {
+               return ctrl.Result{}, err
+       }
+
+       newDep := dep.DeepCopy()
+       newDep.Spec.Replicas = pointer.Int32Ptr(3)
+       patch := client.MergeFrom(&dep)
+
+       err = r.Patch(ctx, newDep, patch)
+
+       return ctrl.Result{}, err
+}
+
+func (r *MarkdownViewReconciler) Reconcile_patchApply(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
+       patch := &unstructured.Unstructured{}
+       patch.SetGroupVersionKind(schema.GroupVersionKind{
+               Group:   "apps",
+               Version: "v1",
+               Kind:    "Deployment",
+       })
+       patch.SetNamespace("default")
+       patch.SetName("sample2")
+       patch.UnstructuredContent()["spec"] = map[string]interface{}{
+               "replicas": 2,
+               "selector": map[string]interface{}{
+                       "matchLabels": map[string]string{
+                               "app": "nginx",
+                       },
+               },
+               "template": map[string]interface{}{
+                       "metadata": map[string]interface{}{
+                               "labels": map[string]string{
+                                       "app": "nginx",
+                               },
+                       },
+                       "spec": map[string]interface{}{
+                               "containers": []interface{}{
+                                       map[string]interface{}{
+                                               "name":  "nginx",
+                                               "image": "nginx:latest",
+                                       },
+                               },
+                       },
+               },
+       }
+
+       err := r.Patch(ctx, patch, client.Apply, &client.PatchOptions{
+               FieldManager: "client-sample",
+               Force:        pointer.Bool(true),
+       })
+
+       return ctrl.Result{}, err
+}
+
+func (r *MarkdownViewReconciler) Reconcile_patchApplyConfig(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
+       dep := applyappsv1.Deployment("sample3", "default").
+               WithSpec(applyappsv1.DeploymentSpec().
+                       WithReplicas(3).
+                       WithSelector(applymetav1.LabelSelector().WithMatchLabels(map[string]string{"app": "nginx"})).
+                       WithTemplate(applycorev1.PodTemplateSpec().
+                               WithLabels(map[string]string{"app": "nginx"}).
+                               WithSpec(applycorev1.PodSpec().
+                                       WithContainers(applycorev1.Container().
+                                               WithName("nginx").
+                                               WithImage("nginx:latest"),
+                                       ),
+                               ),
+                       ),
+               )
+
+       obj, err := runtime.DefaultUnstructuredConverter.ToUnstructured(dep)
+       if err != nil {
+               return ctrl.Result{}, err
+       }
+       patch := &unstructured.Unstructured{
+               Object: obj,
+       }
+
+       var current appsv1.Deployment
+       err = r.Get(ctx, client.ObjectKey{Namespace: "default", Name: "sample3"}, &current)
+       if err != nil && !apierrors.IsNotFound(err) {
+               return ctrl.Result{}, err
+       }
+
+       currApplyConfig, err := applyappsv1.ExtractDeployment(&current, "client-sample")
+       if err != nil {
+               return ctrl.Result{}, err
+       }
+
+       if equality.Semantic.DeepEqual(dep, currApplyConfig) {
+               return ctrl.Result{}, nil
+       }
+
+       err = r.Patch(ctx, patch, client.Apply, &client.PatchOptions{
+               FieldManager: "client-sample",
+               Force:        pointer.Bool(true),
+       })
+       return ctrl.Result{}, err
+}
+
+func (r *MarkdownViewReconciler) updateStatus(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
+       var dep appsv1.Deployment
+       err := r.Get(ctx, client.ObjectKey{Namespace: "default", Name: "sample"}, &dep)
+       if err != nil {
+               return ctrl.Result{}, err
+       }
+
+       dep.Status.AvailableReplicas = 3
+       err = r.Status().Update(ctx, &dep)
+       return ctrl.Result{}, err
+}
+
+func (r *MarkdownViewReconciler) Reconcile_deleteWithPreConditions(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
+       var deploy appsv1.Deployment
+       err := r.Get(ctx, client.ObjectKey{Namespace: "default", Name: "sample"}, &deploy)
+       if err != nil {
+               return ctrl.Result{}, err
+       }
+       uid := deploy.GetUID()
+       resourceVersion := deploy.GetResourceVersion()
+       cond := metav1.Preconditions{
+               UID:             &uid,
+               ResourceVersion: &resourceVersion,
+       }
+       err = r.Delete(ctx, &deploy, &client.DeleteOptions{
+               Preconditions: &cond,
+       })
+       return ctrl.Result{}, err
+}
+
+func (r *MarkdownViewReconciler) Reconcile_deleteAllOfDeployment(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
+       err := r.DeleteAllOf(ctx, &appsv1.Deployment{}, client.InNamespace("default"))
+       return ctrl.Result{}, err
+}
+
 // SetupWithManager sets up the controller with the Manager.
 func (r *MarkdownViewReconciler) SetupWithManager(mgr ctrl.Manager) error {
        return ctrl.NewControllerManagedBy(mgr).
diff --git a/go.mod b/go.mod
index dbbbcf7..16ab032 100644
--- a/go.mod
+++ b/go.mod
@@ -8,6 +8,7 @@ require (
        k8s.io/api v0.24.2
        k8s.io/apimachinery v0.24.2
        k8s.io/client-go v0.24.2
+       k8s.io/utils v0.0.0-20220210201930-3a6ce19ff2f9
        sigs.k8s.io/controller-runtime v0.12.2
 )
 
@@ -76,7 +77,6 @@ require (
        k8s.io/component-base v0.24.2 // indirect
        k8s.io/klog/v2 v2.60.1 // indirect
        k8s.io/kube-openapi v0.0.0-20220328201542-3ee0da9b0b42 // indirect
-       k8s.io/utils v0.0.0-20220210201930-3a6ce19ff2f9 // indirect
        sigs.k8s.io/json v0.0.0-20211208200746-9f7c6b3444d2 // indirect
        sigs.k8s.io/structured-merge-diff/v4 v4.2.1 // indirect
        sigs.k8s.io/yaml v1.3.0 // indirect
```

```
git add .
git ci -m"create client"
```

### implemetion reconcile

```diff
diff --git a/controllers/markdownview_controller.go b/controllers/markdownview_controller.go
index 11b1713..e7c16f1 100644
--- a/controllers/markdownview_controller.go
+++ b/controllers/markdownview_controller.go
@@ -24,6 +24,7 @@ import (
 	appsv1 "k8s.io/api/apps/v1"
 	corev1 "k8s.io/api/core/v1"
 	"k8s.io/apimachinery/pkg/api/equality"
+	"k8s.io/apimachinery/pkg/api/errors"
 	apierrors "k8s.io/apimachinery/pkg/api/errors"
 	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
 	"k8s.io/apimachinery/pkg/apis/meta/v1/unstructured"
@@ -65,10 +66,257 @@ type MarkdownViewReconciler struct {
 // For more details, check Reconcile and its Result here:
 // - https://pkg.go.dev/sigs.k8s.io/controller-runtime@v0.12.2/pkg/reconcile
 func (r *MarkdownViewReconciler) Reconcile(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
-	_ = log.FromContext(ctx)
+	logger := log.FromContext(ctx)

-	// TODO(user): your logic here
+	var mdView viewv1.MarkdownView
+	err := r.Get(ctx, req.NamespacedName, &mdView)
+	if errors.IsNotFound(err) {
+		return ctrl.Result{}, nil
+	}
+	if err != nil {
+		logger.Error(err, "unable to get MarkdownView", "name", req.NamespacedName)
+		return ctrl.Result{}, err
+	}
+
+	if !mdView.ObjectMeta.DeletionTimestamp.IsZero() {
+		return ctrl.Result{}, nil
+	}
+
+	err = r.reconcileConfigMap(ctx, mdView)
+	if err != nil {
+		return ctrl.Result{}, err
+	}
+	err = r.reconcileDeployment(ctx, mdView)
+	if err != nil {
+		return ctrl.Result{}, err
+	}
+	err = r.reconcileService(ctx, mdView)
+	if err != nil {
+		return ctrl.Result{}, err
+	}
+
+	return r.updateStatus(ctx, mdView)
+}
+
+func (r *MarkdownViewReconciler) reconcileConfigMap(ctx context.Context, mdView viewv1.MarkdownView) error {
+	logger := log.FromContext(ctx)

+	cm := &corev1.ConfigMap{}
+	cm.SetNamespace(mdView.Namespace)
+	cm.SetName("markdowns-" + mdView.Name)
+
+	op, err := ctrl.CreateOrUpdate(ctx, r.Client, cm, func() error {
+		if cm.Data == nil {
+			cm.Data = make(map[string]string)
+		}
+		for name, content := range mdView.Spec.Markdowns {
+			cm.Data[name] = content
+		}
+		return nil
+	})
+
+	if err != nil {
+		logger.Error(err, "unable to create or update ConfigMap")
+		return err
+	}
+	if op != controllerutil.OperationResultNone {
+		logger.Info("reconcile ConfigMap successfully", "op", op)
+	}
+	return nil
+}
+
+func (r *MarkdownViewReconciler) reconcileDeployment(ctx context.Context, mdView viewv1.MarkdownView) error {
+	logger := log.FromContext(ctx)
+
+	depName := "viewer-" + mdView.Name
+	viewerImage := "peaceiris/mdbook:latest"
+	if len(mdView.Spec.ViewerImage) != 0 {
+		viewerImage = mdView.Spec.ViewerImage
+	}
+
+	dep := applyappsv1.Deployment(depName, mdView.Namespace).
+		WithLabels(map[string]string{
+			"app.kubernetes.io/name":       "mdbook",
+			"app.kubernetes.io/instance":   mdView.Name,
+			"app.kubernetes.io/created-by": "markdown-view-controller",
+		}).
+		WithSpec(applyappsv1.DeploymentSpec().
+			WithReplicas(mdView.Spec.Replicas).
+			WithSelector(applymetav1.LabelSelector().WithMatchLabels(map[string]string{
+				"app.kubernetes.io/name":       "mdbook",
+				"app.kubernetes.io/instance":   mdView.Name,
+				"app.kubernetes.io/created-by": "markdown-view-controller",
+			})).
+			WithTemplate(applycorev1.PodTemplateSpec().
+				WithLabels(map[string]string{
+					"app.kubernetes.io/name":       "mdbook",
+					"app.kubernetes.io/instance":   mdView.Name,
+					"app.kubernetes.io/created-by": "markdown-view-controller",
+				}).
+				WithSpec(applycorev1.PodSpec().
+					WithContainers(applycorev1.Container().
+						WithName("mdbook").
+						WithImage(viewerImage).
+						WithImagePullPolicy(corev1.PullIfNotPresent).
+						WithCommand("mdbook").
+						WithArgs("serve", "--hostname", "0.0.0.0").
+						WithVolumeMounts(applycorev1.VolumeMount().
+							WithName("markdowns").
+							WithMountPath("/book/src"),
+						).
+						WithPorts(applycorev1.ContainerPort().
+							WithName("http").
+							WithProtocol(corev1.ProtocolTCP).
+							WithContainerPort(3000),
+						).
+						WithLivenessProbe(applycorev1.Probe().
+							WithHTTPGet(applycorev1.HTTPGetAction().
+								WithPort(intstr.FromString("http")).
+								WithPath("/").
+								WithScheme(corev1.URISchemeHTTP),
+							),
+						).
+						WithReadinessProbe(applycorev1.Probe().
+							WithHTTPGet(applycorev1.HTTPGetAction().
+								WithPort(intstr.FromString("http")).
+								WithPath("/").
+								WithScheme(corev1.URISchemeHTTP),
+							),
+						),
+					).
+					WithVolumes(applycorev1.Volume().
+						WithName("markdowns").
+						WithConfigMap(applycorev1.ConfigMapVolumeSource().
+							WithName("markdowns-" + mdView.Name),
+						),
+					),
+				),
+			),
+		)
+
+	obj, err := runtime.DefaultUnstructuredConverter.ToUnstructured(dep)
+	if err != nil {
+		return err
+	}
+	patch := &unstructured.Unstructured{
+		Object: obj,
+	}
+
+	var current appsv1.Deployment
+	err = r.Get(ctx, client.ObjectKey{Namespace: mdView.Namespace, Name: depName}, &current)
+	if err != nil && !errors.IsNotFound(err) {
+		return err
+	}
+
+	currApplyConfig, err := applyappsv1.ExtractDeployment(&current, "markdown-view-controller")
+	if err != nil {
+		return err
+	}
+
+	if equality.Semantic.DeepEqual(dep, currApplyConfig) {
+		return nil
+	}
+
+	err = r.Patch(ctx, patch, client.Apply, &client.PatchOptions{
+		FieldManager: "markdown-view-controller",
+		Force:        pointer.Bool(true),
+	})
+
+	if err != nil {
+		logger.Error(err, "unable to create or update Deployment")
+		return err
+	}
+	logger.Info("reconcile Deployment successfully", "name", mdView.Name)
+	return nil
+}
+
+func (r *MarkdownViewReconciler) reconcileService(ctx context.Context, mdView viewv1.MarkdownView) error {
+	logger := log.FromContext(ctx)
+	svcName := "viewer-" + mdView.Name
+
+	svc := applycorev1.Service(svcName, mdView.Namespace).
+		WithLabels(map[string]string{
+			"app.kubernetes.io/name":       "mdbook",
+			"app.kubernetes.io/instance":   mdView.Name,
+			"app.kubernetes.io/created-by": "markdown-view-controller",
+		}).
+		WithSpec(applycorev1.ServiceSpec().
+			WithSelector(map[string]string{
+				"app.kubernetes.io/name":       "mdbook",
+				"app.kubernetes.io/instance":   mdView.Name,
+				"app.kubernetes.io/created-by": "markdown-view-controller",
+			}).
+			WithType(corev1.ServiceTypeClusterIP).
+			WithPorts(applycorev1.ServicePort().
+				WithProtocol(corev1.ProtocolTCP).
+				WithPort(80).
+				WithTargetPort(intstr.FromInt(3000)),
+			),
+		)
+
+	obj, err := runtime.DefaultUnstructuredConverter.ToUnstructured(svc)
+	if err != nil {
+		return err
+	}
+	patch := &unstructured.Unstructured{
+		Object: obj,
+	}
+
+	var current corev1.Service
+	err = r.Get(ctx, client.ObjectKey{Namespace: mdView.Namespace, Name: svcName}, &current)
+	if err != nil && !errors.IsNotFound(err) {
+		return err
+	}
+
+	currApplyConfig, err := applycorev1.ExtractService(&current, "markdown-view-controller")
+	if err != nil {
+		return err
+	}
+
+	if equality.Semantic.DeepEqual(svc, currApplyConfig) {
+		return nil
+	}
+
+	err = r.Patch(ctx, patch, client.Apply, &client.PatchOptions{
+		FieldManager: "markdown-view-controller",
+		Force:        pointer.Bool(true),
+	})
+	if err != nil {
+		logger.Error(err, "unable to create or update Service")
+		return err
+	}
+
+	logger.Info("reconcile Service successfully", "name", mdView.Name)
+	return nil
+}
+
+func (r *MarkdownViewReconciler) updateStatus(ctx context.Context, mdView viewv1.MarkdownView) (ctrl.Result, error) {
+	var dep appsv1.Deployment
+	err := r.Get(ctx, client.ObjectKey{Namespace: mdView.Namespace, Name: "viewer-" + mdView.Name}, &dep)
+	if err != nil {
+		return ctrl.Result{}, err
+	}
+
+	var status viewv1.MarkdownViewStatus
+	if dep.Status.AvailableReplicas == 0 {
+		status = viewv1.MarkdownViewNotReady
+	} else if dep.Status.AvailableReplicas == mdView.Spec.Replicas {
+		status = viewv1.MarkdownViewHealthy
+	} else {
+		status = viewv1.MarkdownViewAvailable
+	}
+
+	if mdView.Status != status {
+		mdView.Status = status
+		err = r.Status().Update(ctx, &mdView)
+		if err != nil {
+			return ctrl.Result{}, err
+		}
+	}
+
+	if mdView.Status != viewv1.MarkdownViewHealthy {
+		return ctrl.Result{Requeue: true}, nil
+	}
 	return ctrl.Result{}, nil
 }

@@ -285,18 +533,6 @@ func (r *MarkdownViewReconciler) Reconcile_patchApplyConfig(ctx context.Context,
 	return ctrl.Result{}, err
 }

-func (r *MarkdownViewReconciler) updateStatus(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
-	var dep appsv1.Deployment
-	err := r.Get(ctx, client.ObjectKey{Namespace: "default", Name: "sample"}, &dep)
-	if err != nil {
-		return ctrl.Result{}, err
-	}
-
-	dep.Status.AvailableReplicas = 3
-	err = r.Status().Update(ctx, &dep)
-	return ctrl.Result{}, err
-}
-
 func (r *MarkdownViewReconciler) Reconcile_deleteWithPreConditions(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {
 	var deploy appsv1.Deployment
 	err := r.Get(ctx, client.ObjectKey{Namespace: "default", Name: "sample"}, &deploy)
@@ -324,5 +560,8 @@ func (r *MarkdownViewReconciler) Reconcile_deleteAllOfDeployment(ctx context.Con
 func (r *MarkdownViewReconciler) SetupWithManager(mgr ctrl.Manager) error {
 	return ctrl.NewControllerManagedBy(mgr).
 		For(&viewv1.MarkdownView{}).
+		Owns(&corev1.ConfigMap{}).
+		Owns(&appsv1.Deployment{}).
+		Owns(&corev1.Service{}).
 		Complete(r)
 }
 ```
 
```
git add .
git ci -m "fix reconcile"
```
