#!/bin/bash
timeanddate="$(date +%H-%M-%S_%d-%m-%Y)"
pkill -f /dev/video0
ffplay -f v4l2 -noborder -an -sn -alwaysontop -video_size 380x360 /dev/video0 & ffmpeg -y -threads 4 -thread_queue_size 16 -f x11grab -s 1680x1050 -i :0.0 -f alsa -i default -vol 2000 -f pulse -i 2 -filter_complex "[1:0][2:0]amix=inputs=2:duration=shortest" -vf scale=1920x1080 -g 30 -b:v 6M -tune zerolatency -keyint_min 30 -c:a aac -c:v h264_nvenc -crf 25 -pixel_format yuv444p $timeanddate.mp4
