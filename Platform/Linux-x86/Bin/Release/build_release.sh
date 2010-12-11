#!/bin/sh
base=${PWD}
root_dir=${base}/../../../..
cmake -DCMAKE_INSTALL_PREFIX=. -DCMAKE_BUILD_TYPE:STRING=Release ${root_dir}
