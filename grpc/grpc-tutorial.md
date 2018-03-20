
require git docker node


install git docker node
------------
```
yum install -y git docker 
```

```
systemctl start docker
```
```
git clone https://github.com/riywo/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(anyenv init -)"' >> ~/.bashrc
exec $SHELL -l
anyenv install ndenv
exec $SHELL -l
ndenv install v6.6.0
ndenv global v6.6.0
```

download grpc sample
---------
https://github.com/grpc/grpc/tree/master/examples/node
```
git clone -b $(curl -Ss -L https://grpc.io/release) https://github.com/grpc/grpc
cd !$:t/examples/node
npm install
cd ..
```

run nginx
-------
`Dockerfile`
```Dockerfile
FROM alpine:3.7

LABEL maintainer="NGINX Docker Maintainers <docker-maint@nginx.com>"

ENV NGINX_VERSION 1.13.10

RUN GPG_KEYS=B0F4253373F8F6F510D42178520A9993A1C052F8 \
        && CONFIG="\
                --prefix=/etc/nginx \
                --sbin-path=/usr/sbin/nginx \
                --modules-path=/usr/lib/nginx/modules \
                --conf-path=/etc/nginx/nginx.conf \
                --error-log-path=/var/log/nginx/error.log \
                --http-log-path=/var/log/nginx/access.log \
                --pid-path=/var/run/nginx.pid \
                --lock-path=/var/run/nginx.lock \
                --http-client-body-temp-path=/var/cache/nginx/client_temp \
                --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
                --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
                --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
                --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
                --user=nginx \
                --group=nginx \
                --with-http_ssl_module \
                --with-http_realip_module \
                --with-http_addition_module \
                --with-http_sub_module \
                --with-http_dav_module \
                --with-http_flv_module \
                --with-http_mp4_module \
                --with-http_gunzip_module \
                --with-http_gzip_static_module \
                --with-http_random_index_module \
                --with-http_secure_link_module \
                --with-http_stub_status_module \
                --with-http_auth_request_module \
                --with-http_xslt_module=dynamic \
                --with-http_image_filter_module=dynamic \
                --with-http_geoip_module=dynamic \
                --with-threads \
                --with-stream \
                --with-stream_ssl_module \
                --with-stream_ssl_preread_module \
                --with-stream_realip_module \
                --with-stream_geoip_module=dynamic \
                --with-http_slice_module \
                --with-mail \
                --with-mail_ssl_module \
                --with-compat \
                --with-file-aio \
                --with-http_v2_module \
        " \
        && addgroup -S nginx \
        && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx \
        && apk add --no-cache --virtual .build-deps \
                gcc \
                libc-dev \
                make \
                openssl-dev \
                pcre-dev \
                zlib-dev \
                linux-headers \
                curl \
                gnupg \
                libxslt-dev \
                gd-dev \
                geoip-dev \
        && curl -SsL -O https://hg.nginx.org/nginx/archive/tip.tar.gz \
        && mkdir -p /usr/src \
        && tar zxvf tip.tar.gz -C /usr/src/ \
        && ls -la /usr/src \
        && rm tip.tar.gz \
        && cd /usr/src/nginx-* \
        && ./auto/configure $CONFIG --with-debug \
        && make -j$(getconf _NPROCESSORS_ONLN) \
        && mv objs/nginx objs/nginx-debug \
        && mv objs/ngx_http_xslt_filter_module.so objs/ngx_http_xslt_filter_module-debug.so \
        && mv objs/ngx_http_image_filter_module.so objs/ngx_http_image_filter_module-debug.so \
        && mv objs/ngx_http_geoip_module.so objs/ngx_http_geoip_module-debug.so \
        && mv objs/ngx_stream_geoip_module.so objs/ngx_stream_geoip_module-debug.so \
        && ./auto/configure $CONFIG \
        && make -j$(getconf _NPROCESSORS_ONLN) \
        && make install \
        && rm -rf /etc/nginx/html/ \
        && mkdir /etc/nginx/conf.d/ \
        && mkdir -p /usr/share/nginx/html/ \
        && install -m644 docs/html/index.html /usr/share/nginx/html/ \
        && install -m644 docs/html/50x.html /usr/share/nginx/html/ \
        && install -m755 objs/nginx-debug /usr/sbin/nginx-debug \
        && install -m755 objs/ngx_http_xslt_filter_module-debug.so /usr/lib/nginx/modules/ngx_http_xslt_filter_module-debug.so \
        && install -m755 objs/ngx_http_image_filter_module-debug.so /usr/lib/nginx/modules/ngx_http_image_filter_module-debug.so \
        && install -m755 objs/ngx_http_geoip_module-debug.so /usr/lib/nginx/modules/ngx_http_geoip_module-debug.so \
        && install -m755 objs/ngx_stream_geoip_module-debug.so /usr/lib/nginx/modules/ngx_stream_geoip_module-debug.so \
        && ln -s ../../usr/lib/nginx/modules /etc/nginx/modules \
        && strip /usr/sbin/nginx* \
        && strip /usr/lib/nginx/modules/*.so \
        && rm -rf /usr/src/nginx-$NGINX_VERSION \
        \
        # Bring in gettext so we can get `envsubst`, then throw
        # the rest away. To do this, we need to install `gettext`
        # then move `envsubst` out of the way so `gettext` can
        # be deleted completely, then move `envsubst` back.
        && apk add --no-cache --virtual .gettext gettext \
        && mv /usr/bin/envsubst /tmp/ \
        \
        && runDeps="$( \
                scanelf --needed --nobanner --format '%n#p' /usr/sbin/nginx /usr/lib/nginx/modules/*.so /tmp/envsubst \
                        | tr ',' '\n' \
                        | sort -u \
                        | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
        )" \
        && apk add --no-cache --virtual .nginx-rundeps $runDeps \
        && apk del .build-deps \
        && apk del .gettext \
        && mv /tmp/envsubst /usr/local/bin/ \
        \
        # Bring in tzdata so users could set the timezones through the environment
        # variables
        && apk add --no-cache tzdata \
        \
        # forward request and error logs to docker log collector
        && ln -sf /dev/stdout /var/log/nginx/access.log \
        && ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/nginx.conf
#COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
```
`nginx.conf`
```nginx
worker_processes  1;
events {
    worker_connections  1024;
}
http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;
    server {
        listen       80 http2;
        server_name  localhost;
        location / {
            root   html;
            index  index.html index.htm;
        }
        location /helloworld.Greeter {
          grpc_pass grpc://172.17.0.3:50051;
        }
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
}
```

```
docker build -t grpcnginx .
```

```
docker run -d --rm --name grpcnginx -p 80:80 grpcnginx
```

run node
-----
```
docker run -d --rm -it  \
--name grpcnode --link grpcnginx \
--expose 50051 \
-v ~/grpc/examples:/usr/src/myapp \
-w /usr/src/myapp grpc/node \
node node/dynamic_codegen/greeter_server.js
```
```
docker inspect --format '{{ .NetworkSettings.IPAddress }}' grpcnode
```

configure nginx if need
-------
```
docker exec -it $(docker ps -q -f name=grpcnginx) sh
```
```
vim /etc/nginx/nginx.conf
```
```
docker kill -s HUP $(docker ps -q -f name=grpcnginx)
```

docker ps
---------
```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
8e211adfd09d        grpc/node           "node node/dynamic..."   4 minutes ago       Up 4 minutes        50051/tcp            grpcnode
8426846e4316        grpcnginx           "nginx -g 'daemon ..."   4 minutes ago       Up 4 minutes        0.0.0.0:80->80/tcp   grpcnginx
```
call grpc
---------
```
vim ~/grpc/examples/node/dynamic_codegen/greeter_client.js
```
```js
var PROTO_PATH = __dirname + '/../../protos/helloworld.proto';

var grpc = require('grpc');
var hello_proto = grpc.load(PROTO_PATH).helloworld;

function main() {
  var client = new hello_proto.Greeter('localhost:80',
                                       grpc.credentials.createInsecure());
  var user;
  if (process.argv.length >= 3) {
    user = process.argv[2];
  } else {
    user = 'world';
  }
  client.sayHello({name: user}, function(err, response) {
    console.log('Greeting:', response.message);
  });
}

main();
```
```
node ~/grpc/examples/node/dynamic_codegen/greeter_client.js 
Greeting: Hello world
```
