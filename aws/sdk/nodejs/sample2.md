```js
var AWS = require('aws-sdk');

AWS.config.update({region: 'us-west-2'});
var autoscaling = new AWS.AutoScaling();
// --snip--
```
