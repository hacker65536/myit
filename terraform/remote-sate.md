
v0.9.9

```hcl
data "terraform_remote_state" "rst" {
  backend = "s3"

  config {
    bucket   = "buketname"
    key      = "terraform.tfstate"
    region   = "us-west-2"
    role_arn = "arn:aws:iam::xxxxxxxxx:role/rolename"
    profile  = "default"
  }
}
```
