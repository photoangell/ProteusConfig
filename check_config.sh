#!/bin/bash 
#set -x

cd "/home/homeassistant/.homeassistant/"
#sudo su -s /bin/bash homeassistant
#sudo -u homeassistant source /srv/homeassistant/bin/activate
#hass -c . --script check_config
#exit

sudo -u homeassistant ./hass_config.sh
exit

