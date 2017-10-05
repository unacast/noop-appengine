#! /bin/bash


if [ $# -ne 1 ]
then
  echo "Usage: ./build.sh binary-name"
  exit 1
fi

set -e

_name=$1

CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -a -ldflags '-s -w' -installsuffix cgo -o $_name *.go
