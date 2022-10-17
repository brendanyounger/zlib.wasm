#!/bin/sh

docker build -t wasi-sdk:latest wasm/
docker run -it --rm --mount type=bind,source="$(pwd)",target=/zlib --entrypoint /zlib/wasm/compile.sh wasi-sdk:latest