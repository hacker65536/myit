
```
$ pecl install zip
PHP Parse error:  syntax error, unexpected 'new' (T_NEW) in /usr/share/pear/PEAR/Frontend.php on line 91
```

```php
        if (class_exists($uiclass)) {
            $obj = &new $uiclass;
            // quick test to see if this class implements a few of the most
            // important frontend methods
            if (is_a($obj, 'PEAR_Frontend')) {
                $GLOBALS['_PEAR_FRONTEND_SINGLETON'] = &$obj;
                $GLOBALS['_PEAR_FRONTEND_CLASS'] = $uiclass;
                return $obj;
            }

            $err = PEAR::raiseError("not a frontend class: $uiclass");
            return $err;
        }
```
`&new' => 'new'


```
$ pear -V
PHP Parse error:  syntax error, unexpected 'new' (T_NEW) in /usr/share/pear/PEAR/Config.php on line 664
```

again and again

```
$ pear -V
PHP Fatal error:  Uncaught Error: Call to undefined function set_magic_quotes_runtime() in /usr/share/pear/PEAR/Config.php:1046
Stack trace:
#0 /usr/share/pear/PEAR/Config.php(909): PEAR_Config->_readConfigDataFrom('/etc/pear.conf')
#1 /usr/share/pear/PEAR/Config.php(645): PEAR_Config->mergeConfigFile('/etc/pear.conf', false, 'system', true)
#2 /usr/share/pear/PEAR/Config.php(713): PEAR_Config->PEAR_Config('/home/ec2-user/...', '/etc/pear.conf', false, true)
#3 /usr/share/pear/pearcmd.php(113): PEAR_Config::singleton('', '')
#4 {main}
  thrown in /usr/share/pear/PEAR/Config.php on line 1046
```




