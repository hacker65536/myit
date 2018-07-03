


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
$ sudo yum install -y amazon-efs-utils
```

need configure vpc dhcp option set enable hostname
```
$ dig fs-fcf85535.efs.us-east-2.amazonaws.com +short
10.0.1.247
```

```console
$ sudo mkdir /mnt/efs
$ sudo mount -t efs fs-fcf85535:/ /mnt/efs
```

```console
$ df -h
Filesystem                                 Size  Used Avail Use% Mounted on
devtmpfs                                   1.9G     0  1.9G   0% /dev
tmpfs                                      1.9G     0  1.9G   0% /dev/shm
tmpfs                                      1.9G   33M  1.9G   2% /run
tmpfs                                      1.9G     0  1.9G   0% /sys/fs/cgroup
/dev/xvda1                                1000G  435G  566G  44% /
tmpfs                                      376M     0  376M   0% /run/user/1000
fs-fcf85535.efs.us-east-2.amazonaws.com:/  8.0E     0  8.0E   0% /mnt/efs
```


c4.large

300-800Mbps
