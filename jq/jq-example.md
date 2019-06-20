


terraformからtag:Nameとprivateipを出力してansible用inventoryを作成する
--
https://jqterm.com/9eb3d6614fcfa00e54568a5fffff41f5?query=to_entries%5B%5D%7C%20select%28.key%7Ccontains%28%22amz%22%29%29%20.user%7C%3D%22ec2-user%22%20%7C%20select%28.key%7Ccontains%28%22cent%22%29%29%20.user%7C%3D%22centos%22%20%7C%20select%28.key%7Ccontains%28%22ubuntu%22%29%29%20.user%7C%3D%22ubuntu%22

```
to_entries[]| select(.key|contains("amz")) .user|="ec2-user" | select(.key|contains("cent")) .user|="centos" | select(.key|contains("ubuntu")) .user|="ubuntu"
```
input
```json
{
  "amitest-amz": "172.31.14.56",
  "amitest-amz2": "172.31.11.112",
  "amitest-cent6": "172.31.7.219",
  "amitest-cent7": "172.31.6.213",
  "amitest-ubuntu18": "172.31.5.99"
}
```

output
```json
{
  "key": "amitest-amz",
  "value": "172.31.14.56",
  "user": "ec2-user"
}
{
  "key": "amitest-amz2",
  "value": "172.31.11.112",
  "user": "ec2-user"
}
{
  "key": "amitest-cent6",
  "value": "172.31.7.219",
  "user": "centos"
}
{
  "key": "amitest-cent7",
  "value": "172.31.6.213",
  "user": "centos"
}
{
  "key": "amitest-ubuntu18",
  "value": "172.31.5.99",
  "user": "ubuntu"
}
```
