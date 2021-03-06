# mysql_secure_installation

https://dev.mysql.com/doc/refman/8.0/en/mysql-secure-installation.html

prepare new password
```console
$ mkpasswd -s 1 -l 12
uat9xxYw6Hq'
```

interact mode
```
$ mysql_secure_installation 
```

non interact mode -D or --user-default  
first time you have to renew password,because initial random password generated by mysqld has expired.
```
$ mysql_secure_installation -p<init_password> -D
mysql_secure_installation: [Warning] Using a password on the command line interface can be insecure.

Securing the MySQL server deployment.


The existing password for the user account root has expired. Please set a new password.

New password:

Re-enter new password:
The 'validate_password' component is installed on the server.
The subsequent steps will run with the existing configuration
of the component.
By default, a MySQL installation has an anonymous user,
allowing anyone to log into MySQL without having to have
a user account created for them. This is intended only for
testing, and to make the installation go a bit smoother.
You should remove them before moving into a production
environment.

Remove anonymous users? (Press y|Y for Yes, any other key for No) :  y
Success.


Normally, root should only be allowed to connect from
'localhost'. This ensures that someone cannot guess at
the root password from the network.

Disallow root login remotely? (Press y|Y for Yes, any other key for No) :  y
Success.

By default, MySQL comes with a database named 'test' that
anyone can access. This is also intended only for testing,
and should be removed before moving into a production
environment.


Remove test database and access to it? (Press y|Y for Yes, any other key for No) :  y
 - Dropping test database...
Success.

 - Removing privileges on test database...
Success.

Reloading the privilege tables will ensure that all changes
made so far will take effect immediately.

Reload privilege tables now? (Press y|Y for Yes, any other key for No) :  y
Success.

All done!
```
