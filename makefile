.PHONY: dev build test

test:
	go test ./...

build:
	mkdir -p bin
	go build -o bin/gitops

dev: build
	./bin/gitops

delivery:
	sh build.sh
