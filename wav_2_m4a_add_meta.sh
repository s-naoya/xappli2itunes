#!/bin/bash
# .以下の.wavファイルをディレクトリ構成から推測したメタデータを付加してm4aに変換し./conv以下に保存

IFS_BACKUP=$IFS
IFS=$'\n'
i=0

ex="wav"
for filepath in `find . -name *.$ex`; do
    filename=`basename $filepath .$ex`
    dirname=`dirname $filepath`
    convdir="./conv/"$dirname
    convpath=$convdir"/"$filename".m4a"

    IFS="/"
    filepaths=(${filepath})
    IFS=$'\n'
    artist=${filepaths[1]}
    album=${filepaths[2]}
    title=${filename:3}
    track=${filename:0:3}
    genre="Jazz"
    # echo "artist->"$artist", album->"$album", title->"$title", track->"$track

    echo "!!! "$convpath" !!!"
    mkdir -p $convdir
    ffmpeg -i $filepath -c:a aac -b:a 256k -metadata album=$album -metadata title=$title -metadata artist=$artist -metadata genre=$genre -metadata track=$track $convpath
    i=`expr $i + 1`
done
echo $i
echo "Finish!!"
IFS=$IFS_BACKUP

