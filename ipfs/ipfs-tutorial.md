

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


test
--------

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
