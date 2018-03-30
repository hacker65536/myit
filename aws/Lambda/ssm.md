```js
'use strict';

var AWS = require('aws-sdk');

const getsecparam = (k) => {
    const ssm = new AWS.SSM();
    const params = {
        Name: k,
        WithDecryption: true
    };
    return ssm.getParameter(params).promise();
};
```
