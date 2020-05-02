#!/usr/bin/env bash
docker run --rm -v $(pwd):/9cc compilerbook sh -c "cmake /9cc && make && ctest -V"