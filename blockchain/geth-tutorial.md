
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
> personal.newAccount("pwuser1")
"0x16b2c699c083a0ad8f854be1cd896b4905ef0b30"
> personal.newAccount("pwuser2")
"0x4567252a19264056921e95975833a7d6824890dc"

> eth.accounts
["0x16b2c699c083a0ad8f854be1cd896b4905ef0b30", "0x4567252a19264056921e95975833a7d6824890dc"]
```

coinbase
------
```
> eth.coinbase
"0x16b2c699c083a0ad8f854be1cd896b4905ef0b30"
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
249
> eth.getBlock(248)
{
  difficulty: 147667,
  extraData: "0xd783010804846765746887676f312e392e32856c696e7578",
  gasLimit: 105336596,
  gasUsed: 0,
  hash: "0x39bae967654765e509257e429a37358cd3da43f180b3f044ab7c0971c0ced95e",
  logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  miner: "0x16b2c699c083a0ad8f854be1cd896b4905ef0b30",
  mixHash: "0x4dd3c41a848fe493ee877bb641d78c9d4da57f6546404e7ee359f9da2152aee2",
  nonce: "0x52d05433090aca5c",
  number: 248,
  parentHash: "0xd679a89b1c31ce30915c5240dd09245b000fd129a922ec53aa9e840b08d67465",
  receiptsRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  sha3Uncles: "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
  size: 537,
  stateRoot: "0xf9215a1cca8a96670d2c573e1b3ef2963b7618cc42bb96ff5a806874a80f9f19",
  timestamp: 1522202444,
  totalDifficulty: 34531503,
  transactions: [],
  transactionsRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  uncles: []
}
> eth.getBlock(249)
{
  difficulty: 147739,
  extraData: "0xd783010804846765746887676f312e392e32856c696e7578",
  gasLimit: 105233730,
  gasUsed: 0,
  hash: "0xab8a60f8f8ca224455d6b555d46633e05f174bf371d7f397bba259e2b596a94f",
  logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  miner: "0x16b2c699c083a0ad8f854be1cd896b4905ef0b30",
  mixHash: "0xbf61fd3d66e113bc83acb2a35a9e3e562f802694d8ea07171fac0e8a0c73ec19",
  nonce: "0x53e52c915d6ed11e",
  number: 249,
  parentHash: "0x39bae967654765e509257e429a37358cd3da43f180b3f044ab7c0971c0ced95e",
  receiptsRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  sha3Uncles: "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
  size: 537,
  stateRoot: "0x260dc328930cc912039688b91a3e4643da3454e835f5d16550eaa97da1a9e643",
  timestamp: 1522202445,
  totalDifficulty: 34679242,
  transactions: [],
  transactionsRoot: "0x56e81f171bcc55a6ff8345e692c0f86e5b48e01b996cadc001622fb5e363b421",
  uncles: []
}
```

check account balances
-----
```
> eth.getBalance(eth.accounts[0])
1.24e+21
> web3.fromWei(eth.getBalance(eth.accounts[0]),"ether")
1240
```

send transaction (unlock and send)
-----
```
> personal.unlockAccount(eth.accounts[0])
Unlock account 0xcc50215c5c6b8d87a29eb01efa56ae351ace519c
Passphrase:
true

> eth.getBalance(eth.accounts[0])
670000000000000000000
> eth.getBalance(eth.accounts[1])
0
> eth.sendTransaction({from: eth.accounts[0], to: eth.accounts[1], value: web3.toWei(5, "ether")})
"0x0261431da2f61746eec060569a4fd902833e886f4187e42223ffbbf7e1acdc2d"
> eth.getBalance(eth.accounts[1])
5000000000000000000
>
```
check transaction
-------
```
> eth.getTransaction('0x0261431da2f61746eec060569a4fd902833e886f4187e42223ffbbf7e1acdc2d')
{
  blockHash: "0x113a2e7295115d1a5fed7e3f09e1448eb6f8fd74af0ec02f1c789cb86ecb8d9c",
  blockNumber: 176,
  from: "0x16b2c699c083a0ad8f854be1cd896b4905ef0b30",
  gas: 90000,
  gasPrice: 18000000000,
  hash: "0x0261431da2f61746eec060569a4fd902833e886f4187e42223ffbbf7e1acdc2d",
  input: "0x",
  nonce: 0,
  r: "0xaae7a41b0b563a67f6b3ad41697f1597a900e4906bdecb74b874e9d0f4b02528",
  s: "0x3db2f3094def871e8fc9a170cf1f013065fb65c3cdf09b8ee972e66b0f97e0d6",
  to: "0x4567252a19264056921e95975833a7d6824890dc",
  transactionIndex: 0,
  v: "0x1c",
  value: 5000000000000000000
}
```
