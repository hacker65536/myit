
assume role
```javascript
var AWS = require('aws-sdk');

AWS.config.credentials = new AWS.TemporaryCredentials({
  RoleArn: 'arn:aws:iam::99999999999:role/RoleName',
});


//console.log(AWS.config.credentials);
var s3 = new AWS.S3();
/**
 * @classdesc Abstract class representing a network connection.
 * @class
 */
s3.listBuckets(function(err, data) {
  if (err) console.log(err, err.stack); // an error occurred
  else     console.log(data);           // successful response
});
```
