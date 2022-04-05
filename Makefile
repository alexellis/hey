export CGO_ENABLED=0
export GO111MODULE=on

PHONY: dist

dist:
	mkdir -p bin/
	cd hey && \
	GO111MODULE=$(GO111MODULE) GOOS=linux GOARCH=amd64 go build -ldflags  "-s -w" -a -installsuffix cgo -o ../bin/hey && \
	GO111MODULE=$(GO111MODULE) GOOS=linux GOARCH=arm64 go build -ldflags  "-s -w" -a -installsuffix cgo -o ../bin/hey-linux-arm64 && \
	GO111MODULE=$(GO111MODULE) GOOS=linux GOARCH=arm GOARM=7 go build -ldflags  "-s -w" -a -installsuffix cgo -o ../bin/hey-linux-armv7 && \
	GO111MODULE=$(GO111MODULE) GOOS=darwin GOARCH=amd64 go build -ldflags  "-s -w" -a -installsuffix cgo -o ../bin/hey-darwin-amd64 && \
	GO111MODULE=$(GO111MODULE) GOOS=darwin GOARCH=arm64 go build -ldflags  "-s -w" -a -installsuffix cgo -o ../bin/hey-darwin-arm64 && \
	GO111MODULE=$(GO111MODULE) GOOS=windows GOARCH=amd64 go build -ldflags  "-s -w" -a -installsuffix cgo -o ../bin/hey.exe
