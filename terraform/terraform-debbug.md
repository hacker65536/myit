https://www.terraform.io/docs/configuration/environment-variables.html

```bash
export TF_LOG=TRACE
export TF_LOG_PATH=./terraform.log
```

```
terraform plan
```

OFF
```
unset TF_LOG TF_LOG_PATH
```
