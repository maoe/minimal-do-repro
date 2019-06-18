#!/bin/bash -eux
redo-always
find \
    ../../python \
    -name '*.py' -print |
    sed 's#../../##' >"$3"
redo-stamp <"$3"
