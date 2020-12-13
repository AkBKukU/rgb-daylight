#!/usr/bin/python3
from time import sleep
from rgb import RGB
from daylight import Daylight

# Setup RGB Light Strip
# R,G,B LED control pins
lights = RGB(r=22,g=27,b=17) 
# Overall brightness of light
lights.intensity=1 
# White balance correction for light
lights.white_balance = [1,0.9,0.7] 

# Setup Daylight Controller
day = Daylight(lights)
# Latitude, longitude, and elevation in meters
day.position = ["Phoenix","America","America/Phoenix",33.434061, -112.016303,346] 
# UTC timezone offset
day.timezone_hours=-7

# Update Daylight Controller
while True:
    day.update()
    sleep(30)

