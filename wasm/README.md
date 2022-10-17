From the root directory of zlib, run `wasm/build.sh`. This should build a docker image `wasi-sdk:latest` which is then used to configure and compile zlib for wasm.

To compile and link a wasm module, this should work

```sh
docker run --rm --mount type=bind,source="$(pwd)",target=/zlib --workdir /zlib wasi-sdk:latest -O3 -D_LARGEFILE64_SOURCE=1 -DHAVE_HIDDEN -o example -I. test/example.c -L. libz.a
```

Or to clean everything

```sh
docker run --rm --mount type=bind,source="$(pwd)",target=/zlib --workdir /zlib --entrypoint "/usr/bin/make" wasi-sdk:latest clean
```
