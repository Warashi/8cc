#!/usr/bin/env bash
docker run --rm -w /9cc -v $(pwd):/9cc compilerbook sh -c "cmake . && make && ctest -V"
