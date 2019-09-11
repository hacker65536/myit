# Argo CD

Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes.

https://argoproj.github.io/argo-cd/



getting started
--

https://argoproj.github.io/argo-cd/getting_started/


```console
$ kubectl version --short 
Client Version: v1.13.8-eks-cd3eb0
Server Version: v1.13.10-eks-5ac0f1
```

```console
$ kubectl get svc        
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   172.20.0.1   <none>        443/TCP   32m
```


### install Argo CD

```console
$ kubectl create namespace argocd
namespace/argocd created
```

```console
$ kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml 
customresourcedefinition.apiextensions.k8s.io/applications.argoproj.io created
customresourcedefinition.apiextensions.k8s.io/appprojects.argoproj.io created
serviceaccount/argocd-application-controller created
serviceaccount/argocd-dex-server created
serviceaccount/argocd-server created
role.rbac.authorization.k8s.io/argocd-application-controller created
role.rbac.authorization.k8s.io/argocd-dex-server created
role.rbac.authorization.k8s.io/argocd-server created
clusterrole.rbac.authorization.k8s.io/argocd-application-controller created
clusterrole.rbac.authorization.k8s.io/argocd-server created
rolebinding.rbac.authorization.k8s.io/argocd-application-controller created
rolebinding.rbac.authorization.k8s.io/argocd-dex-server created
rolebinding.rbac.authorization.k8s.io/argocd-server created
clusterrolebinding.rbac.authorization.k8s.io/argocd-application-controller created
clusterrolebinding.rbac.authorization.k8s.io/argocd-server created
configmap/argocd-cm created
configmap/argocd-rbac-cm created
configmap/argocd-ssh-known-hosts-cm created
configmap/argocd-tls-certs-cm created
secret/argocd-secret created
service/argocd-dex-server created
service/argocd-metrics created
service/argocd-redis created
service/argocd-repo-server created
service/argocd-server-metrics created
service/argocd-server created
deployment.apps/argocd-application-controller created
deployment.apps/argocd-dex-server created
deployment.apps/argocd-redis created
deployment.apps/argocd-repo-server created
deployment.apps/argocd-server created
```

```console
$ kubectl get ns          
NAME          STATUS   AGE
argocd        Active   2m53s
default       Active   35m
kube-public   Active   35m
kube-system   Active   35m
```
```console
$ kubectl -n argocd get svc
NAME                    TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)             AGE
argocd-dex-server       ClusterIP   172.20.43.116    <none>        5556/TCP,5557/TCP   5m42s
argocd-metrics          ClusterIP   172.20.89.186    <none>        8082/TCP            5m42s
argocd-redis            ClusterIP   172.20.107.6     <none>        6379/TCP            5m42s
argocd-repo-server      ClusterIP   172.20.144.180   <none>        8081/TCP,8084/TCP   5m42s
argocd-server           ClusterIP   172.20.105.58    <none>        80/TCP,443/TCP      5m42s
argocd-server-metrics   ClusterIP   172.20.28.57     <none>        8083/TCP            5m42s
```

### download argo cd cli

```console
$ sudo wget -O argocd https://github.com/argoproj/argo-cd/releases/download/v1.2.0/argocd-linux-amd64
$ sudo chmod +x argocd
$ sudo mv argocd /usr/local/bin/
```

### Access The Argo CD API Server

```console
$ kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
service/argocd-server patched
```

```console
$ kubectl port-forward svc/argocd-server -n argocd --address 0.0.0.0 8080:443
```



get password
```console
$ kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
```

```console
$ argocd login localhost:8080
WARNING: server certificate had error: x509: certificate signed by unknown authority. Proceed insecurely (y/n)? y
Username: admin
Password:
'admin' logged in successfully
Context 'localhost:8080' updated
```

list  clusters contexts
```console
$ argocd cluster add

ERRO[0000] Choose a context name from:
CURRENT  NAME                                                                                     CLUSTER                                                                                  SERVER
*        arn:aws:eks:us-east-1:000000000000:cluster/cluster-00000000-a069-4a06-b6b1-3b0058a43c9f  arn:aws:eks:us-east-1:000000000000:cluster/cluster-00000000-a069-4a06-b6b1-3b0058a43c9f  https://00000000619292BC791E2189F0F007.sk1.us-east-1.eks.amazonaws.com
````
choose a context name from the list and supply it to `argocd cluster add CONTEXTNAME`
```console
$ argocd cluster add arn:aws:eks:us-east-1:000000000000:cluster/cluster-00000000-a069-4a06-b6b1-3b0058a43c9f
INFO[0000] ServiceAccount "argocd-manager" created in namespace "kube-system"
INFO[0000] ClusterRole "argocd-manager-role" created
INFO[0000] ClusterRoleBinding "argocd-manager-role-binding" created, bound "argocd-manager" to "argocd-manager-role"
Cluster 'arn:aws:eks:us-east-1:000000000000:cluster/cluster-00000000-a069-4a06-b6b1-3b0058a43c9f' added
```
