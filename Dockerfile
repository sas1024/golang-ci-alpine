FROM golang:alpine

RUN apk add --no-cache --virtual build-dependencies unzip wget \
    && wget -O - -q https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s -- -b /usr/bin v1.16.0 \
    && apk del build-dependencies \
    && go version \
    && golangci-lint --version