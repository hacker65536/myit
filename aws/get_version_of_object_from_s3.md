
##sourcecode PHP
```php
                $backet="BACKETNAME";
                $s3=Aws\S3\S3Client::factory(
                                array(
                                        'key'=>$result['Credentials']['AccessKeyId'],
                                        'secret'=>$result['Credentials']['SecretAccessKey'],
                                        'token'=>$result['Credentials']['SessionToken'],
                                        'region'=>'us-east-1',
                                     )
                                );

                $res = $s3->headObject(array(
                                        // Bucket is required
                                        'Bucket'=>$backet,
                                        'Key'=>'templatedev.json',
                                        ));
                echo "<pre>";
                echo "Bucket : ".$backet.PHP_EOL;
                echo "Key : templatedev.json".PHP_EOL;

                echo "LatestVersionId : ".$res['VersionId'].PHP_EOL;
                echo PHP_EOL;
                echo "Output response from aws-s3".PHP_EOL;
                var_dump($res);
                echo "</pre>";
```

##CommandLine
required jq
```bash
aws s3api head-object --bucket backetname --key templatedev.json | jq '.VersionId' | tr -d '"'
```
