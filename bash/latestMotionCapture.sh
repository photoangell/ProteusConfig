//if motion sesnor triggers, this script is run...
then in config add
camera:
  - platform: ffmpeg
    name: Dafang
    input: -rtsp_transport tcp -i rtsp://192.168.2.11:8554/unicast
  - name: Locations
    platform: generic
    still_image_url: !secret google_maps_url
    limit_refetch_to_url_change: true
  - platform: local_file
    name: front_door_latest
    file_path: "/config/www/front-door/front-door-latest-small.gif"
  - platform: local_file
    name: backyard_latest
file_path: "/config/www/backyard/backyard-latest-small.gif"
--end

#!/bin/bash

wget -q -O /share/motion/backyard/backyard1.jpg http://root:$1@192.168.2.11/cgi-bin/currentpic.cgi
sleep 1
wget -q -O /share/motion/backyard/backyard2.jpg http://root:$1@192.168.2.11/cgi-bin/currentpic.cgi
sleep 1
wget -q -O /share/motion/backyard/backyard3.jpg http://root:$1@192.168.2.11/cgi-bin/currentpic.cgi
sleep 1
wget -q -O /share/motion/backyard/backyard4.jpg http://root:$1@192.168.2.11/cgi-bin/currentpic.cgi
sleep 1
wget -q -O /share/motion/backyard/backyard5.jpg http://root:$1@192.168.2.11/cgi-bin/currentpic.cgi
sleep 1
wget -q -O /share/motion/backyard/backyard6.jpg http://root:$1@192.168.2.11/cgi-bin/currentpic.cgi
sleep 1
wget -q -O /share/motion/backyard/backyard7.jpg http://root:$1@192.168.2.11/cgi-bin/currentpic.cgi

convert -loop 0 -delay 100 /share/motion/backyard/backyard1.jpg /share/motion/backyard/backyard2.jpg /share/motion/backyard/backyard3.jpg /share/motion/backyard/backyard4.jpg /share/motion/backyard/backyard5.jpg /share/motion/backyard/backyard6.jpg /share/motion/backyard/backyard7.jpg /config/www/backyard/backyard-latest.gif

convert /config/www/backyard/backyard-latest.gif -fuzz 15% -layers Optimize /config/www/backyard/backyard-latest-small.gif

cp -a /config/www/backyard/backyard-latest-small.gif "/share/motion/backyard/backyard-$(date +"%m-%d-%y-%r").gif"

find /share/motion/backyard/*.* -mtime +4 -exec rm {} \;
