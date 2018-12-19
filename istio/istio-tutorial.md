# istio tutorial

https://cloud.google.com/kubernetes-engine/docs/tutorials/installing-istio

## env

```
$ gcloud config list
[component_manager]
disable_update_check = True
[compute]
gce_metadata_read_timeout_sec = 5
zone = us-central1-b
[core]
account = xxxx@gmail.com
disable_usage_reporting = False
project = test-project-xxxxx
[metrics]
environment = devshell

Your active configuration is: [cloudshell-19337]
```
```
$ gcloud container clusters create istio-tutorial \
>     --machine-type=n1-standard-2 \
>     --num-nodes=4 \
>     --no-enable-legacy-authorization
WARNING: Starting in 1.12, new clusters will have basic authentication disabled by default. Basic authentication can be enabled (or disabled) manually using the `--[no-]enable-basic-auth` flag.
WARNING: Starting in 1.12, new clusters will not have a client certificate issued. You can manually enable (or disable) the issuance of the client certificate using the `--[no-]issue-client-certificate` flag.
WARNING: Currently VPC-native is not the default mode during cluster creation. In the future, this will become the default mode and can be disabled using `--no-enable-ip-alias` flag. Use `--[no-]enable-ip-alias` flag to suppress this warning.
WARNING: Starting in 1.12, default node pools in new clusters will have their legacy Compute Engine instance metadata endpoints disabled by default. To create a cluster with legacy instance metadata endpoints disabled in the default node pool, run `clusters create` with the flag `--metadata disable-legacy-endpoints=true`.
This will enable the autorepair feature for nodes. Please see https://cloud.google.com/kubernetes-engine/docs/node-auto-repair for more information on node autorepairs.
WARNING: Starting in Kubernetes v1.10, new clusters will no longer get compute-rw and storage-ro scopes added to what is specified in --scopes (though the latter will remain included in the default --scopes). To use these scopes, add them explicitly to --scopes. To use the new behavior, set container/new_scopes_behavior property (gcloud config set container/new_scopes_behavior true).
Creating cluster istio-tutorial in us-central1-b...done.
Created [https://container.googleapis.com/v1/projects/infra-test-145407/zones/us-central1-b/clusters/istio-tutorial].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/us-central1-b/istio-tutorial?project=infra-test-145407
kubeconfig entry generated for istio-tutorial.
NAME            LOCATION       MASTER_VERSION  MASTER_IP      MACHINE_TYPE   NODE_VERSION  NUM_NODES  STATUS
istio-tutorial  us-central1-b  1.10.9-gke.5    35.184.229.17  n1-standard-2  1.10.9-gke.5  4          RUNNING
```


```
$ kubectl create clusterrolebinding cluster-admin-binding \
>   --clusterrole=cluster-admin \
>   --user="$(gcloud config get-value core/account)"
Your active configuration is: [cloudshell-19337]
clusterrolebinding.rbac.authorization.k8s.io "cluster-admin-binding" created
```

install istio
```
$ wget https://github.com/istio/istio/releases/download/1.0.5/istio-1.0.5-linux.tar.gz
$ tar zxvf !$:t
$ cd istio-1.0.5/
$ export PATH=$PWD/bin:$PATH
$ kubectl apply -f install/kubernetes/istio-demo-auth.yaml
namespace "istio-system" created
configmap "istio-galley-configuration" created
configmap "istio-grafana-custom-resources" created
configmap "istio-grafana-configuration-dashboards" created
configmap "istio-grafana" created
configmap "istio-statsd-prom-bridge" created
configmap "prometheus" created
configmap "istio-security-custom-resources" created
configmap "istio" created
configmap "istio-sidecar-injector" created
serviceaccount "istio-galley-service-account" created
serviceaccount "istio-egressgateway-service-account" created
serviceaccount "istio-ingressgateway-service-account" created
serviceaccount "istio-grafana-post-install-account" created
clusterrole.rbac.authorization.k8s.io "istio-grafana-post-install-istio-system" created
clusterrolebinding.rbac.authorization.k8s.io "istio-grafana-post-install-role-binding-istio-system" created
job.batch "istio-grafana-post-install" created
serviceaccount "istio-mixer-service-account" created
serviceaccount "istio-pilot-service-account" created
serviceaccount "prometheus" created
serviceaccount "istio-cleanup-secrets-service-account" created
clusterrole.rbac.authorization.k8s.io "istio-cleanup-secrets-istio-system" created
clusterrolebinding.rbac.authorization.k8s.io "istio-cleanup-secrets-istio-system" created
job.batch "istio-cleanup-secrets" created
serviceaccount "istio-security-post-install-account" created
clusterrole.rbac.authorization.k8s.io "istio-security-post-install-istio-system" created
clusterrolebinding.rbac.authorization.k8s.io "istio-security-post-install-role-binding-istio-system" created
job.batch "istio-security-post-install" created
serviceaccount "istio-citadel-service-account" created
serviceaccount "istio-sidecar-injector-service-account" created
customresourcedefinition.apiextensions.k8s.io "virtualservices.networking.istio.io" created
customresourcedefinition.apiextensions.k8s.io "destinationrules.networking.istio.io" created
customresourcedefinition.apiextensions.k8s.io "serviceentries.networking.istio.io" created
customresourcedefinition.apiextensions.k8s.io "gateways.networking.istio.io" created
customresourcedefinition.apiextensions.k8s.io "envoyfilters.networking.istio.io" created
customresourcedefinition.apiextensions.k8s.io "httpapispecbindings.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "httpapispecs.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "quotaspecbindings.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "quotaspecs.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "rules.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "attributemanifests.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "bypasses.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "circonuses.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "deniers.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "fluentds.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "kubernetesenvs.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "listcheckers.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "memquotas.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "noops.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "opas.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "prometheuses.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "rbacs.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "redisquotas.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "servicecontrols.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "signalfxs.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "solarwindses.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "stackdrivers.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "statsds.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "stdios.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "apikeys.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "authorizations.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "checknothings.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "kuberneteses.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "listentries.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "logentries.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "edges.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "metrics.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "quotas.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "reportnothings.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "servicecontrolreports.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "tracespans.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "rbacconfigs.rbac.istio.io" created
customresourcedefinition.apiextensions.k8s.io "serviceroles.rbac.istio.io" created
customresourcedefinition.apiextensions.k8s.io "servicerolebindings.rbac.istio.io" created
customresourcedefinition.apiextensions.k8s.io "adapters.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "instances.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "templates.config.istio.io" created
customresourcedefinition.apiextensions.k8s.io "handlers.config.istio.io" created
clusterrole.rbac.authorization.k8s.io "istio-galley-istio-system" created
clusterrole.rbac.authorization.k8s.io "istio-egressgateway-istio-system" created
clusterrole.rbac.authorization.k8s.io "istio-ingressgateway-istio-system" created
clusterrole.rbac.authorization.k8s.io "istio-mixer-istio-system" created
clusterrole.rbac.authorization.k8s.io "istio-pilot-istio-system" created
clusterrole.rbac.authorization.k8s.io "prometheus-istio-system" created
clusterrole.rbac.authorization.k8s.io "istio-citadel-istio-system" created
clusterrole.rbac.authorization.k8s.io "istio-sidecar-injector-istio-system" created
clusterrolebinding.rbac.authorization.k8s.io "istio-galley-admin-role-binding-istio-system" created
clusterrolebinding.rbac.authorization.k8s.io "istio-egressgateway-istio-system" created
clusterrolebinding.rbac.authorization.k8s.io "istio-ingressgateway-istio-system" created
clusterrolebinding.rbac.authorization.k8s.io "istio-mixer-admin-role-binding-istio-system" created
clusterrolebinding.rbac.authorization.k8s.io "istio-pilot-istio-system" created
clusterrolebinding.rbac.authorization.k8s.io "prometheus-istio-system" created
clusterrolebinding.rbac.authorization.k8s.io "istio-citadel-istio-system" created
clusterrolebinding.rbac.authorization.k8s.io "istio-sidecar-injector-admin-role-binding-istio-system" created
service "istio-galley" created
service "istio-egressgateway" created
service "istio-ingressgateway" created
service "grafana" created
service "istio-policy" created
service "istio-telemetry" created
service "istio-pilot" created
service "prometheus" created
service "istio-citadel" created
service "servicegraph" created
service "istio-sidecar-injector" created
deployment.extensions "istio-galley" created
deployment.extensions "istio-egressgateway" created
deployment.extensions "istio-ingressgateway" created
deployment.extensions "grafana" created
deployment.extensions "istio-policy" created
deployment.extensions "istio-telemetry" created
deployment.extensions "istio-pilot" created
deployment.extensions "prometheus" created
deployment.extensions "istio-citadel" created
deployment.extensions "servicegraph" created
deployment.extensions "istio-sidecar-injector" created
deployment.extensions "istio-tracing" created
gateway.networking.istio.io "istio-autogenerated-k8s-ingress" created
horizontalpodautoscaler.autoscaling "istio-egressgateway" created
horizontalpodautoscaler.autoscaling "istio-ingressgateway" created
horizontalpodautoscaler.autoscaling "istio-policy" created
horizontalpodautoscaler.autoscaling "istio-telemetry" created
horizontalpodautoscaler.autoscaling "istio-pilot" created
service "jaeger-query" created
service "jaeger-collector" created
service "jaeger-agent" created
service "zipkin" created
service "tracing" created
mutatingwebhookconfiguration.admissionregistration.k8s.io "istio-sidecar-injector" created
attributemanifest.config.istio.io "istioproxy" created
attributemanifest.config.istio.io "kubernetes" created
stdio.config.istio.io "handler" created
logentry.config.istio.io "accesslog" created
logentry.config.istio.io "tcpaccesslog" created
rule.config.istio.io "stdio" created
rule.config.istio.io "stdiotcp" created
metric.config.istio.io "requestcount" created
metric.config.istio.io "requestduration" created
metric.config.istio.io "requestsize" created
metric.config.istio.io "responsesize" created
metric.config.istio.io "tcpbytesent" created
metric.config.istio.io "tcpbytereceived" created
prometheus.config.istio.io "handler" created
rule.config.istio.io "promhttp" created
rule.config.istio.io "promtcp" created
kubernetesenv.config.istio.io "handler" created
rule.config.istio.io "kubeattrgenrulerule" created
rule.config.istio.io "tcpkubeattrgenrulerule" created
kubernetes.config.istio.io "attributes" created
destinationrule.networking.istio.io "istio-policy" created
destinationrule.networking.istio.io "istio-telemetry" created
```
```
$ kubectl get service -n istio-system
NAME                     TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)                                                                                                                   AGE
grafana                  ClusterIP      10.19.240.153   <none>          3000/TCP                                                                                                                  3m
istio-citadel            ClusterIP      10.19.240.99    <none>          8060/TCP,9093/TCP                                                                                                         3m
istio-egressgateway      ClusterIP      10.19.243.15    <none>          80/TCP,443/TCP                                                                                                            3m
istio-galley             ClusterIP      10.19.253.132   <none>          443/TCP,9093/TCP                                                                                                          3m
istio-ingressgateway     LoadBalancer   10.19.255.206   35.225.94.105   80:31380/TCP,443:31390/TCP,31400:31400/TCP,15011:31944/TCP,8060:30472/TCP,853:31734/TCP,15030:31039/TCP,15031:32683/TCP   3m
istio-pilot              ClusterIP      10.19.252.127   <none>          15010/TCP,15011/TCP,8080/TCP,9093/TCP                                                                                     3m
istio-policy             ClusterIP      10.19.244.192   <none>          9091/TCP,15004/TCP,9093/TCP                                                                                               3m
istio-sidecar-injector   ClusterIP      10.19.251.104   <none>          443/TCP                                                                                                                   3m
istio-telemetry          ClusterIP      10.19.252.84    <none>          9091/TCP,15004/TCP,9093/TCP,42422/TCP                                                                                     3m
jaeger-agent             ClusterIP      None            <none>          5775/UDP,6831/UDP,6832/UDP                                                                                                2m
jaeger-collector         ClusterIP      10.19.248.198   <none>          14267/TCP,14268/TCP                                                                                                       2m
jaeger-query             ClusterIP      10.19.241.142   <none>          16686/TCP                                                                                                                 2m
prometheus               ClusterIP      10.19.252.43    <none>          9090/TCP                                                                                                                  3m
servicegraph             ClusterIP      10.19.251.41    <none>          8088/TCP                                                                                                                  3m
tracing                  ClusterIP      10.19.251.246   <none>          80/TCP                                                                                                                    2m
zipkin                   ClusterIP      10.19.243.95    <none>          9411/TCP                                                                                                                  2m
```

```
$ kubectl get pods -n istio-system
NAME                                      READY     STATUS      RESTARTS   AGE
grafana-774bf8cb47-k97k2                  1/1       Running     0          3m
istio-citadel-cb5b884db-bhszq             1/1       Running     0          3m
istio-cleanup-secrets-6dtvp               0/1       Completed   0          4m
istio-egressgateway-7bbd674db4-jxkrb      1/1       Running     0          4m
istio-galley-5b494c7f5-mt7d5              1/1       Running     0          4m
istio-grafana-post-install-vcxtk          0/1       Completed   2          4m
istio-ingressgateway-5bf6c54577-jpchf     1/1       Running     0          3m
istio-pilot-76c4dd545b-zbqpm              2/2       Running     0          3m
istio-policy-5455647857-bs2bp             2/2       Running     0          3m
istio-security-post-install-d2jd6         0/1       Completed   2          4m
istio-sidecar-injector-7f4c7db98c-v9fbl   1/1       Running     0          3m
istio-telemetry-74645487c9-99f2z          2/2       Running     0          3m
istio-tracing-ff94688bb-dmrzd             1/1       Running     0          3m
prometheus-f556886b8-2lxdk                1/1       Running     0          3m
servicegraph-b5cb7dcdd-vqhcj              1/1       Running     0          3m
```
