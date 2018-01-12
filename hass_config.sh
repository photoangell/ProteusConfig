#!/bin/bash

source /srv/homeassistant/bin/activate
hass -c . --script check_config
exit


