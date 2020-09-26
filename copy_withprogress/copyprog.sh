#!/bin/bash
# $1 = file/directory of files to copy, $2 directory to copy into

# Argument checks
if [[ $# -lt 2 ]]
then
    echo "Please supply two folder locations: folder to copy from and folder to copy to."
    exit
fi

if [[ $# -gt 3 ]]
then
    echo "Please supply ONLY two folder locations: folder/file to copy from and folder to copy to."
    exit
fi

# Source/target checks
ls "$(realpath $1)" > /dev/null 2>&1
if [[ $? -gt 0 ]]
then
    echo "The source files/directory { $1 } does not exist."
    exit
fi

ls "$(realpath $1)" > /dev/null 2>&1
if [[ $? -gt 0 ]] || [[ -f "$2" ]]
then
    echo "The target directory { $2 } does not exist (or is really a file)."
    exit
fi

# Settings byte numbers for pv
b=$(du -s -b "$1" | awk -F " " '{print $1}')
echo $b
b_human=$(du -s -h "$1" | awk -F " " '{print $1}')
echo $b_human

# Compressing and transporting a folder's directories
if [[ -d "$1" ]]
then
    src=$(realpath $1)
    targ=$(realpath $2)
    cd "$src"
    tar -c . | pv -s $b | tar -x -C $targ
    cd -
fi

# Compressing and transporting a file
if [[ -f "$1" ]]
then
    parent=$(dirname $1)
    file=$(basename $1)
    targ=$(realpath $2)
    cd "$parent"
    tar -c "$file" | pv -s $b | tar -x -C $targ
    cd -
fi
