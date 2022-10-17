FROM debian:bullseye

# Install dependencies
RUN apt-get -qq update && \
    apt-get install -qqy --no-install-recommends \
    ca-certificates wget binutils libxml2 make && \
    rm -rf /var/lib/apt/lists/*

# Download release
RUN wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-16/wasi-sdk-16.0-linux.tar.gz && \ 
    tar xvf wasi-sdk-16.0-linux.tar.gz

ENV CC "/wasi-sdk-16.0/bin/clang --sysroot=/wasi-sdk-16.0/share/wasi-sysroot"
ENV AR "/wasi-sdk-16.0/bin/ar"
ENV RANLIB "/wasi-sdk-16.0/bin/ranlib"

ENTRYPOINT ["/wasi-sdk-16.0/bin/clang", "--sysroot=/wasi-sdk-16.0/share/wasi-sysroot"]