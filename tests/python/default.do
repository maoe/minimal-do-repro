#!/bin/bash -eux
# Run the unit tests for a python source file
redo-ifchange list
cd ../..
xargs redo-ifchange <tests/python/list
echo python -m unittest "$1" >&2
