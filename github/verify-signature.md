https://developer.github.com/webhooks/securing/

https://tools.ietf.org/html/rfc2104

1. repostitory => settings => webhooks
4. input node server address to Payload URL
5. select application/json to Content type 
6. input MY_SECRET(custom secret) to Secret



node server
-----
```js
"use strict";

const PORT = process.env.PORT || 8080;
const SECRET = "MY_SECRET";  
const REPOSITORY_NAME = "MY_REPOSITORY_NAME"; 

const http = require("http");
const createHandler = require("github-webhook-handler");
const handler = createHandler({
    path: "/",
    secret: SECRET
});


http.createServer((req, res) => {
    handler(req, res, (err) => {
        res.statusCode = 404;
        res.end("no such location");
    });
}).listen(PORT);


handler.on("error", (err) => {
    console.error("Error:", err.message);
});


handler.on("push", (event) => {
    const payload = event.payload;
    const repoName = payload.repository.name;
    const branch = payload.ref.split("/").pop();

});
```
```
npm install http
npm install github-webhook-handler
```

```
node index.js
```

redeliver
-------------
request headers
```
Request URL: http://xxxxxxxx:8080/
Request method: POST
content-type: application/json
Expect: 
User-Agent: GitHub-Hookshot/a856147
X-GitHub-Delivery: 87bfeb80-2dc1-11e8-8687-4d542cc7afc9
X-GitHub-Event: ping
X-Hub-Signature: sha1=79ddca4fceac691b2f379f5f57c6c7c05f212b36
```
request payload
```
{
  "zen": "It's not fully shipped until it's fast.",
  "hook_id": 45234234,
  "hook": {
    "type": "Repository",
    "id": 45234234,
    "name": "web",
    "active": true,
    "events": [
      "push"
    ],
    "config": {
      "content_type": "form",
      "insecure_ssl": "0",
      "secret": "********",
      "url": "http://xxxxxxxxxxx"
--snip--      
```
response headers
```
Connection: keep-alive
Content-Length: 11
content-type: application/json
Date: Thu, 22 Mar 2018 11:34:35 GMT
Transfer-Encoding: chunked
```
response body
```
{"ok":true}
```


php
--------------

https://gist.github.com/jplitza/88d64ce351d38c2f4198


```php
<?php
// where to log errors and successful requests
define('LOGFILE', '/tmp/github-webhook.log');

// the shared secret, used to sign the POST data (using HMAC with SHA1)
$secret = 'zwjojddtaad0Bkncvoisqpvqgalzqx8auygIqrkd';

// receive POST data for signature calculation, don't change!
$post_data = file_get_contents('php://input');
$signature = hash_hmac('sha1', $post_data, $secret);

// required data in POST body - set your targeted branch and repository here!
$required_data = array(
        'repository' => array(
                'full_name' => 'hacker65536/myit',
        ),
);

// required data in headers - probably doesn't need changing
$required_headers = array(
        'REQUEST_METHOD' => 'POST',
        'HTTP_X_GITHUB_EVENT' => 'ping',
        'HTTP_USER_AGENT' => 'GitHub-Hookshot/*',
        'HTTP_X_HUB_SIGNATURE' => 'sha1=' . $signature,
);

// END OF CONFIGURATION

error_reporting(0);

function log_msg($msg) {
        if(LOGFILE != '') {
                file_put_contents(LOGFILE, $msg . "\n", FILE_APPEND);
        }
}

function array_matches($have, $should, $name = 'array') {
        $ret = true;
        if(is_array($have)) {
                foreach($should as $key => $value) {
                        if(!array_key_exists($key, $have)) {
                                log_msg("Missing: $key");
                                $ret = false;
                        }
                        else if(is_array($value) && is_array($have[$key])) {
                                $ret &= array_matches($have[$key], $value);
                        }
                        else if(is_array($value) || is_array($have[$key])) {
                                log_msg("Type mismatch: $key");
                                $ret = false;
                        }
                        else if(!fnmatch($value, $have[$key])) {
                                log_msg("Failed comparison: $key={$have[$key]} (expected $value)");
                                $ret = false;
                        }
                }
        }
        else {
                log_msg("Not an array: $name");
                $ret = false;
        }
        return $ret;
}

log_msg("=== Received request from {$_SERVER['REMOTE_ADDR']} ===");
header("Content-Type: text/plain");
$data = json_decode($post_data, true);
// First do all checks and then report back in order to avoid timing attacks
$headers_ok = array_matches($_SERVER, $required_headers, '$_SERVER');
$data_ok = array_matches($data, $required_data, '$data');
if($headers_ok && $data_ok) {
        echo "your signature         : " . $_SERVER['HTTP_X_HUB_SIGNATURE'];
        echo PHP_EOL;
        echo "our generated signature: sha1=" . $signature;
        echo PHP_EOL;
        echo "verify";
}
else {
        http_response_code(403);
        die("Forbidden\n");
}
```

```
docker run -d --rm --name php -p 8080:80 -v $(pwd)/webhook.php:/var/www/html/index.php  php:apache
```

response headers
```
Content-Length: 148
Content-Type: text/plain;charset=UTF-8
Date: Fri, 23 Mar 2018 02:11:15 GMT
Server: Apache/2.4.25 (Debian)
Vary: Accept-Encoding
X-Powered-By: PHP/7.2.3
```
response body
```
your signature         : sha1=0c64be38c54d34ca4270862a8f06fe942702a285
our generated signature: sha1=0c64be38c54d34ca4270862a8f06fe942702a285
verify
```



https://github.com/rvagg/github-webhook-handler

https://blog.wadackel.me/2016/github-webhook-nodejs/
