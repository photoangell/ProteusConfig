#!/bin/bash

sudo systemctl restart home-assistant@pi & 
tail -f -n 50 /home/homeassistant/.homeassistant/home-assistant.log 

