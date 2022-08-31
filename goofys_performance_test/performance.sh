#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: test.sh <Path> <Folder_count>";
    exit
fi

mkdir $1/test
mkdir $1/test1

echo "making directories..."
time ./mkdir.sh $1 $2

printf "\n"
echo "moving directories..."
time ./mv.sh $1 $2

printf "\n"
echo "removing directories..."
time ./remove.sh $1 $2
#time rm -rf $1/test $1/test1
