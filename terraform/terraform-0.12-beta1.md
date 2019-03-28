
make workspace
--
```console
$ mkdir tf012
$ cd !$
```

download binary file of command
--
```console
$ wget https://releases.hashicorp.com/terraform/0.12.0-beta1/terraform_0.12.0-beta1_linux_amd64.zip
$ unzip !$:t
$ rm !$
$ alias t=./terraform
```

set provider
--
```console
$ cat <<'EOF' > provider.tf
variable "region" {}
variable "profile" {}
provider "aws" {
  region  = "${var.region}"
  profile = "${var.profile}"
  version = "1.60"
}
EOF
```


upgrade
--
```console
$ t -help|grep -C 3 upgrade
    workspace          Workspace management

All other commands:
    0.12upgrade        Rewrites pre-0.12 module source code for v0.12
    debug              Debug output management (experimental)
    force-unlock       Manually unlock the terraform state
    push               Obsolete command for Terraform Enterprise legacy (v1)
```
```console
$ t 0.12upgrade

This command will rewrite the configuration files in the given directory so
that they use the new syntax features from Terraform v0.12, and will identify
any constructs that may need to be adjusted for correct operation with
Terraform v0.12.

We recommend using this command in a clean version control work tree, so that
you can easily see the proposed changes as a diff against the latest commit.
If you have uncommited changes already present, we recommend aborting this
command and dealing with them before running this command again.

Would you like to upgrade the module in the current directory?
  Only 'yes' will be accepted to confirm.

  Enter a value: yes

-----------------------------------------------------------------------------

Error: error resolving providers: [provider.aws: no suitable version installed
  version requirements: "1.60"
  versions installed: none]

```

replace providers
--

```console
$ mkdir -p .terraform/plugins/linux_amd64/
$ wget http://terraform-0.12.0-dev-snapshots.s3-website-us-west-2.amazonaws.com/terraform-provider-aws/1.60.0-dev20190216H00-dev/terraform-provider-aws_1.60.0-dev20190216H00-dev_linux_amd64.zip
$ unzip !$:t -d !-2:$
$ rm !-2:$:t

```

```console
$ mv .terraform/plugins/linux_amd64/terraform-provider-aws_v1.60.0{-dev20190216H00-dev,}_x4
```

upgrade again
--
```console
$ t 0.12upgrade

This command will rewrite the configuration files in the given directory so
that they use the new syntax features from Terraform v0.12, and will identify
any constructs that may need to be adjusted for correct operation with
Terraform v0.12.

We recommend using this command in a clean version control work tree, so that
you can easily see the proposed changes as a diff against the latest commit.
If you have uncommited changes already present, we recommend aborting this
command and dealing with them before running this command again.

Would you like to upgrade the module in the current directory?
  Only 'yes' will be accepted to confirm.

  Enter a value: yes

-----------------------------------------------------------------------------

Upgrade complete!

The configuration files were upgraded successfully. Use your version control
system to review the proposed changes, make any necessary adjustments, and
then commit.
```

generated version file
```console
$ cat versions.tf

terraform {
  required_version = ">= 0.12"
}
```
