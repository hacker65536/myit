
```
gcloud beta container --project "gke-pj-test" clusters create "cluster-2" \
--zone "us-central1-a" \
--username="admin" \
--cluster-version "1.7.8-gke.0" \
--machine-type "n1-standard-2" \
--image-type "COS" \
--disk-size "100" \
--scopes "https://www.googleapis.com/auth/compute",\
"https://www.googleapis.com/auth/devstorage.read_only",\
"https://www.googleapis.com/auth/logging.write",\
"https://www.googleapis.com/auth/monitoring",\
"https://www.googleapis.com/auth/servicecontrol",\
"https://www.googleapis.com/auth/service.management.readonly",\
"https://www.googleapis.com/auth/trace.append" \
--num-nodes "2" \
--network "default" \
--enable-cloud-logging \
--enable-cloud-monitoring \
--subnetwork "default" \
--enable-legacy-authorization
```

too early
```
Welcome to Cloud Shell! Type "help" to get started.
myname@gke-pj-test:~$ gcloud container clusters get-credentials cluster-2 --zone us-central1-a --project gke-pj-test
Fetching cluster endpoint and auth data.
WARNING: cluster cluster-1 is not running. The kubernetes API may not be available.
```

success
```
kubeconfig entry generated for cluster-1.
myname@gke-pj-test:~$ gcloud container clusters get-credentials cluster-2 --zone us-central1-a --project gke-pj-test
Fetching cluster endpoint and auth data.
kubeconfig entry generated for cluster-1.
myname@gke-pj-test:~$
```

run pods
```
$ kubectl run nginx --image=nginx --replicas=3
deployment "nginx" created
```

show pods
```
$ kubectl get pods -owide
NAME                     READY     STATUS    RESTARTS   AGE       IP         NODE
nginx-4217019353-313c7   1/1       Running   0          58s       10.8.0.6   gke-cluster-1-default-pool-7aff4635-hfl3
nginx-4217019353-rjw2f   1/1       Running   0          58s       10.8.1.8   gke-cluster-1-default-pool-7aff4635-lq0q
nginx-4217019353-tl36v   1/1       Running   0          58s       10.8.0.5   gke-cluster-1-default-pool-7aff4635-hfl3
```


expose 
```
$ kubectl expose deployment nginx --port=80 --target-port=80 --type=LoadBalancer
service "nginx" exposed
```

```
$ kubectl get service nginx
NAME      TYPE           CLUSTER-IP      EXTERNAL-IP      PORT(S)        AGE
nginx     LoadBalancer   10.11.254.177   xxx.xxx.xxx.xxx   80:30828/TCP   49s
```

```
$ kubectl describe services nginx
Name:                     nginx
Namespace:                default
Labels:                   run=nginx
Annotations:              <none>
Selector:                 run=nginx
Type:                     LoadBalancer
IP:                       10.11.254.177
LoadBalancer Ingress:     xxx.xxx.xxx.xxx
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30828/TCP
Endpoints:                10.8.0.5:80,10.8.0.6:80,10.8.1.8:80
Session Affinity:         None
External Traffic Policy:  Cluster
Events:
  Type    Reason                Age   From                Message
  ----    ------                ----  ----                -------
  Normal  CreatingLoadBalancer  4m    service-controller  Creating load balancer
  Normal  CreatedLoadBalancer   4m    service-controller  Created load balancer
  ```
