#!/bin/bash
# $1 = directory of files to copy, $2 directory to copy into
# Please install the "pv" program and make sure you have access to both directories

if [ $# -eq 0 ]
then
    echo "No arguments supplied"
    exit
fi

pwd=$(pwd)
b=$(du -s -B1 $1 | awk -F " " '{print $1}')
echo $b

if [ ! -d "$2" ]
then
    mkdir $2
fi

cd $1
tar -c . | pv -s $b | tar -x -C $2
cd -
