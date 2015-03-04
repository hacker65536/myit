
```bash
cd /usr/local/src
wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz
tar zxvf yaml-0.1.4.tar.gz

cd yaml-0.1.4
./configure
make && make install
```

```
Libraries have been installed in:
   /usr/local/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the `-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the `LD_LIBRARY_PATH' environment variable
     during execution
   - add LIBDIR to the `LD_RUN_PATH' environment variable
     during linking
   - use the `-Wl,-rpath -Wl,LIBDIR' linker flag
   - have your system administrator add LIBDIR to `/etc/ld.so.conf'

See any operating system documentation about shared libraries for
more information, such as the ld(1) and ld.so(8) manual pages.
```

先にyamlをインストール  

```bash
cd /usr/local/src 
wget ftp://core.ring.gr.jp/pub/lang/ruby/ruby-1.9.3-p194.tar.gz
tar xzvf ruby-1.9.3-p194.tar.gz
cd ruby-1.9.3-p194
./configure
make
make install
make clean
```

```bash
cd /usr/local/src 
svn export http://redmine.rubyforge.org/svn/branches/2.0-stable redmine
cp -p redmine /path/dir
```

```bash
echo "/usr/local/lib" >> /etc/ld.so.conf.d/local.conf
```


```bash
cd redmine
bundle install 
gem install bundler --no-rdoc --no-ri
```


```
Package MagickCore was not found in the pkg-config search path.
Perhaps you should add the directory containing `MagickCore.pc'
to the PKG_CONFIG_PATH environment variable
No package 'MagickCore' found
```

がでるのでpathを通してから関連ツールをインストール

```bash
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
bundle install --without development test postgresql sqlite
```

```bash
rake generate_secret_token
```

database.ymlでmysqlのadapterをmysqlよりmysql2に変更  

テーブル作成  

```
RAILS_ENV=production rake db:migrate
```





```bash
gem install passenger --no-rdoc --no-ri
passenger-install-apache2-module
```

１を選択してインストール httpd-develが必要

```
Deploying a Ruby on Rails application: an example

Suppose you have a Rails application in /somewhere. Add a virtual host to your
Apache configuration file and set its DocumentRoot to /somewhere/public:

   <VirtualHost *:80>
      ServerName www.yourhost.com
      # !!! Be sure to point DocumentRoot to 'public'!
      DocumentRoot /somewhere/public
      <Directory /somewhere/public>
         # This relaxes Apache security settings.
         AllowOverride all
         # MultiViews must be turned off.
         Options -MultiViews
      </Directory>
   </VirtualHost>

And that's it! You may also want to check the Users Guide for security and
optimization tips, troubleshooting and other useful information:

  /usr/local/lib/ruby/gems/1.9.1/gems/passenger-3.0.12/doc/Users guide Apache.html

Enjoy Phusion Passenger, a product of Phusion (www.phusion.nl) :-)
http://www.modrails.com/

Phusion Passenger is a trademark of Hongli Lai & Ninh Bui.
```

```bash
vim /etc/httpd/conf.d/passenger.conf
```



 Passengerの基本設定。
 passenger-install-apache2-module --snippet を実行して表示される設定を使用。
 環境によって設定値が異なりますので以下の3行はそのまま転記しないでください。

```
LoadModule passenger_module /usr/local/lib/ruby/gems/1.9.1/gems/passenger-3.0.12/ext/apache2/mod_passenger.so
PassengerRoot /usr/local/lib/ruby/gems/1.9.1/gems/passenger-3.0.12
PassengerRuby /usr/local/bin/ruby
```


 Passengerが追加するHTTPヘッダを削除するための設定（任意）。

```
Header always unset "X-Powered-By"
Header always unset "X-Rack-Cache"
Header always unset "X-Content-Digest"
Header always unset "X-Runtime"
```


必要に応じてPassengerのチューニングのための設定を追加（任意）。

```
PassengerMaxPoolSize 20
PassengerMaxInstancesPerApp 4
PassengerPoolIdleTime 3600
PassengerUseGlobalQueue on
PassengerHighPerformance on
PassengerStatThrottleRate 10
RailsSpawnMethod smart
RailsAppSpawnerIdleTime 86400
RailsFrameworkSpawnerIdleTime 0
```


httpd.conf

```apache
 RailsEnv production
 RailsBaseURI /redmine
<Directory /var/www/html/redmine>
 AllowOverride all
      AuthType Basic
      AuthName "Authorization Realm"
      AuthBasicProvider ldap
      AuthzLDAPAuthoritative  on
      AuthLDAPUrl ldap://localhost/ou=People,dc=xxxx,dc=com?uid
      AuthLDAPGroupAttribute memberUid
      AuthLDAPGroupAttributeIsDN off
      Require  valid-user
</Directory>
```

```bash
ln -s /path/redmine/public /var/www/html/redmine
service httpd graceful
```



見やすいテーマの追加
```bash
cd /path/redmine
git clone git://github.com/farend/redmine_theme_farend_basic.git public/themes/farend_basic
```
