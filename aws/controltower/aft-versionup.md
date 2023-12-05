# aft update


## requirement

upload state to s3 

upload tfvars to s3 


## check version

version in use
arn:aws:ssm:ap-northeast-1:12345678901:parameter/aft/config/aft/version

new version
https://github.com/aws-ia/terraform-aws-control_tower_account_factory/releases


## update 

```
git clone https://github.com/aws-ia/terraform-aws-control_tower_account_factory
cd !$:t
aws s3 cp s3://aft-state-xxxxxx/terraform.tfvars .
```

`vim version.tf`

```hcl
  backend "s3" {
    region = "ap-northeast-1"
    bucket = "aft-state-xxxxxx"
    key    = "terraform.tfstate"
  }

```
```
terraform init
terraform plan
terraform apply
```
