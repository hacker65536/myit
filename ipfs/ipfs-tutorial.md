

install
----
https://ipfs.io/docs/install/
```
curl -SsL -O https://dist.ipfs.io/go-ipfs/v0.4.14/go-ipfs_v0.4.14_linux-amd64.tar.gz
tar zxvf !$:t
cd go-ipfs
sudo ./install.sh
```

help
--------
```
ipfs help
```

init
--------
```
$ ipfs init
initializing IPFS node at /home/ec2-user/.ipfs
generating 2048-bit RSA keypair...done
peer identity: QmV1ojDcwvSt9GDEFAQ6sLGANVppYQf1FuBbqqxTk6zm
to get started, enter:

        ipfs cat /ipfs/QmS4ustL54uo8gedF55qaxZwuMiUhyvMcX9Ba8nUH4uVv/readme
```

```
$ ipfs cat /ipfs/QmS4ustL54uo8gedF55qaxZwuMiUhyvMcX9Ba8nUH4uVv/readme
Hello and Welcome to IPFS!

██╗██████╗ ███████╗███████╗
██║██╔══██╗██╔════╝██╔════╝
██║██████╔╝█████╗  ███████╗
██║██╔═══╝ ██╔══╝  ╚════██║
██║██║     ██║     ███████║
╚═╝╚═╝     ╚═╝     ╚══════╝

If you're seeing this, you have successfully installed
IPFS and are now interfacing with the ipfs merkledag!

 -------------------------------------------------------
| Warning:                                              |
|   This is alpha software. Use at your own discretion! |
|   Much is missing or lacking polish. There are bugs.  |
|   Not yet secure. Read the security notes for more.   |
 -------------------------------------------------------

Check out some of the other files in this directory:

  ./about
  ./help
  ./quick-start     <-- usage examples
  ./readme          <-- this file
  ./security-notes
```


quick start
--------

add file and view
```
mkdir ipfs
cd !$
echo "hello world" >hello
ipfs add hello
```
```
added QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o hello
```
```
$ ipfs cat QmT78zSuBmuS4z925WZfrqQ1qHaJ56DQaTfyMUF7F8ff5o
hello world
```

directory and ref

```
mkdir -p foo/bar
echo "baz" > foo/baz
echo "baz" > foo/bar/baz
ipfs add -r foo
```
```
added QmWLdkp93sNxGRjnFHPaYg8tCQ35NBY3XPn6KiETd3Z4WR foo/bar/baz
added QmWLdkp93sNxGRjnFHPaYg8tCQ35NBY3XPn6KiETd3Z4WR foo/baz
added QmeBpzHngbHes9hoPjfDCmpNHGztkmZFRX4Yp9ftKcXZDN foo/bar
added QmdcYvbv8FSBfbq1VVSfbjLokVaBYRLKHShpnXu3crd3Gm foo
```

```
$ ipfs ls QmdcYvbv8FSBfbq1VVSfbjLokVaBYRLKHShpnXu3crd3Gm
QmeBpzHngbHes9hoPjfDCmpNHGztkmZFRX4Yp9ftKcXZDN 61 bar/
QmWLdkp93sNxGRjnFHPaYg8tCQ35NBY3XPn6KiETd3Z4WR 12 baz
```
```
$ ipfs ls QmdcYvbv8FSBfbq1VVSfbjLokVaBYRLKHShpnXu3crd3Gm/bar
QmWLdkp93sNxGRjnFHPaYg8tCQ35NBY3XPn6KiETd3Z4WR 12 baz
```
```
$ ipfs cat QmdcYvbv8FSBfbq1VVSfbjLokVaBYRLKHShpnXu3crd3Gm/baz
baz
```

daemon
```
$ ipfs daemon
Initializing daemon...
Successfully raised file descriptor limit to 2048.
Swarm listening on /ip4/127.0.0.1/tcp/4001
Swarm listening on /ip4/172.31.45.202/tcp/4001
Swarm listening on /ip6/::1/tcp/4001
Swarm listening on /p2p-circuit/ipfs/QmV1ojDcwvSt9tPkKfSJQ6sLGANVppYQf1FuBbqqxTk6zm
Swarm announcing /ip4/127.0.0.1/tcp/4001
Swarm announcing /ip4/172.31.45.202/tcp/4001
Swarm announcing /ip6/::1/tcp/4001
API server listening on /ip4/127.0.0.1/tcp/5001
Gateway (readonly) server listening on /ip4/127.0.0.1/tcp/8080
Daemon is ready
```

```
$ ipfs id
{
        "ID": "QmV1ojDcwvSt9tPkKfSJQ6sLGANVppYQf1FuBbqqxTk6zm",
        "PublicKey": "CAASpgIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC3MYlT4yCYykWOaM1GjwSFoA1gFtQ9Tk5Sq71u3iKx6DFCfFHU1G66c4orPCcObmRLK4Shul6g1Vu/BEM4mY7xynZ1VwaA+lTnl34V4WwGJApuCPvfY60utoyVroUxwxFq05S7+2pJEPaB9Uuy9u9IVjESJlRev2xs9aTZAlAflioBYL/UtY9F5fsOdnzG7fcEeKb9iyZ2E77jwR0OwSnhMvOBOkjapjznwS9i6JmBzqRr5qYYjuzLkITEhLEWHHflZ6Dg6nHQllwRIQdq04BXVBeeJtdRK5ENb6jSIwDl40nvd8zgo/+62Mwf56JhFrg3TN8/+pPBVhzAAcFFIn17AgMBAAE=",
        "Addresses": [
                "/ip6/::1/tcp/4001/ipfs/QmV1ojDcwvSt9tPkKfSJQ6sLGANVppYQf1FuBbqqxTk6zm",
                "/ip4/127.0.0.1/tcp/4001/ipfs/QmV1ojDcwvSt9tPkKfSJQ6sLGANVppYQf1FuBbqqxTk6zm",
                "/ip4/172.31.45.202/tcp/4001/ipfs/QmV1ojDcwvSt9tPkKfSJQ6sLGANVppYQf1FuBbqqxTk6zm"
        ],
        "AgentVersion": "go-ipfs/0.4.14/",
        "ProtocolVersion": "ipfs/0.1.0"
}
```

```
$ ipfs swarm peers
/ip4/101.127.65.154/tcp/19877/ipfs/QmdZKNrJaqA4nZ6Uhz739zPFJ4zNLRSjfrJ69iYbbC15wJ
/ip4/104.131.10.96/tcp/4001/ipfs/QmQQVXUUTrNxWv2bbCvV7R34H3qwKuj6Hyv8U8TDzq3ZZb
/ip4/104.131.131.82/tcp/4001/ipfs/QmaCpDMGvV2BGHeYERUEnRQAwe3N8SzbUtfsmvsqQLuvuJ
/ip4/104.225.221.239/tcp/4001/ipfs/QmPZFz1t9AcU5emk41rGPUsJgJb2hvVdHXeVuM3rig7aEQ
/ip4/104.236.179.241/tcp/4001/ipfs/QmSoLPppuBtQSGwKDZT2M73ULpjvfd3aZ6ha4oFGL1KrGM
/ip4/104.236.76.40/tcp/4001/ipfs/QmSoLV4Bbm51jM9C4gDYZQ9Cy3U6aXMJDAbzgu2fzaDs64
/ip4/108.196.200.233/tcp/4011/ipfs/QmQ5hdj2zaV1BXGxkTU2sGAP75v4fqnxZMbs7CDc8a3MZg
/ip4/110.72.58.111/tcp/4001/ipfs/QmaSc9qTrFXMF3sMA4bmztaWnjynSpDBzGV1UamwZwSnXQ
/ip4/114.108.177.146/tcp/4001/ipfs/QmQBRQDkMg7ucJXNkw12hHfMiBEV4mAYoj481i8xrxkSeR
--snip---
```

