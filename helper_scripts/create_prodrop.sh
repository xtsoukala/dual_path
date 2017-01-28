#!/bin/sh

cp -rf input null_input
cp -rf input prodrop_input
cp -rf input noemph_input
cd prodrop_input

#_file="train.enes"

# Process both TRAIN and TEST sets
find . -type f -name "t*.e*" |
while read -r line; do
    _file=$line
    echo "Processing $_file"
    grep ",EMPH" $_file > temp.emphasis
    grep -v ",EMPH" $_file > temp.noemphasis
	sed "s/ella //g" temp.noemphasis > temp.noe
    sed "s/él //g" temp.noe > temp.noemphasis
    cat temp.emphasis temp.noemphasis > $_file
    rm temp.*
    echo "done"
done


cd ../null_input

# Process both TRAIN and TEST sets
find . -type f -name "t*.e*" |
while read -r line; do
    _file=$line
    echo "Processing $_file"
    grep ",EMPH" $_file > temp.emphasis
    grep -v ",EMPH" $_file > temp.noemphasis
	sed "s/ella /NULL /g" temp.noemphasis > temp.noe
    sed "s/él /NULL /g" temp.noe > temp.noemphasis
    cat temp.emphasis temp.noemphasis > $_file
    rm temp.*
    echo "done"
done

cd ../noemph_input

# Process both TRAIN and TEST sets
find . -type f -name "t*.e*" |
while read -r line; do
    _file=$line
    echo "Processing $_file"
	sed -i "s/ella //g;s/él //g" $_file
    echo "done"
done