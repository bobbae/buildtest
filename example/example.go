package main

import (
	"github.com/bobbae/buildtest/example/server"
)

func main() {
	grpcAddress := ":18181"
	restAddress := ":18182"
	go server.ListenAndServeREST(restAddress, grpcAddress)
	server.ListenAndServeGRPC(grpcAddress)
}
