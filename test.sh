#!/bin/bash
set -e

# Skip this, since go's gofmt has changed from whatever version of go
# this was originally built against to go 1.13, which we're building
# against.
# echo "gofmt"
# diff -u <(echo -n) <(gofmt -d $(find . -type f -name '*.go' -not -path "./.godeps/*"))
echo "go vet"
go vet ./...
echo "go test"
go test -timeout 60s ./...
echo "go test -race"
GOMAXPROCS=4 go test -timeout 60s -race ./...
