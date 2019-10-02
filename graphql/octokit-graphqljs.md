# octokit/graphql.js

https://github.com/octokit/graphql.js


```js
const {graphql} = require('@octokit/graphql');
const graphqlWithAuth = graphql.defaults({
  headers: {
    authorization: `token exampletoken0000000000000000000`,
  },
});

async function getusername() {
  const viewer = await graphqlWithAuth(`
{
  viewer {
    login
  }
}
`);
  return viewer;
}

getusername().then(res => {
  //console.log(res);
  //output: { viewer: { login: 'hacker65536' } }
  console.log(res.viewer.login);
});
```


```console
$ node index.js
hacker65536
```
