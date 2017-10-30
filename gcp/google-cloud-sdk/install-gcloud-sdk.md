https://cloud.google.com/sdk/downloads?hl=ja#linux


```
curl https://sdk.cloud.google.com | bash
```

- Do you want to help improve the Google Cloud SDK (Y/n)?  n

```
---snip---
This will install all the core command line tools necessary for working with
the Google Cloud Platform.



Your current Cloud SDK version is: 177.0.0
Installing components from version: 177.0.0

┌────────────────────────────────────────────────────────────────────────────┐
│                    These components will be installed.                     │
├─────────────────────────────────────────────────────┬────────────┬─────────┤
│                         Name                        │  Version   │   Size  │
├─────────────────────────────────────────────────────┼────────────┼─────────┤
│ BigQuery Command Line Tool                          │     2.0.27 │ < 1 MiB │
│ BigQuery Command Line Tool (Platform Specific)      │     2.0.26 │ < 1 MiB │
│ Cloud SDK Core Libraries (Platform Specific)        │ 2017.09.15 │ < 1 MiB │
│ Cloud Storage Command Line Tool                     │       4.28 │ 3.3 MiB │
│ Cloud Storage Command Line Tool (Platform Specific) │       4.27 │ < 1 MiB │
│ Default set of gcloud commands                      │            │         │
│ gcloud cli dependencies                             │ 2017.10.20 │ 5.1 MiB │
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
```

- Do you want to continue (Y/n)?  Y

```
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
if [ -f '/home/ec2-user/google-cloud-sdk/path.bash.inc' ]; then source '/home/ec2-user/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ec2-user/google-cloud-sdk/completion.bash.inc' ]; then source '/home/ec2-user/google-cloud-sdk/completion.bash.inc'; fi
```

append
```bash
export CLOUDSDK_PYTHON=/usr/bin/python2.7
```


```
exec -l $SHELL
```

```
gcloud init
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
