#!/bin/bash
# ./conv2以下の.wavファイルをメタデータを削除して.m4aに変換し./conv3以下に保存
IFS_BACKUP=$IFS
IFS=$'\n'
i=0

ex="wav"
for file in `find ./conv2 -name *.$ex`; do
    filename=`basename $file .$ex`
    dirname=`dirname $file`
    convdir="./conv3/"$dirname
    convpath=$convdir"/"$filename".m4a"
    echo "!!!!!!! "$file" --> "$convpath" !!!!!!!"
    mkdir -p $convdir
    ffmpeg -i $file -c:a aac -b:a 256k -metadata album="" -metadata title="" -metadata artist="" -metadata genre="" $convpath
    i=`expr $i + 1`
done
echo $i
echo "Finish!!"
IFS=$IFS_BACKUP

