1. repostitory
2. settings
3. webhooks
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


https://github.com/rvagg/github-webhook-handler

https://blog.wadackel.me/2016/github-webhook-nodejs/
