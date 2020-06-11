# cloudrun

https://cloud.google.com/run/docs


quickstarts
--

### deploy a prebuilt sample container

1. go to [cloudrun](https://console.cloud.google.com/run?enableapi=true)
2. create service
3. select region
4. input name of service 
5. allow unauthenticated invocations
6. Next
7. container image url= `gcr.io/cloudrun/hello` 
8. create 

### build and deploy a container

```
mkdir helloworld-go
cd helloworld-go
```
```
go mod init github.com/knative/docs/docs/serving/samples/hello-world/helloworld-go
```

`helloworld.go`
```go
package main

import (
        "fmt"
        "log"
        "net/http"
        "os"
)

func handler(w http.ResponseWriter, r *http.Request) {
        log.Print("helloworld: received a request")
        target := os.Getenv("TARGET")
        if target == "" {
                target = "World"
        }
        fmt.Fprintf(w, "Hello %s!\n", target)
}

func main() {
        log.Print("helloworld: starting server...")

        http.HandleFunc("/", handler)

        port := os.Getenv("PORT")
        if port == "" {
                port = "8080"
        }

        log.Printf("helloworld: listening on port %s", port)
        log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", port), nil))
}
```
```dockerfile
# Use the official Golang image to create a build artifact.
# This is based on Debian and sets the GOPATH to /go.
# https://hub.docker.com/_/golang
FROM golang:1.13 as builder

# Create and change to the app directory.
WORKDIR /app

# Retrieve application dependencies using go modules.
# Allows container builds to reuse downloaded dependencies.
COPY go.* ./
RUN go mod download

# Copy local code to the container image.
COPY . ./

# Build the binary.
# -mod=readonly ensures immutable go.mod and go.sum in container builds.
RUN CGO_ENABLED=0 GOOS=linux go build -mod=readonly -v -o server

# Use the official Alpine image for a lean production container.
# https://hub.docker.com/_/alpine
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM alpine:3
RUN apk add --no-cache ca-certificates

# Copy the binary to the production image from the builder stage.
COPY --from=builder /app/server /server

# Run the web service on container startup.
CMD ["/server"]
```

```
gcloud builds submit --tag gcr.io/PROJECT-ID/helloworld
```

```
gcloud run deploy --image gcr.io/PROJECT-ID/helloworld --platform managed
```
