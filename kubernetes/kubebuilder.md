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

### install kubebuilder

```
# download kubebuilder and install locally.
sudo curl -SsL -o kubebuilder https://go.kubebuilder.io/dl/latest/$(go env GOOS)/$(go env GOARCH)
sudo chmod +x kubebuilder && sudo mv kubebuilder /usr/local/bin/
```

### install misc

```
yum install -y git tree
```

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
git commit -m "add files"
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
$ tree -C .
.
├── api
│   └── v1
│       ├── groupversion_info.go
│       ├── markdownview_types.go
│       └── zz_generated.deepcopy.go
├── bin
│   └── controller-gen
├── config
│   ├── crd
│   │   ├── bases
│   │   │   └── view.zoetrope.github.io_markdownviews.yaml
│   │   ├── kustomization.yaml
│   │   ├── kustomizeconfig.yaml
│   │   └── patches
│   │       ├── cainjection_in_markdownviews.yaml
│   │       └── webhook_in_markdownviews.yaml
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
│   ├── rbac
│   │   ├── auth_proxy_client_clusterrole.yaml
│   │   ├── auth_proxy_role_binding.yaml
│   │   ├── auth_proxy_role.yaml
│   │   ├── auth_proxy_service.yaml
│   │   ├── kustomization.yaml
│   │   ├── leader_election_role_binding.yaml
│   │   ├── leader_election_role.yaml
│   │   ├── markdownview_editor_role.yaml
│   │   ├── markdownview_viewer_role.yaml
│   │   ├── role_binding.yaml
│   │   ├── role.yaml
│   │   └── service_account.yaml
│   └── samples
│       └── view_v1_markdownview.yaml
├── controllers
│   ├── markdownview_controller.go
│   └── suite_test.go
├── Dockerfile
├── go.mod
├── go.sum
├── hack
│   └── boilerplate.go.txt
├── main.go
├── Makefile
├── PROJECT
└── README.md

14 directories, 40 files
```

```
git add .
git commit -m "add api"
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


```console
$ git diff --name-only HEAD^
PROJECT
api/v1/groupversion_info.go
api/v1/markdownview_types.go
api/v1/zz_generated.deepcopy.go
config/crd/kustomization.yaml
config/crd/kustomizeconfig.yaml
config/crd/patches/cainjection_in_markdownviews.yaml
config/crd/patches/webhook_in_markdownviews.yaml
config/rbac/markdownview_editor_role.yaml
config/rbac/markdownview_viewer_role.yaml
config/samples/view_v1_markdownview.yaml
controllers/markdownview_controller.go
controllers/suite_test.go
go.mod
go.sum
main.go
```
```console
$ make manifests
/home/ec2-user/markdown-view/bin/controller-gen rbac:roleName=manager-role crd webhook paths="./..." output:crd:artifacts:config=config/crd/bases
```

```console
$ git st 
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)
        config/crd/bases/
        config/rbac/role.yaml
```
```
git add .
git ci -m "add api manifests"
```

## create  webhook

```console
$ kubebuilder create webhook --group view --version v1 --kind MarkdownView --programmatic-validation --defaulting

$ make manifests
```

