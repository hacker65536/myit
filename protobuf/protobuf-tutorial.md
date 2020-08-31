# protocol buffers


https://developers.google.com/protocol-buffers

## tutorial
https://developers.google.com/protocol-buffers/docs/gotutorial



### install protoc
https://grpc.io/docs/protoc-installation/


```
$ PB_REL="https://github.com/protocolbuffers/protobuf/releases" &&  \
curl -LSsO $PB_REL/download/v3.12.1/protoc-3.12.1-linux-x86_64.zip  && \
unzip protoc-3.12.1-linux-x86_64.zip -d $HOME/.local
```

```
$ export PATH="$PATH:$HOME/.local/bin"
```

### get examples

```
$ go get github.com/protocolbuffers/protobuf
```

```
$ cd ~/go/src/github.com/protocolbuffers/protobuf/examples
```

```console
$ make go
mkdir -p tutorial # make directory for go package
protoc $PROTO_PATH --go_out=tutorial addressbook.proto
2020/08/31 05:49:41 WARNING: Missing 'go_package' option in "addressbook.proto",
please specify it with the full Go package path as
a future release of protoc-gen-go will require this be specified.
See https://developers.google.com/protocol-buffers/docs/reference/go-generated#package for more information.

go build -o add_person_go add_person.go
go build -o list_people_go list_people.go
```


```console
$ ./add_person_go addressbook.data
addressbook.data: File not found.  Creating new file.
Enter person ID number: 1
Enter name: myname
Enter email address (blank for none): my@emal.com
Enter a phone number (or leave blank to finish): 000
Is this a mobile, home, or work phone? mobile
Enter a phone number (or leave blank to finish):
```
```console
$ ./list_people_go addressbook.data
Person ID: 1
  Name: myname
  E-mail address: my@emal.com
  Mobile phone #: 000
```
