#!/usr/bin/env bash
docker run --rm -v $(pwd):/9cc -w /9cc compilerbook "$@"