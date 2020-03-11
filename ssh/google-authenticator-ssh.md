
https://github.com/google/google-authenticator-libpam


install
--

```console
$ cat /etc/os-release
NAME="Amazon Linux"
VERSION="2"
ID="amzn"
ID_LIKE="centos rhel fedora"
VERSION_ID="2"
PRETTY_NAME="Amazon Linux 2"
ANSI_COLOR="0;33"
CPE_NAME="cpe:2.3:o:amazon:amazon_linux:2"
HOME_URL="https://amazonlinux.com/"
```


```console
$ sudo amazon-linux-extras install -y epel
```

```console
$ sudo yum install google-authenticator
```


```console
$ yum info  google-authenticator
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
189 packages excluded due to repository priority protections
Installed Packages
Name        : google-authenticator
Arch        : x86_64
Version     : 1.04
Release     : 1.el7
Size        : 97 k
Repo        : installed
From repo   : epel
Summary     : One-time pass-code support using open standards
URL         : https://github.com/google/google-authenticator-libpam/
License     : ASL 2.0
Description : The Google Authenticator package contains a plug-able authentication
            : module (PAM) which allows login using one-time pass-codes conforming to
            : the open standards developed by the Initiative for Open Authentication
            : (OATH) (which is unrelated to OAuth).
            :
            : Pass-code generators are available (separately) for several mobile
            : platforms.
            :
            : These implementations support the HMAC-Based One-time Password (HOTP)
            : algorithm specified in RFC 4226 and the Time-based One-time Password
            : (TOTP) algorithm currently in draft.
```


edit sshd_config
--

```console
$ sudo sed -r -e 's/^(ChallengeResponseAuthentication).*/\1 yes/' /etc/ssh/sshd_config | sudo diff /etc/ssh/sshd_config -
67c67
< ChallengeResponseAuthentication no
---
> ChallengeResponseAuthentication yes
```
