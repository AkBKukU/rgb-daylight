#!/usr/bin/python3
from time import sleep
from rgb import RGB
from daylight import Daylight
from config import Config

config = Config("settings.json")
# Setup RGB Light Strip
# R,G,B LED control pins
lights = RGB(config) 

# Setup Daylight Controller
day = Daylight(config,lights)

# Update Daylight Controller
while True:
    day.update()
    sleep(30)

