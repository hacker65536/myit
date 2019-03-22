https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-yum?view=azure-cli-latest


install
--
```console
$ sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
```
```console
$ sudo sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
```
```console
$ sudo yum install azure-cli
```

```
--snip--
Dependencies Resolved

====================================================================================================
 Package                Arch                Version                    Repository              Size
====================================================================================================
Installing:
 azure-cli              x86_64              2.0.60-1.el7               azure-cli               29 M

Transaction Summary
====================================================================================================
Install  1 Package

Total download size: 29 M
Installed size: 205 M
Is this ok [y/d/N]:
```

```console
$ az

Welcome to Azure CLI!
---------------------
Use `az -h` to see available commands or go to https://aka.ms/cli.

Telemetry
---------
The Azure CLI collects usage data in order to improve your experience.
The data is anonymous and does not include commandline argument values.
The data is collected by Microsoft.

You can change your telemetry settings with `az configure`.


     /\
    /  \    _____   _ _  ___ _
   / /\ \  |_  / | | | \'__/ _\
  / ____ \  / /| |_| | | |  __/
 /_/    \_\/___|\__,_|_|  \___|


Welcome to the cool new Azure CLI!

Use `az --version` to display the current version.
Here are the base commands:

    account           : Manage Azure subscription information.
    acr               : Manage private registries with Azure Container Registries.
    acs               : Manage Azure Container Services.
    ad                : Manage Azure Active Directory Graph entities needed for Role Based Access
                       Control.
    advisor           : Manage Azure Advisor.
    aks               : Manage Azure Kubernetes Services.
    ams               : Manage Azure Media Services resources.
    appservice        : Manage App Service plans.
    backup            : Manage Azure Backups.
    batch             : Manage Azure Batch.
    batchai           : Manage Batch AI resources.
    billing           : Manage Azure Billing.
    bot               : Manage Microsoft Bot Services.
    cdn               : Manage Azure Content Delivery Networks (CDNs).
    cloud             : Manage registered Azure clouds.
    cognitiveservices : Manage Azure Cognitive Services accounts.
    configure         : Manage Azure CLI configuration. This command is interactive.
    consumption       : Manage consumption of Azure resources.
    container         : Manage Azure Container Instances.
    cosmosdb          : Manage Azure Cosmos DB database accounts.
    deployment        : Manage Azure Resource Manager deployments at subscription scope.
    disk              : Manage Azure Managed Disks.
    dla               : (PREVIEW) Manage Data Lake Analytics accounts, jobs, and catalogs.
    dls               : (PREVIEW) Manage Data Lake Store accounts and filesystems.
    dms               : Manage Azure Data Migration Service (DMS) instances.
    eventgrid         : Manage Azure Event Grid topics and subscriptions.
    eventhubs         : Manage Azure Event Hubs namespaces, eventhubs, consumergroups and geo
                       recovery configurations - Alias.
    extension         : Manage and update CLI extensions.
    feature           : Manage resource provider features.
    feedback          : Send feedback to the Azure CLI Team!
    find              : I'm an AI robot, my advice is based on our Azure documentation as well as
                       the usage patterns of Azure CLI and Azure ARM users. Using me improves Azure
                       products and documentation.
    functionapp       : Manage function apps.
    group             : Manage resource groups and template deployments.
    hdinsight         : Manage HDInsight resources.
    identity          : Managed Service Identities.
    image             : Manage custom virtual machine images.
    interactive       : Start interactive mode. Installs the Interactive extension if not installed
                       already.
    iot               : Manage Internet of Things (IoT) assets.
    iotcentral        : Manage IoT Central assets.
    keyvault          : Manage KeyVault keys, secrets, and certificates.
    kusto             : Manage Azure Kusto resources.
    lab               : Manage Azure DevTest Labs.
    lock              : Manage Azure locks.
    login             : Log in to Azure.
    logout            : Log out to remove access to Azure subscriptions.
    managedapp        : Manage template solutions provided and maintained by Independent Software
                       Vendors (ISVs).
    maps              : Manage Azure Maps.
    mariadb           : Manage Azure Database for MariaDB servers.
    monitor           : Manage the Azure Monitor Service.
    mysql             : Manage Azure Database for MySQL servers.
    network           : Manage Azure Network resources.
    openshift         : (PREVIEW) Manage Azure OpenShift Services.
    policy            : Manage resource policies.
    postgres          : Manage Azure Database for PostgreSQL servers.
    provider          : Manage resource providers.
    redis             : Manage dedicated Redis caches for your Azure applications.
    relay             : Manage Azure Relay Service namespaces, WCF relays, hybrid connections, and
                       rules.
    reservations      : Manage Azure Reservations.
    resource          : Manage Azure resources.
    role              : Manage user roles for access control with Azure Active Directory and service
                       principals.
    search            : Manage Azure Search services, admin keys and query keys.
    security          : Manage your security posture with Azure Security Center.
    servicebus        : Manage Azure Service Bus namespaces, queues, topics, subscriptions, rules
                       and geo-disaster recovery configuration alias.
    sf                : Manage and administer Azure Service Fabric clusters.
    sig               : Manage shared image gallery.
    signalr           : Manage Azure SignalR Service.
    snapshot          : Manage point-in-time copies of managed disks, native blobs, or other
                       snapshots.
    sql               : Manage Azure SQL Databases and Data Warehouses.
    storage           : Manage Azure Cloud Storage resources.
    tag               : Manage resource tags.
    vm                : Manage Linux or Windows virtual machines.
    vmss              : Manage groupings of virtual machines in an Azure Virtual Machine Scale Set
                       (VMSS).
    webapp            : Manage web apps.
```

```console
$ az --version
azure-cli                         2.0.60

acr                                2.2.2
acs                               2.3.19
advisor                            2.0.0
ams                                0.4.2
appservice                        0.2.15
backup                             1.2.1
batch                              4.0.0
batchai                            0.4.7
billing                            0.2.0
botservice                         0.1.8
cdn                                0.2.0
cloud                              2.1.0
cognitiveservices                  0.2.4
command-modules-nspkg               2.0.2
configure                         2.0.20
consumption                        0.4.2
container                         0.3.15
core                              2.0.60
cosmosdb                           0.2.8
dla                                0.2.4
dls                                0.1.8
dms                                0.1.2
eventgrid                          0.2.1
eventhubs                          0.3.4
extension                          0.2.3
feedback                           2.1.4
find                               0.3.0
hdinsight                          0.3.2
interactive                        0.4.1
iot                                0.3.6
iotcentral                         0.1.6
keyvault                          2.2.12
kusto                              0.2.0
lab                                0.1.5
maps                               0.3.3
monitor                           0.2.10
network                            2.3.4
nspkg                              3.0.3
policyinsights                     0.1.1
profile                            2.1.3
rdbms                              0.3.8
redis                              0.4.1
relay                              0.1.3
reservations                       0.4.1
resource                          2.1.11
role                               2.4.2
search                             0.1.1
security                           0.1.0
servicebus                         0.3.3
servicefabric                     0.1.14
signalr                            1.0.0
sql                                2.1.9
sqlvm                              0.1.0
storage                            2.3.1
telemetry                          1.0.1
vm                                2.2.16

Python location '/usr/lib64/az/bin/python'
Extensions directory '/home/ec2-user/.azure/cliextensions'

Python (Linux) 2.7.14 (default, Jul 26 2018, 19:59:38)
[GCC 7.3.1 20180303 (Red Hat 7.3.1-5)]

Legal docs and information: aka.ms/AzureCliLegal


Your CLI is up-to-date.
```

login
--

```console
$ az login
To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code AAAABBCC4 to authenticate.
```

1. open the URL `https://microsoft.com/devicelogin` with browser
2. input code `AAAABBCC4`
3. select account
4. click continue and authenticate
5. below lines will be able to show up on prompt

```console
[
  {
    "cloudName": "AzureCloud",
    "id": "00000000-0000-0000-0000-000000000000",  
    "isDefault": true,
    "name": "無料試用版",
    "state": "Enabled",
    "tenantId": "11111111-1111-1111-1111-111111111111",  
    "user": {
      "name": "youremail@outlook.com",
      "type": "user"
    }
  }
]
```
