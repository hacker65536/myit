#Singleton

##relevant pattern
- Abstract Factory
- Builder
- Facade

##UML(Class diagram)
|Class| Singleton |
|-------|--------|
| **Attributes** |- instance : Singleton = null|
| **Methods** |+ getinstance() : Singleton <br /> - Singleton() : void|

###java

`lazy initialization`  
Singleton.java
```java
public class Singleton {
  private static volatile Singleton instance = null;
  private Singleton() {};
  public static Singleton getInstance() {
    if (instance == null) {
      synchronized (Singleton.class) {
        if (instance == null) {
          instance = new Singleton();
        }
      }
    }
    return instance;
  }
}
```
`simpler version may be used ath the expense concurrency in a multithreaded environment`  
Singleton.java
```java
public class Singleton {
    private static Singleton instance = null;
    private Singleton() { }
 
    public static synchronized Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton();
        }
 
        return instance;
    }
}
```
`Eager initialization`  
Singleton.java
```java
public class Singleton {
    private static final Singleton INSTANCE = new Singleton();
 
    private Singleton() {}
 
    public static Singleton getInstance() {
        return INSTANCE;
    }
}
```
`Static block initialization`  
Singleton.java
```java
public class Singleton {
    private static final Singleton instance;
 
    static {
        try {
            instance = new Singleton();
        } catch (Exception e) {
            throw new RuntimeException("Darn, an error occurred!", e);
        }
    }
 
    public static Singleton getInstance() {
        return instance;
    }
 
    private Singleton() {
        // ...
    }
}
```
`Initialization-on-demand holder idiom`  
Singleton.java
```java
public class Singleton {
        // Private constructor. Prevents instantiation from other classes.
        private Singleton() { }
 
        /**
         * Initializes singleton.
         *
         * SingletonHolder is loaded on the first execution of Singleton.getInstance()
         * or the first access to SingletonHolder.INSTANCE, not before.
         */
        private static class SingletonHolder {
                private static final Singleton INSTANCE = new Singleton();
        }
 
        public static Singleton getInstance() {
                return SingletonHolder.INSTANCE;
        }
}
```
`The enum way`  
Singleton.java
```java
public enum Singleton {
    INSTANCE;
    public void execute (String arg) {
        // Perform operation here 
    }
}
```
###php

ref http://www.phptherightway.com/pages/Design-Patterns.html  

```php
<?php
class Singleton {
    /**
     * Returns the *Singleton* instance of this class.
     *
     * @staticvar Singleton $instance The *Singleton* instances of this class.
     *
     * @return Singleton The *Singleton* instance.
     */
    public static function getInstance() {
        static $instance = null;
        if (null === $instance) {
            $instance = new static();
        }
        return $instance;
    }
    /**
     * Protected constructor to prevent creating a new instance of the
     * *Singleton* via the `new` operator from outside of this class.
     */
    protected function __construct() {
    }
    /**
     * Private clone method to prevent cloning of the instance of the
     * *Singleton* instance.
     *
     * @return void
     */
    private function __clone() {
    }
    /**
     * Private unserialize method to prevent unserializing of the *Singleton*
     * instance.
     *
     * @return void
     */
    private function __wakeup() {
    }
}
class SingletonChild extends Singleton {
}
$obj = Singleton::getInstance();
var_dump($obj === Singleton::getInstance()); // bool(true)
$anotherObj = SingletonChild::getInstance();
var_dump($anotherObj === Singleton::getInstance()); // bool(false)
var_dump($anotherObj === SingletonChild::getInstance()); // bool(true)

```
