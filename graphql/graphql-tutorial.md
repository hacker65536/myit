http://graphql.org/graphql-js/running-an-express-graphql-server/

```console
$ mkdir graphql
$ cd $
```

```console
$ npm install express express-graphql graphql --save
npm WARN saveError ENOENT: no such file or directory, open '/home/ec2-user/graphql/package.json'
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN enoent ENOENT: no such file or directory, open '/home/ec2-user/graphql/package.json'
npm WARN graphql No description
npm WARN graphql No repository field.
npm WARN graphql No README data
npm WARN graphql No license field.

+ express-graphql@0.6.12
+ graphql@0.13.2
+ express@4.16.3
added 53 packages in 1.517s
```


```console
$ cat <<'EOF' > server.js
var express = require('express');
var graphqlHTTP = require('express-graphql');
var { buildSchema } = require('graphql');

// Construct a schema, using GraphQL schema language
var schema = buildSchema(`
  type Query {
    hello: String
  }
`);

// The root provides a resolver function for each API endpoint
var root = {
  hello: () => {
    return 'Hello world!';
  },
};

var app = express();
app.use('/graphql', graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true,
}));
app.listen(4000);
console.log('Running a GraphQL API server at localhost:4000/graphql');
EOF
```

```console
$ node server.js
Running a GraphQL API server at localhost:4000/graphql
```

access to `http://localhost:4000/graphql` or
```console
$ curl -X POST -H "Content-Type: application/json" -d '{"query": "{ hello }"}' http://localhost:4000/graphql
{"data":{"hello":"Hello world!"}}
```
