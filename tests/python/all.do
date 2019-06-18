#!/bin/bash -eux
redo-ifchange list
xargs redo-ifchange <list
