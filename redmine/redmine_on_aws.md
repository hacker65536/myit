
#env
```bash
uname -a
Linux ip-10-1-1-237 3.14.27-25.47.amzn1.x86_64 #1 SMP Wed Dec 17 18:36:15 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
```
#install

dont use root

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
sudo yum iinstall -y mysql-devel
gem install mysql2 -v '0.3.18'
```

##gem bundle
```bash
bundle install --without development test
```
