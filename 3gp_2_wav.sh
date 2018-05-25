#!/bin/bash
# ./Music以下にある.3gpと.wavファイルを.m4aに変換して./conv以下に保存
IFS_BACKUP=$IFS
IFS=$'\n'
i=0
ex="3gp"
for file in `find ./Music -name *.$ex`; do
    filename=`basename $file .$ex`
    dirname=`dirname $file`
    convdir="./conv/"$dirname
    convpath=$convdir"/"$filename".m4a"
    echo "!!!!!!! "$file" --> "$convpath" !!!!!!!"
    mkdir -p "./conv/"$dirname
    ffmpeg -i $file -c:a aac -b:a 256k $convpath
    i=`expr $i + 1`
done
ex="wav"
for file in `find ./Music -name *.$ex`; do
    filename=`basename $file .$ex`
    dirname=`dirname $file`
    convdir="./conv/"$dirname
    convpath=$convdir"/"$filename".m4a"
    echo "!!!!!!! "$file" --> "$convpath" !!!!!!!"
    mkdir -p "./conv/"$dirname
    ffmpeg -i $file -c:a aac -b:a 256k $convpath
    i=`expr $i + 1`
done
echo $i
echo "Finish!!"
IFS=$IFS_BACKUP

