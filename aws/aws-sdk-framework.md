#cakephp + AwsSDK

```bash

cd /var/www/


mkdir aws
cd aws

curl -sS https://getcomposer.org/installer | php

echo '
{
    "name": "aws-cakesample",
    "repositories": [
        {
            "type": "pear",
            "url": "http://pear.cakephp.org"
        }
    ],
    "require": {
         "cakephp/cakephp": ">=2.4.9",
        "aws/aws-sdk-php": "2.*"
    },
    "config": {
        "vendor-dir": "Vendor/"
    }
}
'> composer.json

```
