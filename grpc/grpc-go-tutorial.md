# grpc go

https://grpc.io/docs/languages/go/quickstart/

```console
$ git clone -b v1.31.0 https://github.com/grpc/grpc-go
```

```console
$ cd grpc-go/examples/helloworld
```


run server
```console
$ go run greeter_server/main.go
```


run client 
```console
$ go run greeter_client/main.go
2020/08/31 06:07:26 Greeting: Hello world
```


update grpc

`helloworld/helloworld.proto`
```go
service Greeter {
  // Sends a greeting
  rpc SayHello (HelloRequest) returns (HelloReply) {}
  // Sends another greeting
  rpc SayHelloAgain (HelloRequest) returns (HelloReply) {}
}
```

reganerate grpc code 
```console
$ ( cd ../../cmd/protoc-gen-go-grpc && go install . )
$ protoc \
  --go_out=Mgrpc/service_config/service_config.proto=/internal/proto/grpc_service_config:. \
  --go-grpc_out=Mgrpc/service_config/service_config.proto=/internal/proto/grpc_service_config:. \
  --go_opt=paths=source_relative \
  --go-grpc_opt=paths=source_relative \
  helloworld/helloworld.proto
```
  
  
  
`greeter_server/main.go`
```go
func (s *server) SayHelloAgain(ctx context.Context, in *pb.HelloRequest) (*pb.HelloReply, error) {
        return &pb.HelloReply{Message: "Hello again " + in.GetName()}, nil
}
```

`greeter_client/main.go`

```go
r, err = c.SayHelloAgain(ctx, &pb.HelloRequest{Name: name})
if err != nil {
        log.Fatalf("could not greet: %v", err)
}
log.Printf("Greeting: %s", r.GetMessage())
```

run server
```console 
$ go run greeter_server/main.go
```

client
```
$ go run greeter_client/main.go Alice
2020/08/31 08:29:57 Greeting: Hello Alice
2020/08/31 08:29:57 Greeting: Hello again Alice
```

server's output
```console
$ go run greeter_server/main.go
2020/08/31 08:29:57 Received: Alice
```
