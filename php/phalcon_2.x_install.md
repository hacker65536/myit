##install

###amzlinx

`require php-pdo` 

```bash
yum install -y php56 php56-devel php56-pdo php56-mbstring gcc git
```

```bash
git clone https://github.com/phalcon/cphalcon.git
cd cphalcon/build/
./install
```

```bash
echo "extension=phalcon.so" > /etc/php.d/40-phalcon.ini
```

```bash
php -i |grep phalcon
```
