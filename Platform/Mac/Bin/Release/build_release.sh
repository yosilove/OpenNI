#!/bin/sh
base=${PWD}
root_dir=${base}/../../../..
install_dir="."
if [ "$1" != "" ] ; then
	install_dir=$1
fi
cmake -DCMAKE_INSTALL_PREFIX=$install_dir -DCMAKE_BUILD_TYPE:STRING=Release ${root_dir}
