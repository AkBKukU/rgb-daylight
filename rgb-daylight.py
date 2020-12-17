#!/usr/bin/python3
from time import sleep
from rgb import RGB
from daylight import Daylight
from config import Config
import argparse
import sys

parser = argparse.ArgumentParser(description='Daylight simulator launch options')
parser.add_argument('--test', action="store_true",  help='Rapidly cycle colors')
parser.add_argument('--test-color', action="store",  help='Set to a specific daytime color')
args = parser.parse_args()

config = Config("settings.json")
# Setup RGB Light Strip
# R,G,B LED control pins
lights = RGB(config) 

# Setup Daylight Controller
day = Daylight(config,lights)

# Test option setup
delay = 10
if args.test:
    day.test=True
    delay = 0.05

# Test color and quit if set
if args.test_color is not None:
    day.set_color(args.test_color)
    sys.exit()

# Update Daylight Controller
while True:
    day.update()
    sleep(delay)

