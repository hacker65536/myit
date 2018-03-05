http://scalameta.org/scalafmt/


via sbt 


```
cat <<'EOF'> project/plugins.sbt
addSbtPlugin("com.geirsson" % "sbt-scalafmt" % "1.4.0")
EOF
```
```
sbt
[info] Loading settings from plugins.sbt ...
[info] Loading project definition from /home/ec2-user/sc/hello/project
[info] Loading settings from build.sbt ...
[info] Set current project to Hello (in build file:/home/ec2-user/sc/hello/)
[info] sbt server started at local:///home/ec2-user/.sbt/1.0/server/58aa032d046b3cd2d0f5/sock
sbt:Hello> scalafmt
[success] Total time: 1 s, completed Mar 5, 2018 4:59:23 AM
sbt:Hello>
```


before

```scala
package example

object Hello extends Greeting with App {
println(greeting)
}






trait Greeting {
lazy val greeting: String = "hello"
}
```

after
```scala
package example

object Hello extends Greeting with App {
  println(greeting)
}

trait Greeting {
  lazy val greeting: String = "hello"
}
```
