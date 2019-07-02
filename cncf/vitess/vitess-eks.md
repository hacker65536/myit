# vitess on eks


1. create eks from eksctl

2. install helm

3. install ectd

4. install vitess from helm


```console
$ helm install ../../helm/vitess/ -f 101_initial_cluster.yaml                                                     
NAME:   wondering-chinchilla
LAST DEPLOYED: Tue Jul  2 08:47:51 2019
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/ConfigMap
NAME       DATA  AGE
vitess-cm  8     1s

==> v1/Job
NAME                                COMPLETIONS  DURATION  AGE
commerce-apply-schema-initial       0/1          1s        1s
commerce-apply-vschema-initial      0/1          1s        1s
zone1-commerce-0-init-shard-master  0/1          1s        1s

==> v1/Pod(related)
NAME                                      READY  STATUS             RESTARTS  AGE
commerce-apply-schema-initial-8g24f       0/1    ContainerCreating  0         1s
commerce-apply-vschema-initial-vnrr9      0/1    ContainerCreating  0         1s
vtctld-5dc4466d88-5zkrs                   0/1    ContainerCreating  0         1s
vtgate-zone1-9c8589688-wxkt8              0/1    ContainerCreating  0         1s
zone1-commerce-0-init-shard-master-xbfld  0/1    ContainerCreating  0         1s
zone1-commerce-0-rdonly-0                 0/6    Pending            0         1s
zone1-commerce-0-replica-0                0/6    Pending            0         1s
zone1-commerce-0-replica-1                0/6    Pending            0         1s

==> v1/Service
NAME          TYPE       CLUSTER-IP      EXTERNAL-IP  PORT(S)                                         AGE
vtctld        NodePort   10.100.211.135  <none>       15000:31047/TCP,15999:30504/TCP                 1s
vtgate-zone1  NodePort   10.100.67.240   <none>       15001:30347/TCP,15991:30555/TCP,3306:30260/TCP  1s
vttablet      ClusterIP  None            <none>       15002/TCP,16002/TCP                             1s

==> v1beta1/Deployment
NAME          READY  UP-TO-DATE  AVAILABLE  AGE
vtctld        0/1    1           0          1s
vtgate-zone1  0/1    1           0          1s

==> v1beta1/PodDisruptionBudget
NAME                      MIN AVAILABLE  MAX UNAVAILABLE  ALLOWED DISRUPTIONS  AGE
vtgate-zone1              N/A            1                0                    1s
zone1-commerce-0-rdonly   N/A            1                0                    1s
zone1-commerce-0-replica  N/A            1                0                    1s

==> v1beta1/StatefulSet
NAME                      READY  AGE
zone1-commerce-0-rdonly   0/1    1s
zone1-commerce-0-replica  0/2    1s

==> v1beta2/EtcdCluster
NAME         AGE
etcd-global  1s
etcd-zone1   1s


NOTES:
Release name: wondering-chinchilla

To access administrative web pages, start a proxy with:
  kubectl proxy --port=8001

Then use the following URLs:

      vtctld: http://localhost:8001/api/v1/namespaces/default/services/vtctld:web/proxy/app/
      vtgate: http://localhost:8001/api/v1/namespaces/default/services/vtgate-zone1:web/proxy/
```
