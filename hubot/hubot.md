# hubot

https://github.com/hubotio/hubot



install
--


```
$ npm install -g yo generator-hubot
```

```
$ mkdir myhubot && cd $!
```

```
$ yo hubot
```

`owner` `name` `description` `adapter`(slack)


`scripts/hello.coffee`
```coffee
  robot.hear(/hello/i, (res) ->
    res.send "#{res.message.user.name}"
  )
```

add app
--

search and add app on slack website


run bot
--

```
$ HUBOT_SLACK_TOKEN=xoxb-xxxxxxxxxxxxxxxxxxxM npx hubot --adapter slack
```
