https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough


```console
$ az group create --name myResourceGroup --location eastus
{
  "id": "/subscriptions/739a0b35-9148-4601-980c-50e06bda14b5/resourceGroups/myResourceGroup",
  "location": "eastus",
  "managedBy": null,
  "name": "myResourceGroup",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": null
}
```


```console
$ az aks create \
    --resource-group myResourceGroup \
    --name myAKSCluster \
    --node-count 1 \
    --enable-addons monitoring \
    --generate-ssh-keys
```
wait for 5-10 minutes

```
Finished service principal creation[##################################]  100.0000%
{
  "aadProfile": null,
  "addonProfiles": {
    "omsagent": {
      "config": {
        "logAnalyticsWorkspaceResourceID": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/defaultresourcegroup-eus/providers/microsoft.operationalinsights/workspaces/defaultworkspace-00000000-0000-0000-0000-000000000000-eus"
      },
      "enabled": true
    }
  },
  "agentPoolProfiles": [
    {
      "count": 1,
      "maxPods": 110,
      "name": "nodepool1",
      "osDiskSizeGb": 30,
      "osType": "Linux",
      "storageProfile": "ManagedDisks",
      "vmSize": "Standard_DS2_v2",
      "vnetSubnetId": null
    }
  ],
  "dnsPrefix": "myAKSClust-myResourceGroup-739a0b",
  "enableRbac": true,
  "fqdn": "myaksclust-myresourcegroup-739a0b-495b231e.hcp.eastus.azmk8s.io",
  "id": "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/myResourceGroup/providers/Microsoft.ContainerService/managedClusters/myAKSCluster",
  "kubernetesVersion": "1.11.8",
  "linuxProfile": {
    "adminUsername": "azureuser",
    "ssh": {
      "publicKeys": [
        {
          "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAAD...."
        }
      ]
    }
  },
  "location": "eastus",
  "name": "myAKSCluster",
  "networkProfile": {
    "dnsServiceIp": "10.0.0.10",
    "dockerBridgeCidr": "172.17.0.1/16",
    "networkPlugin": "kubenet",
    "networkPolicy": null,
    "podCidr": "10.244.0.0/16",
    "serviceCidr": "10.0.0.0/16"
  },
  "nodeResourceGroup": "MC_myResourceGroup_myAKSCluster_eastus",
  "provisioningState": "Succeeded",
  "resourceGroup": "myResourceGroup",
  "servicePrincipalProfile": {
    "clientId": "eccb9689-bb38-4247-92be-3dcf0556ab3d",
    "secret": null
  },
  "tags": null,
  "type": "Microsoft.ContainerService/ManagedClusters"
}
```

```console
$ az resource list | jq -rc '.[]|[.type,.name]'
["Microsoft.Storage/storageAccounts","cs1739a0b359148x4601x980"]
["Microsoft.OperationalInsights/workspaces","DefaultWorkspace-739a0b35-9148-4601-980c-50e06bda14b5-EUS"]
["Microsoft.OperationsManagement/solutions","ContainerInsights(defaultworkspace-739a0b35-9148-4601-980c-50e06bda14b5-eus)"]
["Microsoft.Compute/availabilitySets","nodepool1-availabilitySet-11204770"]
["Microsoft.Compute/disks","aks-nodepool1-11204770-0_OsDisk_1_22a953dcb73c458996f2104cc8995f0b"]
["Microsoft.Compute/virtualMachines","aks-nodepool1-11204770-0"]
["Microsoft.Compute/virtualMachines/extensions","aks-nodepool1-11204770-0/computeAksLinuxBilling"]
["Microsoft.Compute/virtualMachines/extensions","aks-nodepool1-11204770-0/cse-agent-0"]
["Microsoft.Network/networkInterfaces","aks-nodepool1-11204770-nic-0"]
["Microsoft.Network/networkSecurityGroups","aks-agentpool-11204770-nsg"]
["Microsoft.Network/routeTables","aks-agentpool-11204770-routetable"]
["Microsoft.Network/virtualNetworks","aks-vnet-11204770"]
["Microsoft.ContainerService/managedClusters","myAKSCluster"]
["Microsoft.Network/networkWatchers","NetworkWatcher_eastus"]
```

https://docs.microsoft.com/en-us/cli/azure/aks?view=azure-cli-latest#az-aks-install-cli

```console
$ az aks install-cli
Downloading client to "/usr/local/bin/kubectl" from "https://storage.googleapis.com/kubernetes-release/release/v1.13.4/bin/linux/amd64/kubectl"
Connection error while attempting to download client ([Errno 13] Permission denied: '/usr/local/bin/kubectl')
```

```console
$ sudo az aks install-cli
Downloading client to "/usr/local/bin/kubectl" from "https://storage.googleapis.com/kubernetes-release/release/v1.13.4/bin/linux/amd64/kubectl"
Please ensure that /usr/local/bin is in your search PATH, so the `kubectl` command can be found.
```

```console
$ /usr/local/bin/kubectl version --short --client
Client Version: v1.13.4
```


```console
$ alias k=/usr/local/bin/kubectl
$ k version --short --client
Client Version: v1.13.4
```

```console
$ k get nodes
The connection to the server localhost:8080 was refused - did you specify the right host or port?
```
```console
$ az aks get-credentials --resource-group myResourceGroup --name myAKSCluster
Merged "myAKSCluster" as current context in /home/ec2-user/.kube/config
```
```console
$ cat /home/ec2-user/.kube/config
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tL...
    server: https://myaksclust-myresourcegroup-739a0b-495b231e.hcp.eastus.azmk8s.io:443
  name: myAKSCluster
contexts:
- context:
    cluster: myAKSCluster
    user: clusterUser_myResourceGroup_myAKSCluster
  name: myAKSCluster
current-context: myAKSCluster
kind: Config
preferences: {}
users:
- name: clusterUser_myResourceGroup_myAKSCluster
  user:
    client-certificate-data: LS0tLS1CRUdJTi...
    client-key-data: LS0tLS1CRUdJTi...
    token: d633...
```    
