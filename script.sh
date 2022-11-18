#!/bin/bash
# script keeps video format, changes bitrate to 8Mbps, changes to 24 fps and to libx264 Codec
# it takes an input folder as first and output folder as second argument

if [ $# -ne 2 ]
then
	echo "Example usage: ./script.sh inputFolder outputFolder"
	exit 1
fi

if [[ ! -d $1 ]]
then
	echo "Input directory does not exist!"
	exit 1
fi

if [[ ! -d $2 ]]
then
	echo "Output directory does not exist!"
	exit 1
fi


for file in $1/*.mp4
do
	if [[ -f $file ]]; then
		echo "Compressing File: $file"
		filename="$(basename $file)"
		ffmpeg -i $file -c:v libx264 -b:v 8M -crf 24 "$2/$filename"
	fi
done