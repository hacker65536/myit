
about golang
-------
```
# go version
go version go1.9.2 linux/amd64
# go env
GOARCH="amd64"
GOBIN=""
GOEXE=""
GOHOSTARCH="amd64"
GOHOSTOS="linux"
GOOS="linux"
GOPATH="/root/go"
GORACE=""
GOROOT="/usr/lib/golang"
GOTOOLDIR="/usr/lib/golang/pkg/tool/linux_amd64"
GCCGO="gccgo"
CC="gcc"
GOGCCFLAGS="-fPIC -m64 -pthread -fmessage-length=0 -fdebug-prefix-map=/tmp/go-build805789645=/tmp/go-build -gno-record-gcc-switches"
CXX="g++"
CGO_ENABLED="1"
CGO_CFLAGS="-g -O2"
CGO_CPPFLAGS=""
CGO_CXXFLAGS="-g -O2"
CGO_FFLAGS="-g -O2"
CGO_LDFLAGS="-g -O2"
PKG_CONFIG="pkg-config"
```

install geth
-------------
```
git clone https://github.com/ethereum/go-ethereum.git
cd !$:t:r
make geth
make all
alias geth=~/go-ethereum/build/bin/geth
```

make genesis file
-------------
```
mkdir eth_private_net
cat <<'EOF' > eth_private_net/myGenesis.json
{
  "config": {
    "chainId": 15
  },
  "nonce": "0x0000000000000042",
  "timestamp": "0x0",
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "extraData": "",
  "gasLimit": "0x8000000",
  "difficulty": "0x4000",
  "mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "coinbase": "0x3333333333333333333333333333333333333333",
  "alloc": {}
}
EOF
```

init
------------
```
geth --datadir ~/eth_private_net init ~/eth_private_net/myGenesis.json
```
```
INFO [03-28|01:26:58] Maximum peer count                       ETH=25 LES=0 total=25
INFO [03-28|01:26:58] Allocated cache and file handles         database=/root/eth_private_net/geth/chaindata cache=16 handles=16
INFO [03-28|01:26:58] Writing custom genesis block
INFO [03-28|01:26:58] Persisted trie from memory database      nodes=0 size=0.00B time=3.368µs gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [03-28|01:26:58] Successfully wrote genesis state         database=chaindata                            hash=7b2e8b…7e0432
INFO [03-28|01:26:58] Allocated cache and file handles         database=/root/eth_private_net/geth/lightchaindata cache=16 handles=16
INFO [03-28|01:26:58] Writing custom genesis block
INFO [03-28|01:26:58] Persisted trie from memory database      nodes=0 size=0.00B time=3.038µs gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
INFO [03-28|01:26:58] Successfully wrote genesis state         database=lightchaindata                            hash=7b2e8b…7e0432
```

run geth
------
```
geth --networkid "15" --nodiscover --datadir "~/eth_private_net" console 2>> ~/eth_private_net/geth_err.log
```

```
Welcome to the Geth JavaScript console!

instance: Geth/v1.8.4-unstable-80449719/linux-amd64/go1.9.2
 modules: admin:1.0 debug:1.0 eth:1.0 miner:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

>
```
