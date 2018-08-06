PKG = "example"
GOPATH ?= $(shell go env GOPATH)
GO_PACKAGES := $(shell go list ./... | grep -v /vendor/)
BINARIES = example
API_FILES = api/example.pb.go api/example.pb.gw.go api/example.swagger.json

.PHONY: build api dep test race msan

build: api dep ## Build example
	@go build .

dep: api ## Fetch dependencies
	@go get ./...

api: $(API_FILES) ## Auto-generate gRPC/REST Go sources

api/example.pb.go: api/example.proto
	@protoc -I. \
		-I${GOPATH}/src \
		-I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
		--go_out=plugins=grpc:. \
		api/example.proto

api/example.pb.gw.go: api/example.proto
	@protoc -I. \
		-I${GOPATH}/src \
		-I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
		--grpc-gateway_out=logtostderr=true:. \
		api/example.proto

api/example.swagger.json: api/example.proto
	@protoc -I. \
		-I${GOPATH}/src \
		-I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
		--swagger_out=logtostderr=true:. \
		api/example.proto

clean: ## Clean compiled binaries
	@rm -f ${BINARIES}

realclean: ## Clean compiled binaries and all generated files
	@rm -f ${BINARIES}
	@rm -f ${API_FILES}

test: dep ## Run tests
	@go test -short ${GO_PACKAGES}

race: dep ## Run tests with race detector
	@go test -race -short ${GO_PACKAGES}

msan: dep ## Run tests with memory sanitizer
	@go test -msan -short ${GO_PACKAGES}