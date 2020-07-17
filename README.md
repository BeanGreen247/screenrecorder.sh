# screenrecorder.sh
A script for recording your screen under linux with ffmpeg and mpv

Things you'll need to install

On Debian based distros (Ubuntu, Mint, Kubuntu, Xubuntu...)
```
sudo apt install ffmpeg mpv
```

Things you need to change based on your configuration

pkill -f /dev/video0  **<- change "video0" to the video interface of your webcam**

mpv --geometry=-0-0 --autofit=30% --untimed /dev/video0   **<- do the same here**

ffmpeg -y -f x11grab -s 1680x1050 -i :0.0+1280 -f alsa -i default screenout.mp4  **<- change "1680x1050" to your monitors resolution....change ":0.0+1280" to ":0.0" if you use just one monitor.....if you use two monitors and want to record one specific monitor make sure to change the "1280" value acording to your second monitors width**
