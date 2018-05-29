#!/bin/bash

sudo systemctl restart home-assistant@pi & 
tail -f -n 10 /home/homeassistant/.homeassistant/home-assistant.log 

