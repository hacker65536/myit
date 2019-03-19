
```consoole
$ gcloud config set compute/zone us-west1-a
Updated property [compute/zone].
```

```console
$ gcloud container clusters create kuar-cluster
WARNING: Starting in 1.12, new clusters will have basic authentication disabled by default. Basic authentication can be enabled (or disabled) manually using the `--[no-]enable-basic-auth` flag.
WARNING: Starting in 1.12, new clusters will not have a client certificate issued. You can manually enable (or disable) the issuance of the client certificate using the `--[no-]issue-client-certificate` flag.
WARNING: Currently VPC-native is not the default mode during cluster creation. In the future, this will become the default mode and can be disabled using `--no-enable-ip-alias` flag. Use `--[no-]enable-ip-alias` flag to suppress this warning.
WARNING: Starting in 1.12, default node pools in new clusters will have their legacy Compute Engine instance metadata endpoints disabled by default. To create a cluster with legacy instance metadata endpoints disabled in the default node pool, run `clusters create` with the flag `--metadata disable-legacy-endpoints=true`.
This will enable the autorepair feature for nodes. Please see https://cloud.google.com/kubernetes-engine/docs/node-auto-repair for more information on node autorepairs.
WARNING: Starting in Kubernetes v1.10, new clusters will no longer get compute-rw and storage-ro scopes added to what is specified in --scopes (though the latter will remain included in the default --scopes). To use these scopes, add them explicitly to --scopes. To use the new behavior, set container/new_scopes_behavior property (gcloud config set container/new_scopes_behavior true).
Creating cluster kuar-cluster in us-west1-a... Cluster is being health-checked (master is healthy)...done.
Created [https://container.googleapis.com/v1/projects/melodic-bazaar-217502/zones/us-west1-a/clusters/kuar-cluster].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/us-west1-a/kuar-cluster?project=melodic-bazaar-217502
kubeconfig entry generated for kuar-cluster.
NAME          LOCATION    MASTER_VERSION  MASTER_IP      MACHINE_TYPE   NODE_VERSION  NUM_NODES  STATUS
kuar-cluster  us-west1-a  1.11.7-gke.4    35.203.184.92  n1-standard-1  1.11.7-gke.4  3          RUNNING
```

```console
$ kubectl version
Client Version: version.Info{Major:"1", Minor:"11", GitVersion:"v1.11.7", GitCommit:"65ecaf0671341311ce6aea0edab46ee69f6
5d59e", GitTreeState:"clean", BuildDate:"2019-01-24T19:32:00Z", GoVersion:"go1.10.7", Compiler:"gc", Platform:"linux/amd
64"}
Server Version: version.Info{Major:"1", Minor:"11+", GitVersion:"v1.11.7-gke.4", GitCommit:"618716cbb236fb7ca9cabd822b59
47e298ad09f7", GitTreeState:"clean", BuildDate:"2019-02-05T19:22:29Z", GoVersion:"go1.10.7b4", Compiler:"gc", Platform:"
linux/amd64"}
```
