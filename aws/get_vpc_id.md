```bash
$ curl -s 169.254.169.254/latest/meta-data/network/interfaces/macs/$(curl -s 169.254.169.254/latest/meta-data/mac)/vpc-id
vpc-xxxxxxxx
```
