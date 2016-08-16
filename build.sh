#!/bin/sh

set -e

PACKAGES="git curl build-base autoconf automake libtool"

apk add --update $PACKAGES

git clone https://github.com/google/protobuf -b $PROTOBUF_TAG --depth 1

cd ./protobuf

./autogen.sh && \
  ./configure --prefix=/usr && \
  make -j 3 && \
  make check && \
  make install

cd ..
rm -rf ./protobuf

apk add --update libstdc++

go get -u -v github.com/golang/protobuf/proto
go get -u -v github.com/golang/protobuf/protoc-gen-go
go get -u -v google.golang.org/grpc

apk del $PACKAGES
rm -rf /var/cache/apk/*
