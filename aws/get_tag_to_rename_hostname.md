#needed

- jq (to parse the json from api of the aws)
- aws-cli  (aws command line interface)
- aws-apitools-* (clients of api of aws)

##jq
install

```bash
yum install -y git gcc flex bison autoconf automake libtool oniguruma-devel
cd /usr/local/src
git clone https://github.com/stedolan/jq.git
cd jq
autoreconf -i
./configure
make
make install
```

if you have this error message

```bash
checking for bison version... 2.4.1
configure: error: You need bison version 3.0 or greater.
```

change revision and do ./configure again

```bash
git checkout 3e1baf59167d6e7d836ec39d353eec1022331a6d
```
