
https://docs.helm.sh/using_helm/#installing-helm

```
$ wget https://storage.googleapis.com/kubernetes-helm/helm-v2.12.3-linux-amd64.tar.gz
$ tar zxvf helm-v2.12.3-linux-amd64.tar.gz
$ sudo mv linux-amd64/helm /usr/local/bin/helm
```

```
$ helm version
Client: &version.Version{SemVer:"v2.12.3", GitCommit:"eecf22f77df5f65c823aacd2dbd30ae6c65f186e", GitTreeState:"clean"}
Error: could not find tiller
```

```
$ helm init
Creating /home/shacker/.helm
Creating /home/shacker/.helm/repository
Creating /home/shacker/.helm/repository/cache
Creating /home/shacker/.helm/repository/local
Creating /home/shacker/.helm/plugins
Creating /home/shacker/.helm/starters
Creating /home/shacker/.helm/cache/archive
Creating /home/shacker/.helm/repository/repositories.yaml
Adding stable repo with URL: https://kubernetes-charts.storage.googleapis.com
Adding local repo with URL: http://127.0.0.1:8879/charts
$HELM_HOME has been configured at /home/shacker/.helm.

Tiller (the Helm server-side component) has been installed into your Kubernetes Cluster.

Please note: by default, Tiller is deployed with an insecure 'allow unauthenticated users' policy.
To prevent this, run `helm init` with the --tiller-tls-verify flag.
For more information on securing your installation see: https://docs.helm.sh/using_helm/#securing-your-helm-installation
Happy Helming!
```
