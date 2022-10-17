#!/bin/sh

cd zlib
./configure --static --solo
make libz.a