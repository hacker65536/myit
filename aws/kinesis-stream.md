
```HCL
resource "aws_kinesis_stream" "test_stream" {
  name             = "terraform-kinesis-test"
  shard_count      = 1
  retention_period = 48

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]

  tags {
    Environment = "test"
  }
}
```
```
$ terraform apply
```




```
$ aws kinesis put-record --stream-name terraform-kinesis-test --partition-key 123 --data testdata
{
    "ShardId": "shardId-000000000000",
    "SequenceNumber": "49576566031900456743140500914842365883503315339114971138"
}
```
