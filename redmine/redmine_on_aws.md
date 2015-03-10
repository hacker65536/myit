
#env
```bash
uname -a
Linux ip-10-1-1-237 3.14.27-25.47.amzn1.x86_64 #1 SMP Wed Dec 17 18:36:15 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
```
#install

use account of ec2-user

##download and extract
```bash
wget "http://www.redmine.org/releases/redmine-3.0.0.tar.gz"
tar zxvf redmine-3.0.0.tar.gz
cd redmine-3.0.0
```

##install gem bundler
```bash
sudo yum install -y ruby-devel gcc 
gem install bundler
```

##gem json
```bash
gem install json -v '1.8.2'
```

##gem nokogiri
```bash
sudo yum install -y patch zlib-devel
gem install nokogiri -v '1.6.6.2'
```

##gem rmagick
```bash
sudo yum install -y ImageMagick-devel
gem install rmagick -v '2.13.4'
```
##gem mysql2
```bash
sudo yum install -y mysql-devel
gem install mysql2 -v '0.3.18'
```


##config mysql adapter 
```bash
cp config/database.yml.example config/database.yml
vim config/database.yml
```

edit  
```
production:
  adapter: mysql2
  database: redmine
  host: localhost
  username: root
  password: ""
  encoding: utf8
```

##gem bundle
after edit database.yml  
```bash
bundle install --without development test
```

if you want install current directory
```bash
bundle install --without development test --path vendor/bundle
```

##session store
```bash
rake generate_secret_token
```

##create table
```bash
RAILS_ENV=production rake db:migrate
```


##make mod_passenger.so for apache

```bash
cd
sudo yum install -y gcc-c++ curl-devel httpd24-devel
gem install passenger
passenger-install-apache2-module
```

##config httpd.conf

`vim /etc/httpd/conf.d/redmine.conf`  
```apache
 LoadModule passenger_module /home/ec2-user/.gem/ruby/2.0/gems/passenger-4.0.59/buildout/apache2/mod_passenger.so
   <IfModule mod_passenger.c>
     PassengerRoot /home/ec2-user/.gem/ruby/2.0/gems/passenger-4.0.59
     PassengerDefaultRuby /usr/bin/ruby2.0
   </IfModule>


   <VirtualHost *:80>
      ServerName redmine.mydomain.com
      # !!! Be sure to point DocumentRoot to 'public'!
      DocumentRoot /var/www/redmine/public
   RailsEnv production
   RailsBaseURI /
      <Directory /var/www/redmine/public>
         # This relaxes Apache security settings.
         AllowOverride all
         # MultiViews must be turned off.
         Options -MultiViews
         # Uncomment this if you're on Apache >= 2.4:
         #Require all granted
      </Directory>
   </VirtualHost>
```

check module path 
```bash
passenger-install-apache2-module --snippet
```



