#!/bin/bash
pkill -f /dev/video0
mpv --geometry=-0-0 --autofit=30% --untimed /dev/video0 & ffmpeg -y -f x11grab -s 1680x1050 -i :0.0+1280 -threads 0 -f alsa -i default -f pulse -filter_complex amerge -ac 2 -i 3 -vf scale=1280x720 -g 30 -b:v 1.5M -tune zerolatency -keyint_min 30 -c:a aac -c:v h264 -crf 0 -preset ultrafast -pixel_format yuv444p screenout.mp4
