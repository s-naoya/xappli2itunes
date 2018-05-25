#!/bin/bash
# ./Music以下の.wavファイルを./conv2以下にコピー
IFS_BACKUP=$IFS
IFS=$'\n'
i=0

ex="wav"
for file in `find ./Music -name *.$ex`; do
    filename=`basename $file .$ex`
    dirname=`dirname $file`
    convpath="./conv2/"$dirname
    echo "!!!!!!! "$file" --> "$convpath" !!!!!!!"
    mkdir -p "./conv2/"$dirname
#    ffmpeg -i $file -c:a aac -b:a 256k $convpath
    cp -r $file $convpath
    i=`expr $i + 1`
done
echo $i
echo "Finish!!"
IFS=$IFS_BACKUP

