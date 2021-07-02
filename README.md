Compiled binaries of Python grpc plugin, as they are not distributed on
PyPI. grpcio_tools is, but it doesn't seem to play nice with mypy_protobuf
in Bazel, as it seems to ignore the --plugin argument to specify the generator
path.

Built with:

```
git clone --depth 1 --branch v1.38.1 https://github.com/grpc/grpc.git
cd grpc && bazel build //src/compiler:grpc_python_plugin
cp bazel-bin/src/compiler/grpc_python_plugin /this/folder/grpc-plugin-macos
```
