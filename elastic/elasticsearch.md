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


docker 
```
# docker pull docker.elastic.co/elasticsearch/elasticsearch:5.6.0
docker run -p 9200:9200 -e "http.host=0.0.0.0" -e "transport.host=127.0.0.1" docker.elastic.co/elasticsearch/elasticsearch:5.6.0
```
