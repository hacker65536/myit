# github api v4


https://developer.github.com/v4/explorer/


GraphiQL

https://developer.github.com/v4/object/user/

request response
```graphql
{
  viewer {
    name
  }
}
```

```graphql
{
  "data": {
    "viewer": {
      "name": "hacker65536"
    }
  }
}
```


```graphql
{
  viewer {
    ...frag
  }
}

fragment frag on User {
  name
  email
  createdAt
}
```
```graphql
{
  "data": {
    "viewer": {
      "name": "hacker65536",
      "email": "s.hacker65536@gmail.com",
      "createdAt": "2012-10-17T02:22:16Z"
    }
  }
}
```
