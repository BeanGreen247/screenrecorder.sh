#!/bin/bash
timeanddate="$(date +%H-%M-%S_%d-%m-%Y)"
pkill -f /dev/video0
mpv --geometry=-0-0 --autofit=30% --untimed --cache-secs=0 --demuxer-readahead-secs=0 /dev/video0 & ffmpeg -y -f x11grab -s 1680x1050 -i :0.0+1280 -threads 3 -f alsa -i default -vf scale=1280x720 -g 30 -b:v 2M -tune zerolatency -keyint_min 30 -c:a aac -c:v h264 -crf 35 -preset ultrafast -pixel_format yuv444p $timeanddate.mp4 & ffmpeg -threads 1 -f pulse -ac 2 -i 1 $timeanddate-desktopaudio.mp3
