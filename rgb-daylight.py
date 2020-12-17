#!/usr/bin/python3
from time import sleep
from rgb import RGB
from daylight import Daylight
from config import Config
import argparse

parser = argparse.ArgumentParser(description='Daylight simulator launch options')
parser.add_argument('--test', action="store_true",  help='Rapidly cycle colors')
args = parser.parse_args()

config = Config("settings.json")
# Setup RGB Light Strip
# R,G,B LED control pins
lights = RGB(config) 

# Setup Daylight Controller
day = Daylight(config,lights)
delay = 10
if (args.test):
    day.test=True
    delay = 0.05

# Update Daylight Controller
while True:
    day.update()
    sleep(delay)

