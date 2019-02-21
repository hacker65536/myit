# google cloud sdk

https://cloud.google.com/sdk/docs/quickstart-linux?hl=ja

install to linux (x86_64)
--
```console
$ curl https://sdk.cloud.google.com | bash
```

```
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



Your current Cloud SDK version is: 235.0.0
Installing components from version: 235.0.0

┌────────────────────────────────────────────────────────────────────────────┐
│                    These components will be installed.                     │
├─────────────────────────────────────────────────────┬────────────┬─────────┤
│                         Name                        │  Version   │   Size  │
├─────────────────────────────────────────────────────┼────────────┼─────────┤
│ BigQuery Command Line Tool                          │     2.0.41 │ < 1 MiB │
│ BigQuery Command Line Tool (Platform Specific)      │     2.0.34 │ < 1 MiB │
│ Cloud SDK Core Libraries (Platform Specific)        │ 2018.09.24 │ < 1 MiB │
│ Cloud Storage Command Line Tool                     │       4.36 │ 3.6 MiB │
│ Cloud Storage Command Line Tool (Platform Specific) │       4.34 │ < 1 MiB │
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

Do you want to continue (Y/n)?

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

- Pick project [4] xxxxxxxxxxxxx
- specify a zone  [4] asia-northeast1-a

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
