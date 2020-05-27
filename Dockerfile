FROM golang:1.13-alpine

RUN apk add --no-cache git protobuf make openssh-client build-base postgresql-client
RUN apk add --no-cache --virtual build-dependencies unzip wget \
    && wget -O - -q https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b /usr/bin v1.24.0 \
    && apk del build-dependencies \
    && go version \
    && golangci-lint --version
