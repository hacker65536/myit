# elasticsearch install

5.6.0 require java8


install java8
```
sudo yum install java-1.8.0
sudo alternatives --set java  /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
```


```
curl -SsL -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.0.tar.gz
tar xf !$:t
cd !$:r:r
./bin/elasticsearch
```
