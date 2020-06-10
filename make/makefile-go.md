# makefile for go

https://frasco.io/golang-dont-afraid-of-makefiles-785f3ec7eb32


```makefile
# Go パラメータ
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_NAME=mybinary
BINARY_UNIX=$(BINARY_NAME)_unix

all: test build
build:
    $(GOBUILD) -o $(BINARY_NAME) -v
test:
    $(GOTEST) -v ./...
clean:
    $(GOCLEAN)
    rm -f $(BINARY_NAME)
    rm -f $(BINARY_UNIX)
run:
    $(GOBUILD) -o $(BINARY_NAME) -v ./...
    ./$(BINARY_NAME)
deps:
    $(GOGET) github.com/markbates/goth
    $(GOGET) github.com/markbates/pop


# クロスコンパイル
build-linux:
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_UNIX) -v
docker-build:
    docker run --rm -it -v "$(GOPATH)":/go -w /go/src/bitbucket.org/rsohlich/makepost golang:latest go build -o "$(BINARY_UNIX)" -v

```
