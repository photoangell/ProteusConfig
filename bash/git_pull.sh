#!/bin/bash

cd "/home/homeassistant/.homeassistant/"
sudo git pull
sudo systemctl restart home-assistant@pi
