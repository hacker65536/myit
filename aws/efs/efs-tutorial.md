


```hcl
resource "aws_efs_file_system" "efs" {
  creation_token = "${terraform.workspace}-efs"
  tags           = "${merge(var.tags, map("Name", "${terraform.workspace}-efs"))}"
}

resource "aws_efs_mount_target" "efs" {
  count           = "${length(data.aws_subnet_ids.pub.ids)}"
  file_system_id  = "${aws_efs_file_system.efs.id}"
  subnet_id       = "${element(data.aws_subnet_ids.pub.ids,count.index)}"
  security_groups = ["${data.aws_security_group.sec.id}"]
}
```

client

https://docs.aws.amazon.com/efs/latest/ug/gs-step-three-connect-to-ec2-instance.html

```console
sudo yum install -y amazon-efs-utils
```
