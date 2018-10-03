```console
$ terraform version
Terraform v0.11.8
```
```hcl
terraform {
 backend "s3" {
 // ...
 }
}
```

というファイルが直下にあると
```
$ terraform output -state=path/tfstate
Backend reinitialization required. Please run "terraform init".
Reason: Initial configuration of the requested backend "s3"

The "backend" is the interface that Terraform uses to store state,
-----snip---
```
となる
