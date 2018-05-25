#!/bin/bash
# 各拡張子のライブ録音ファイルにタグをつける（要mutagen）
IFS_BACKUP=$IFS
i=0
eex=("MP3" "m4a" "wav")
for ex in ${eex[@]}; do
    echo $ex
    for filepath in `find . -name *.$ex`; do
        filename=`basename $filepath .$ex`
        IFS="/"
        filepaths=(${filepath})
        IFS="\n"
        artist="アーティスト"
        album=${filepaths[1]}
        song=$filename
        track=${filename##*-}
        echo "file="$filepath", album="$album", song="$song", track="$track
        mid3v2 -a $artist -A $album -t $song -T $track -g 8 $filepath
    done
    IFS=$IFS_BACKUP
done
IFS=$IFS_BACKUP
