```
sudo yum install -y gcc
cd /usr/local/src
sudo wget http://download.redis.io/releases/redis-3.2.4.tar.gz
sudo tar zxvf redis-3.2.4.tar.gz
cd redis-3.2.4
sudo make
sudo make install

sudo yum install -y php56 php56-pecl-redis

sudo mkdir /etc/redis
sudo mkdir /var/redis 
sudo mkdir /var/redis/6379

cd /usr/local/src/redis-3.2.4
sudo cp utils/redis_init_script /etc/init.d/redis_6379
sudo cp redis.conf /etc/redis/6379.conf

sudo sed -e 's/daemonize no/daemonize yes/' -i /etc/redis/6379.conf

# as needed
# sudo sed -e 's:^logfile "":logfile "/var/log/redis_6379.log":' -i /etc/redis/6379.conf 

sudo /etc/init.d/redis_6379 start

```
