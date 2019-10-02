# google cloud sdk

https://cloud.google.com/sdk/docs/quickstart-linux?hl=ja

install to linux (x86_64)
--
```console
$ curl -SsL https://sdk.cloud.google.com | bash
```

```
Downloading Google Cloud SDK install script: https://dl.google.com/dl/cloudsdk/channels/rapid/install_google_cloud_sdk.bash
######################################################################## 100.0%
Running install script from: /tmp/tmp.VHYIWA9Nhk/install_google_cloud_sdk.bash
which curl
curl -# -f https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.tar.gz
############################################################################################# 100.0%

Installation directory (this will create a google-cloud-sdk subdirectory) (/home/ec2-user):

---snip----
google-cloud-sdk/.install/core.snapshot.json
google-cloud-sdk/.install/core.manifest
google-cloud-sdk/.install/.download/

/home/ec2-user/google-cloud-sdk/install.sh
Welcome to the Google Cloud SDK!

To help improve the quality of this product, we collect anonymized usage data
and anonymized stacktraces when crashes are encountered; additional information
is available at <https://cloud.google.com/sdk/usage-statistics>. You may choose
to opt out of this collection now (by choosing 'N' at the below prompt), or at
any time in the future by running the following command:

    gcloud config set disable_usage_reporting true

Do you want to help improve the Google Cloud SDK (Y/n)?  n


This will install all the core command line tools necessary for working with
the Google Cloud Platform.



Your current Cloud SDK version is: 265.0.0
Installing components from version: 265.0.0

┌────────────────────────────────────────────────────────────────────────────┐
│                    These components will be installed.                     │
├─────────────────────────────────────────────────────┬────────────┬─────────┤
│                         Name                        │  Version   │   Size  │
├─────────────────────────────────────────────────────┼────────────┼─────────┤
│ BigQuery Command Line Tool                          │     2.0.48 │ < 1 MiB │
│ BigQuery Command Line Tool (Platform Specific)      │     2.0.46 │ < 1 MiB │
│ Cloud SDK Core Libraries (Platform Specific)        │ 2019.08.16 │ < 1 MiB │
│ Cloud Storage Command Line Tool                     │       4.43 │ 3.6 MiB │
│ Cloud Storage Command Line Tool (Platform Specific) │       4.42 │ < 1 MiB │
│ Default set of gcloud commands                      │            │         │
│ gcloud cli dependencies                             │ 2018.08.03 │ 8.6 MiB │
└─────────────────────────────────────────────────────┴────────────┴─────────┘

For the latest full release notes, please visit:
  https://cloud.google.com/sdk/release_notes

╔════════════════════════════════════════════════════════════╗
╠═ Creating update staging area                             ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Installing: BigQuery Command Line Tool                   ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Installing: BigQuery Command Line Tool (Platform Spec... ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Installing: Cloud SDK Core Libraries (Platform Specific) ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Installing: Cloud Storage Command Line Tool              ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Installing: Cloud Storage Command Line Tool (Platform... ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Installing: Default set of gcloud commands               ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Installing: gcloud cli dependencies                      ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Creating backup and activating new installation          ═╣
╚════════════════════════════════════════════════════════════╝

Performing post processing steps...done.

Update done!


Modify profile to update your $PATH and enable shell command
completion?

Do you want to continue (Y/n)?  Y

The Google Cloud SDK installer will now prompt you to update an rc
file to bring the Google Cloud CLIs into your environment.

Enter a path to an rc file to update, or leave blank to use
[/home/ec2-user/.bashrc]:
Backing up [/home/ec2-user/.bashrc] to [/home/ec2-user/.bashrc.backup].
[/home/ec2-user/.bashrc] has been updated.

==> Start a new shell for the changes to take effect.


For more information on how to get started, please visit:
  https://cloud.google.com/sdk/docs/quickstarts
```

.bashrc
```bash
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ec2-user/google-cloud-sdk/path.bash.inc' ]; then . '/home/ec2-user/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ec2-user/google-cloud-sdk/completion.bash.inc' ]; then . '/home/ec2-user/google-cloud-sdk/completion.bash.inc'; fi
```

```console
$ source ~/.bashrc
```

init
--
```console
$ gcloud init
```

```
Welcome! This command will take you through the configuration of gcloud.

Your current configuration has been set to: [default]

You can skip diagnostics next time by using the following flag:
  gcloud init --skip-diagnostics

Network diagnostic detects and fixes local network connection issues.
Checking network connection...done.
Reachability Check passed.
Network diagnostic (1/1 checks) passed.

You must log in to continue. Would you like to log in (Y/n)?  Y

Go to the following link in your browser:

    https://accounts.google.com/o/oauth2/auth?redirect_uri=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
```
Enter verification code: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
You are logged in as: xxxxxx@xxxxxxxxxxxxxx
```


```
Pick cloud project to use:
 [1] prj-121608
 [2] prj-134209
 [3] Create a new project
Please enter numeric choice or text value (must exactly match list
item):  1
```
```
Which Google Compute Engine zone would you like to use as project
default?
If you do not specify a zone via a command line flag while working
with Compute Engine resources, the default is assumed.
 [1] us-east1-b
 [2] us-east1-c
 [3] us-east1-d
 [4] us-east4-c
 [5] us-east4-b
 [6] us-east4-a
 [7] us-central1-c
 [8] us-central1-a
 [9] us-central1-f
 [10] us-central1-b
 [11] us-west1-b
 [12] us-west1-c
 [13] us-west1-a
 [14] europe-west4-a
 [15] europe-west4-b
 [16] europe-west4-c
 [17] europe-west1-b
 [18] europe-west1-d
 [19] europe-west1-c
 [20] europe-west3-c
 [21] europe-west3-a
 [22] europe-west3-b
 [23] europe-west2-c
 [24] europe-west2-b
 [25] europe-west2-a
 [26] asia-east1-b
 [27] asia-east1-a
 [28] asia-east1-c
 [29] asia-southeast1-b
 [30] asia-southeast1-a
 [31] asia-southeast1-c
 [32] asia-northeast1-b
 [33] asia-northeast1-c
 [34] asia-northeast1-a
 [35] asia-south1-c
 [36] asia-south1-b
 [37] asia-south1-a
 [38] australia-southeast1-b
 [39] australia-southeast1-c
 [40] australia-southeast1-a
 [41] southamerica-east1-b
 [42] southamerica-east1-c
 [43] southamerica-east1-a
 [44] asia-east2-a
 [45] asia-east2-b
 [46] asia-east2-c
 [47] asia-northeast2-a
 [48] asia-northeast2-b
 [49] asia-northeast2-c
 [50] europe-north1-a
Did not print [12] options.
Too many options [62]. Enter "list" at prompt to print choices fully.
Please enter numeric choice or text value (must exactly match list
item):  32
```

- Pick project [1] xxxxxxxxxxxxx
- specify a zone  [32] asia-northeast1-b

```console
$ ls -la ~/.config/gcloud/
total 24
drwxrwxr-x 5 ec2-user ec2-user  198 Feb 21 08:54 .
drwx------ 4 ec2-user ec2-user   43 Feb 21 08:47 ..
-rw------- 1 ec2-user ec2-user 4096 Feb 21 08:54 access_tokens.db
-rw-rw-r-- 1 ec2-user ec2-user    7 Feb 21 08:50 active_config
-rw-rw-r-- 1 ec2-user ec2-user    0 Feb 21 08:54 config_sentinel
drwxrwxr-x 2 ec2-user ec2-user   28 Feb 21 08:47 configurations
-rw------- 1 ec2-user ec2-user 5120 Feb 21 08:54 credentials.db
-rw------- 1 ec2-user ec2-user    5 Feb 21 09:00 gce
-rw-rw-r-- 1 ec2-user ec2-user  134 Feb 21 08:47 .last_update_check.json
drwx------ 3 ec2-user ec2-user   34 Feb 21 08:54 legacy_credentials
drwxrwxr-x 3 ec2-user ec2-user   24 Feb 21 08:47 logs
```

apis&reference
-------------

https://cloud.google.com/sdk/gcloud/reference/?hl=ja


```
$ gcloud app describe

authDomain: gmail.com
codeBucket: staging.testproject-1111111.appspot.com
defaultBucket: testproject-1111111.appspot.com
defaultHostname: testproject-1111111.appspot.com
featureSettings: {}
gcrDomain: us.gcr.io
id: testproject-1111111
locationId: us-central
name: apps/testproject-1111111
servingStatus: SERVING
```

components list
--
```console
$ gcloud components list

Your current Cloud SDK version is: 235.0.0
The latest available version is: 238.0.0

┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                                   Components                                                   │
├──────────────────┬──────────────────────────────────────────────────────┬──────────────────────────┬───────────┤
│      Status      │                         Name                         │            ID            │    Size   │
├──────────────────┼──────────────────────────────────────────────────────┼──────────────────────────┼───────────┤
│ Update Available │ BigQuery Command Line Tool                           │ bq                       │   < 1 MiB │
│ Update Available │ Cloud SDK Core Libraries                             │ core                     │   9.7 MiB │
│ Update Available │ Cloud Storage Command Line Tool                      │ gsutil                   │   3.6 MiB │
│ Not Installed    │ App Engine Go Extensions                             │ app-engine-go            │  56.6 MiB │
│ Not Installed    │ Cloud Bigtable Command Line Tool                     │ cbt                      │   6.4 MiB │
│ Not Installed    │ Cloud Bigtable Emulator                              │ bigtable                 │   5.6 MiB │
│ Not Installed    │ Cloud Datalab Command Line Tool                      │ datalab                  │   < 1 MiB │
│ Not Installed    │ Cloud Datastore Emulator                             │ cloud-datastore-emulator │  18.4 MiB │
│ Not Installed    │ Cloud Datastore Emulator (Legacy)                    │ gcd-emulator             │  38.1 MiB │
│ Not Installed    │ Cloud Firestore Emulator                             │ cloud-firestore-emulator │  39.2 MiB │
│ Not Installed    │ Cloud Pub/Sub Emulator                               │ pubsub-emulator          │  33.4 MiB │
│ Not Installed    │ Cloud SQL Proxy                                      │ cloud_sql_proxy          │   3.8 MiB │
│ Not Installed    │ Emulator Reverse Proxy                               │ emulator-reverse-proxy   │  14.5 MiB │
│ Not Installed    │ Google Cloud Build Local Builder                     │ cloud-build-local        │   6.0 MiB │
│ Not Installed    │ Google Container Registry's Docker credential helper │ docker-credential-gcr    │   1.8 MiB │
│ Not Installed    │ gcloud Alpha Commands                                │ alpha                    │   < 1 MiB │
│ Not Installed    │ gcloud Beta Commands                                 │ beta                     │   < 1 MiB │
│ Not Installed    │ gcloud app Java Extensions                           │ app-engine-java          │ 108.8 MiB │
│ Not Installed    │ gcloud app PHP Extensions                            │ app-engine-php           │           │
│ Not Installed    │ gcloud app Python Extensions                         │ app-engine-python        │   6.0 MiB │
│ Not Installed    │ gcloud app Python Extensions (Extra Libraries)       │ app-engine-python-extras │  28.5 MiB │
│ Not Installed    │ kubectl                                              │ kubectl                  │   < 1 MiB │
└──────────────────┴──────────────────────────────────────────────────────┴──────────────────────────┴───────────┘
To install or remove components at your current SDK version [235.0.0], run:
  $ gcloud components install COMPONENT_ID
  $ gcloud components remove COMPONENT_ID

To update your SDK installation to the latest version [238.0.0], run:
  $ gcloud components update

```

components update
--
```console
$ gcloud components update


Your current Cloud SDK version is: 235.0.0
You will be upgraded to version: 238.0.0

┌────────────────────────────────────────────────────────┐
│           These components will be updated.            │
├─────────────────────────────────┬────────────┬─────────┤
│               Name              │  Version   │   Size  │
├─────────────────────────────────┼────────────┼─────────┤
│ BigQuery Command Line Tool      │     2.0.42 │ < 1 MiB │
│ Cloud SDK Core Libraries        │ 2019.03.08 │ 9.7 MiB │
│ Cloud Storage Command Line Tool │       4.37 │ 3.6 MiB │
│ gcloud cli dependencies         │ 2019.03.01 │ 2.4 MiB │
└─────────────────────────────────┴────────────┴─────────┘

The following release notes are new in this upgrade.
Please read carefully for information about new features, breaking changes,
and bugs fixed.  The latest full release notes can be viewed at:
  https://cloud.google.com/sdk/release_notes

238.0.0 (2019-03-12)
  App Engine
    *
      ▪ Updated the Python SDK to version 1.9.84. Please visit the following
        release notes for details:
        https://cloud.google.com/appengine/docs/python/release-notes

      ▪ Added a new field, 'main', to app.yaml. This allows users of the Go
        second-generation runtimes to specify which package to build. See
        https://cloud.google.com/appengine/docs/standard/go111/config/appref
        for more information.

  App Engine Flexible Environment
      ▪ Promoted network.session_affinity flag in yaml file to GA.

  Cloud Access Context Manager
      ▪ Promoted the gcloud access-context-manager command group to GA
      ▪ Removed the unrestricted-services field from alpha and beta, always
        set to default ''.

  Cloud Dataproc
      ▪ Promoted --optional-components of gcloud dataproc clusters to GA.

  Cloud Functions
      ▪ Promoted max-instances and clear-max-instances flags of gcloud
        functions deploy to beta.

  Cloud Machine Learning Engine
      ▪ Promoted --machine-type flag of gcloud ml-engine versions create
        command to GA.

  Kubernetes Engine
      ▪ Added the --enable-shielded-containers flag to gcloud beta container
        clusters create.

    Subscribe to these release notes at
    https://groups.google.com/forum/#!forum/google-cloud-sdk-announce
    (https://groups.google.com/forum/#!forum/google-cloud-sdk-announce).

237.0.0 (2019-03-05)
  Cloud SDK
      ▪ Fixed issue affecting users overwriting an existing Cloud SDK install
        via the Windows installer, in which certain gcloud commands crashed
        with a "gcloud crashed (LayoutException): Multiple definitions for
        release track" error. This issue can be tracked at
        <https://issuetracker.google.com/123390310>.

  BigQuery
      ▪ Fixes bug in formatting pre-1900 timestamps.

  Cloud Dataproc
      ▪ Fixed a bug where several fields were hidden from gcloud dataproc
        clusters
    <import|export> in all release tracks. Note that these fields were always
    available in gcloud dataproc clusters <create-from-file|describe>.

  Cloud Storage
    *
      ▪ Updated gsutil component to 4.37.

  Compute Engine
      ▪ Promoted the --server-binding flag of gcloud compute sole-tenancy
        node-templates create to beta.
      ▪ Reduced lower bound for data disk sizes from 10GB to 1GB for gcloud
        compute instances create.
      ▪ Added resources-accelerator to gcloud beta compute commitments
        create.
      ▪ Promoted all option of --ports flag for gcloud compute
        forwarding-rules to GA.
      ▪ Added INSTANCE_TEMPLATE and VERSION_NAME columns to output of gcloud
        compute instance-groups managed list-instances.

  Kubernetes Engine
      ▪ Updated Google Kubernetes Engine's kubectl from version 1.10.7 to
        1.11.7.
      ▪ Added extra Google Kubernetes Engine kubectl versions:
        ◆ kubectl.1.9
        ◆ kubectl.1.10
        ◆ kubectl.1.11
        ◆ kubectl.1.12
        ◆ kubectl.1.13

    Subscribe to these release notes at
    https://groups.google.com/forum/#!forum/google-cloud-sdk-announce
    (https://groups.google.com/forum/#!forum/google-cloud-sdk-announce).

236.0.0 (2019-02-26)
  Cloud SDK
      ▪ Modified error handling for gcloud auth revoke when revoking a
        service account token to print a friendly error message with more
        detailed instructions on how to revoke the token.

  Cloud Asset Inventory
      ▪ Added --folder flag to gcloud beta asset export command.

  Cloud Dataproc
      ▪ Added --kerberos-root-principal-password-uri, --kerberos-kms-key, and
        --kerberos-config-file flags to gcloud beta dataproc clusters create
        and gcloud beta dataproc workflow-templates set-managed-cluster.

  Cloud Firestore Emulator
      ▪ Released Cloud Firestore Emulator version 1.4.0:
        ◆ Added support for the debug(...) function in security rules.
        ◆ Simplified security rule evaluation and rule coverage reports.

  Cloud Services
      ▪ Promoted services vpc-peerings command group to GA.

  Compute Engine
      ▪ Removed auto-create-routes column from default output of gcloud beta
        compute networks peerings list.
      ▪ Promoted --enable-logging and --log-filter flags of gcloud compute
        routers nats to beta.

    Subscribe to these release notes at
    https://groups.google.com/forum/#!forum/google-cloud-sdk-announce
    (https://groups.google.com/forum/#!forum/google-cloud-sdk-announce).

Do you want to continue (Y/n)?  Y

╔════════════════════════════════════════════════════════════╗
╠═ Creating update staging area                             ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Uninstalling: BigQuery Command Line Tool                 ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Uninstalling: Cloud SDK Core Libraries                   ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Uninstalling: Cloud Storage Command Line Tool            ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Uninstalling: gcloud cli dependencies                    ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Installing: BigQuery Command Line Tool                   ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Installing: Cloud SDK Core Libraries                     ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Installing: Cloud Storage Command Line Tool              ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Installing: gcloud cli dependencies                      ═╣
╠════════════════════════════════════════════════════════════╣
╠═ Creating backup and activating new installation          ═╣
╚════════════════════════════════════════════════════════════╝

Performing post processing steps...done.

Update done!

To revert your SDK to the previously installed version, you may run:
  $ gcloud components update --version 235.0.0

```
