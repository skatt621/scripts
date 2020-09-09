#!/bin/bash
# $1 = directory of files to copy, $2 directory to copy into
# Please install the "pv" program and make sure you have access to both directories

b=$(du -s -B1 $1 | awk -F " " '{print $1}')
echo $b

mkdir $2

cd $1
tar -c . | pv -s $b | tar -x -C $2
cd -
