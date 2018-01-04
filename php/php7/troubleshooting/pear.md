

```
[ec2-user@ip-172-31-45-63 ~]$ cat /etc/system-release
Amazon Linux release 2.0 (2017.12) LTS Release Candidate
[ec2-user@ip-172-31-45-63 ~]$ amazon-linux-extras list
  0  ansible2   disabled  [ =2.4.2 ]
  1  emacs   disabled  [ =25.3 ]
  2  memcached1.5   disabled  [ =1.5.1 ]
  3  nginx1.12=latest  enabled  [ =1.12.2 ]
  4  postgresql9.6   disabled  [ =9.6.6 ]
  5  python3   disabled  [ =3.6.2 ]
  6  redis4.0   disabled  [ =4.0.5 ]
  7  R3.4   disabled  [ =3.4.3 ]
  8  rust1   disabled  [ =1.22.1 ]
  9  vim=latest  enabled  [ =8.0 ]
 10  golang1.9   disabled  [ =1.9.2 ]
 11  ruby2.4   disabled  [ =2.4.2 ]
 12  nano   disabled  [ =2.9.1 ]
 13  php7.2=latest  enabled  [ =7.2.0 ]
 14  lamp-mariadb10.2-php7.2   disabled  [ =10.2.10_7.2.0 ]
```

```
sudo yum install php-pear
```

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




