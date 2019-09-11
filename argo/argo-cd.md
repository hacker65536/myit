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


```console
$ argocd app create guestbook \
                                 --repo https://github.com/argoproj/argocd-example-apps.git \
                                 --path guestbook \
                                 --dest-server https://kubernetes.default.svc \
                                 --dest-namespace default
application 'guestbook' created
```

```console
$ argocd app get guestbook
Name:               guestbook
Project:            default
Server:             https://kubernetes.default.svc
Namespace:          default
URL:                https://localhost:8080/applications/guestbook
Repo:               https://github.com/argoproj/argocd-example-apps.git
Target:
Path:               guestbook
Sync Policy:        <none>
Sync Status:        Synced to  (b4ebe00)
Health Status:      Healthy

GROUP  KIND        NAMESPACE  NAME          STATUS  HEALTH   HOOK  MESSAGE
       Service     default    guestbook-ui  Synced  Healthy        service/guestbook-ui unchanged
apps   Deployment  default    guestbook-ui  Synced  Healthy        deployment.apps/guestbook-ui unchanged
```

```console
$ argocd app sync guestbook
TIMESTAMP                  GROUP        KIND   NAMESPACE                  NAME    STATUS   HEALTH        HOOK  MESSAGE
2019-09-11T04:58:08+00:00            Service     default          guestbook-ui    Synced  Healthy
2019-09-11T04:58:08+00:00   apps  Deployment     default          guestbook-ui    Synced  Healthy

Name:               guestbook
Project:            default
Server:             https://kubernetes.default.svc
Namespace:          default
URL:                https://localhost:8080/applications/guestbook
Repo:               https://github.com/argoproj/argocd-example-apps.git
Target:
Path:               guestbook
Sync Policy:        <none>
Sync Status:        Synced to  (b4ebe00)
Health Status:      Healthy

Operation:          Sync
Sync Revision:      b4ebe0049d2ad363760cd2624df36c3b0acaab0e
Phase:              Succeeded
Start:              2019-09-11 04:58:08 +0000 UTC
Finished:           2019-09-11 04:58:09 +0000 UTC
Duration:           1s
Message:            successfully synced (all tasks run)

GROUP  KIND        NAMESPACE  NAME          STATUS  HEALTH   HOOK  MESSAGE
       Service     default    guestbook-ui  Synced  Healthy        service/guestbook-ui unchanged
apps   Deployment  default    guestbook-ui  Synced  Healthy        deployment.apps/guestbook-ui unchanged
````



access to service
--

```console
$ kubectl get svc
NAME           TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
guestbook-ui   ClusterIP   172.20.67.120   <none>        80/TCP    116m
kubernetes     ClusterIP   172.20.0.1      <none>        443/TCP   3h59m
```

```console
$ kubectl get deployments
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
guestbook-ui   1/1     1            1           121m
```

```console
$ kubectl describe deployments guestbook-ui
Name:                   guestbook-ui
Namespace:              default
CreationTimestamp:      Wed, 11 Sep 2019 04:43:51 +0000
Labels:                 app.kubernetes.io/instance=guestbook
Annotations:            deployment.kubernetes.io/revision: 1
                        kubectl.kubernetes.io/last-applied-configuration:
                          {"apiVersion":"apps/v1beta2","kind":"Deployment","metadata":{"annotations":{},"labels":{"app.kubernetes.io/instance":"guestbook"},"name":"...
Selector:               app=guestbook-ui
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=guestbook-ui
  Containers:
   guestbook-ui:
    Image:        gcr.io/heptio-images/ks-guestbook-demo:0.2
    Port:         80/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   guestbook-ui-6f897fc676 (1/1 replicas created)
Events:          <none>
```


```console
$ kubectl get replicasets
NAME                      DESIRED   CURRENT   READY   AGE
guestbook-ui-6f897fc676   1         1         1       113m
```

```console
$ kubectl describe replicasets
Name:           guestbook-ui-6f897fc676
Namespace:      default
Selector:       app=guestbook-ui,pod-template-hash=6f897fc676
Labels:         app=guestbook-ui
                pod-template-hash=6f897fc676
Annotations:    deployment.kubernetes.io/desired-replicas: 1
                deployment.kubernetes.io/max-replicas: 2
                deployment.kubernetes.io/revision: 1
Controlled By:  Deployment/guestbook-ui
Replicas:       1 current / 1 desired
Pods Status:    1 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:  app=guestbook-ui
           pod-template-hash=6f897fc676
  Containers:
   guestbook-ui:
    Image:        gcr.io/heptio-images/ks-guestbook-demo:0.2
    Port:         80/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Events:           <none>
```

```yaml
apiVersion: v1
kind: Service
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"labels":{"app.kubernetes.io/instance":"guestbook"},"name":"guestbook-ui","namespace":"default"},"spec":{"ports":[{"port":80,"targetPort":80}],"selector":{"app":"guestbook-ui"}}}
  creationTimestamp: "2019-09-11T04:43:51Z"
  labels:
    app.kubernetes.io/instance: guestbook
  name: guestbook-ui
  namespace: default
  resourceVersion: "22142"
  selfLink: /api/v1/namespaces/default/services/guestbook-ui
  uid: c0b7180f-d44e-11e9-9902-125241bd54aa
spec:
  clusterIP: 172.20.67.120
  externalTrafficPolicy: Cluster
  ports:
  - nodePort: 30975
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: guestbook-ui
  sessionAffinity: None
  type: ClusterIP
status:
  loadBalancer:{}
```

`type: ClusterIP` => `type:LoadBalancer`


```console
kubectl get svc
NAME           TYPE           CLUSTER-IP      EXTERNAL-IP                                                               PORT(S)        AGE
guestbook-ui   LoadBalancer   172.20.67.120   ac0b7180fd44e11e99902125241bd54a-1928627073.us-east-1.elb.amazonaws.com   80:30975/TCP   148m
kubernetes     ClusterIP      172.20.0.1      <none>                                                                    443/TCP        4h30m
```
