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
