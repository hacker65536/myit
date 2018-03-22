1. repostitory
2. settings
3. webhooks
4. input server address to Payload URL
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
