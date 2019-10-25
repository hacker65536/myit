

```
$ javac -version
javac 1.8.0_222
```


```
$ mkdir javasample
```


```java
public class HelloWorld {
        public static void main( String args[]) {
                System.out.println("Hello World!");
        }
}
```

```console
$ javac HelloWorld.java
```

```console
$ ls -l
total 8
-rw-rw-r-- 1 ec2-user ec2-user 426 Oct 25 07:10 HelloWorld.class
-rw-rw-r-- 1 ec2-user ec2-user 113 Oct 25 07:07 HelloWorld.java
```

```console
$ java HelloWorld
Hello World!
```
