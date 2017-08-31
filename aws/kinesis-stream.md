
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

```
$ aws kinesis get-shard-iterator --shard-id shardId-000000000000 --shard-iterator-type TRIM_HORIZON --stream-name terraform-kinesis-test
{
    "ShardIterator": "AAAAAAAAAAHi5iG3O3Ywzbj12fAfLAmZviQfiUP7A1v76X/5HOqUSOyl1TT/urGpXa8i1m7i3cPxOYoP3CuSdvx7CrPLQoJnx/a4wRl86IN2HjQjKLVJ213buUlasPOYqvNQboYw2lN07vd/MuvcIyWYS1zmPriWFNbB79/XSm/trmhV45tSUTydV7IMBUtjc/8f+Q2QeOd28mFIWma0nb4kS0nf/NU94hwF0CI+EQcWiOHrZXbHAQ=="
}
```

```
$ aws kinesis get-records --shard-iterator AAAAAAAAAAHi5iG3O3Ywzbj12fAfLAmZviQfiUP7A1v76X/5HOqUSOyl1TT/urGpXa8i1m7i3cPxOYoP3CuSdvx7CrPLQoJnx/a4wRl86IN2HjQjKLVJ213buUlasPOYqvNQboYw2lN07vd/MuvcIyWYS1zmPriWFNbB79/XSm/trmhV45tSUTydV7IMBUtjc/8f+Q2QeOd28mFIWma0nb4kS0nf/NU94hwF0CI+EQcWiOHrZXbHAQ==
{
    "Records": [
        {
            "Data": "dGVzdGRhdGE=",
            "PartitionKey": "123",
            "ApproximateArrivalTimestamp": 1504178511.122,
            "SequenceNumber": "49576566031900456743140500914842365883503315339114971138"
        }
    ],
    "NextShardIterator": "AAAAAAAAAAFag55KpAQZwqnBHrEl4J48U9l5JzXwF30jEH7lW4DKhwtJeeSzsWQ4/MMHzNZKGYVfBwn+EYagVG7941ftzdcy6T+kQehFf08ks0yWD7Ril60m03/y1J/Ucv3Yx/hmEQg8xaUPH26L3m4Vs5xlOUDcXHJRYcWtVCbovSlT6xib3Cp2ld1QdDw9H1h3FlTDS+RFt3EC3mGBFYvMovryg5ML4SRSblQq3iUnup1znNOV3w==",
    "MillisBehindLatest": 0
}
```
