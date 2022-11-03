#!/bin/bash

set -e

git clone --depth 1 --branch v1.50.1 https://github.com/grpc/grpc.git

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    platform=linux
    export CC=gcc
    (cd grpc && bazel build //src/compiler:grpc_python_plugin)
elif [[ "$OSTYPE" == "darwin"* ]]; then
    platform=mac
    # currently doesn't support arm64
    (cd grpc && arch -arch x86_64 bazel build //src/compiler:grpc_python_plugin)
fi    

mkdir -p dist
cp -v grpc/bazel-bin/src/compiler/grpc_python_plugin dist/grpc_python_$platform
(cd grpc && bazel clean --expunge)
rm -rf grpc
