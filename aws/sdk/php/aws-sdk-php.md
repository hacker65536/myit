

http://docs.aws.amazon.com/aws-sdk-php/v3/guide/

require
--------------
 `PHP >= 5.5.0`

### optimal

- cURL 7.16.2
- OPCache
- uninstall xdebug
- use comoser classmap autoloader 

from composer
----------------


```
mkdir awssdkphp
cd !$
curl -sSL https://getcomposer.org/installer | php
php composer.phar require aws/aws-sdk-php
```


```php
<?php
// Include the SDK using the Composer autoloader
require 'vendor/autoload.php';

$client = new Aws\Ec2\Ec2Client([
    'version' => 'latest',
    'region'  => 'us-east-1'
]);

$result = $client->describeVpcs();
var_dump($result);

```
