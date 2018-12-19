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
