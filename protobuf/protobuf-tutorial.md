# protocol buffers


https://developers.google.com/protocol-buffers

## tutorial
https://developers.google.com/protocol-buffers/docs/gotutorial



### install protoc
https://grpc.io/docs/protoc-installation/


```
$ PB_REL="https://github.com/protocolbuffers/protobuf/releases"  \
curl -LO $PB_REL/download/v3.12.1/protoc-3.12.1-linux-x86_64.zip  && \
nzip protoc-3.12.1-linux-x86_64.zip -d $HOME/.local
```

```
$ export PATH="$PATH:$HOME/.local/bin"
```
