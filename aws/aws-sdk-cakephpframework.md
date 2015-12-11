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

php composer.phar install
cd ../
mkdir aws-cakesample
#
./aws/Vendor/bin/cake bake project aws-cakesample/
cd aws-cakesample/Config/
cp database.php.default database.php
echo "
define('AWS_SDK_PATH',  DS . 'home' . DS . 'user' . DS . 'contents' . DS . 'aws' . DS . 'Vendor');
require AWS_SDK_PATH . '/autoload.php';
" >> bootstrap.php

cd ../Controller/
```

`AwsController.php`
```php
<?php
class AwsController extends Controller {

        public function index(){
                $this->autoRender=false;

                $client=Aws\DynamoDb\DynamoDbClient::factory(
                                array(
                                        'region'=>'ap-southeast-2',
                                     )
                                );
                                
                                #if your ec2 not have role of authority 

                                /*
                                array(
                                 'key'=>key, //edit
                                 'secret'=secret, //edit
                                 'region'=>'ap-southeast-2',
                                 );
                                */
                $res=$client->listTables();
                foreach ($res['TableNames'] as $tableName) {
                        echo $tableName . "\n";
                }
        }
}




```


`AwsS3StsController.php`
```php
<?php
class AwsS3StsController extends Controller {

        public function index(){
                $this->autoRender=false;
                $sts=Aws\Sts\StsClient::factory(
                                array(
                                        'region'=>'us-east-1',
                                     )
                                );

                $result = $sts->assumeRole(array(
                                        // RoleArn is required
                                        'RoleArn' => 'arn:aws:iam::xxxxxxxxx:role/role-name',
                                        // RoleSessionName is required
                                        'RoleSessionName' => 'bbb',
                                        //'Policy' => 'string',
                                        //'DurationSeconds' => integer,
                                        //'ExternalId' => 'string',
                                        //'SerialNumber' => 'string',
                                        //'TokenCode' => 'string',
                                        ));

                $s3=Aws\S3\S3Client::factory(
                                array(
                                'key'=>$result['Credentials']['AccessKeyId'],
                                'secret'=>$result['Credentials']['SecretAccessKey'],
                                'token'=>$result['Credentials']['SessionToken'],
                                'region'=>'us-east-1',
                                     )
                                );
                $res=$s3->getObject(array(
                        'Bucket'=>'bukectname',
                        'Key'=>'data.txt',
                        'SaveAs'=>'/tmp/data.txt',
                ));
                var_dump($res);
        }
}

```

`httpd.conf`
```apache
<VirtualHost *:80>
        ServerAdmin support@example.com
        DocumentRoot /home/user/contents/aws-cakesample
        ServerName user.example.com
        ErrorLog /home/user/logs/error_log
        CustomLog /home/user/logs/access_log combined2 env=!no_log
<Directory /home/user/contents/aws-cakesample>
require all granted
AllowOverride All
</Directory>
</VirtualHost>


#or-------------------

<VirtualHost _default_:80>
ServerName test.com
DocumentRoot /var/www/aws-cakesample
<Directory /var/www/aws-cakesample>
Require all granted
AllowOverride all
</Directory>
</VirtualHost>
```
