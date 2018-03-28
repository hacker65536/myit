
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

get block
--------
```
> eth.getBlock(0)
```
```js
{
  difficulty: 16384,
  extraData: "0x",
  gasLimit: 134217728,
  gasUsed: 0,
  hash: "0x7b2e8be699df0d329cc74a99271ff7720e2875cd2c4dd0b419ec60d1fe7e0432",
  logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  miner: "0x3333333333333333333333333333333333333333",
  mixHash: "0x0000000000000000000000000000000000000000000000000000000000000000",
  nonce: "0x0000000000000042",
  number: 0,
  parentHash: "0x0000000000000000000000000000000000000000000000000000000000000000",
  receiptsRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  sha3Uncles: "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
  size: 507,
  stateRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  timestamp: 0,
  totalDifficulty: 16384,
  transactions: [],
  transactionsRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  uncles: []
}
```

show account
----------
```
> eth.accounts
[]
```

create account and show list
---------
```
> personal.newAccount("pwduser1")
"0xcc50215c5c6b8d87a29eb01efa56ae351ace519c"
> personal.newAccount("pwduser2")
"0x6fd5b390a815234141865124d6e03b99cc7ff279"
> eth.accounts
["0xcc50215c5c6b8d87a29eb01efa56ae351ace519c", "0x6fd5b390a815234141865124d6e03b99cc7ff279"]
```

coinbase
------
```
> eth.coinbase
"0xcc50215c5c6b8d87a29eb01efa56ae351ace519c"
```


mining start and stop
-----
```
> miner.start()
null
> eth.mining
true
```
```
> eth.blockNumber
8
```
```
> miner.stop()
true
> eth.mining
false
```

show block
```
> eth.blockNumber
58
> eth.getBlock(57)
{
  difficulty: 134615,
  extraData: "0xd783010804846765746887676f312e392e32856c696e7578",
  gasLimit: 126947386,
  gasUsed: 0,
  hash: "0xff515be13c4d2df309fe3081da69be031d783311bcce1295971a3c60b9626bcb",
  logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  miner: "0xcc50215c5c6b8d87a29eb01efa56ae351ace519c",
  mixHash: "0x329563e9ccfb026c3e3eb20e0560e12b030ae1250503b724a2bfd06a9fdb0d8b",
  nonce: "0x0dff71762cedaeb0",
  number: 57,
  parentHash: "0xd4b62bdf569225af2b7e2c1909d80e278e25d36913090f9c8b45c947076908f3",
  receiptsRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  sha3Uncles: "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
  size: 536,
  stateRoot: "0x4fbf272c2d3c070515f3ca5bdd6837b5a1f111e00441adc21097ff8713a7f7a5",
  timestamp: 1522200919,
  totalDifficulty: 7586324,
  transactions: [],
  transactionsRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  uncles: []
}
> eth.getBlock(58)
{
  difficulty: 134680,
  extraData: "0xd783010804846765746887676f312e392e32856c696e7578",
  gasLimit: 126823415,
  gasUsed: 0,
  hash: "0x02a4ddb4667e4a33a61f0331f7016e77a82ea4a116cb292cd04a388b374c4cd2",
  logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  miner: "0xcc50215c5c6b8d87a29eb01efa56ae351ace519c",
  mixHash: "0xc31e5560fbeb0a633e56dd95446bf5abae2ea108ceeb0a894e0579554962cc26",
  nonce: "0x461f1fde2cdbc16a",
  number: 58,
  parentHash: "0xff515be13c4d2df309fe3081da69be031d783311bcce1295971a3c60b9626bcb",
  receiptsRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  sha3Uncles: "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
  size: 536,
  stateRoot: "0xa13514b95800ca8c72cf8064bfc116bdf4e9c54793a12a028114d90560e755b8",
  timestamp: 1522200923,
  totalDifficulty: 7721004,
  transactions: [],
  transactionsRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  uncles: []
}
```

check account balances
-----
```
> eth.getBalance(eth.accounts[0])
290000000000000000000
> web3.fromWei(eth.getBalance(eth.accounts[0]),"ether")
290
```

send transaction (unlock and send)
-----
```
> personal.unlockAccount(eth.accounts[0])
Unlock account 0xcc50215c5c6b8d87a29eb01efa56ae351ace519c
Passphrase:
true

> eth.sendTransaction({from: eth.accounts[0], to: eth.accounts[1], value: web3.toWei(5, "ether")})
"0xda4b02e0ec2be529b461ad037bb8c40d99fa35bd25bd706e3a313b20e9832a95"
```

