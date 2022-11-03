Compiled binaries of Python grpc plugin, as they are not distributed on
PyPI. grpcio_tools is, but it doesn't seem to play nice with mypy_protobuf
in Bazel, as it seems to ignore the --plugin argument to specify the generator
path.
