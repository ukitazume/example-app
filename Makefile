all: build

build:
	@echo "Build binary"
	@mkdir -p ./build
	@go build -ldflags="-w -s" -o ./build/webserver .

