# RGB Daylight Simulator
*RGB LED controller for simulating the full day light cycle run on an RPI*

I wanted to create an artificial source of "daylight" for the purpose of
subconsciously being aware of what time it is as I toil away at my computer all
day. So I picked up an RGB LED strip to stick behind my computer monitors and threw
together this project to achieve that.

It works by calculating the position of the sun throughout the day and changing 
the color and intensity of the RGB lights to try and mimic the light you would
see coming from behind a curtain over a window. 

It is intended to be run on a Raspberry Pi as an inexpensive controller. The 
concept is simple enough to run something simpler like an Arduino but I just 
felt like doing it on a Pi and it was easy to use existing python modules for 
the sun position calculations. This also leaves the door open for potential 
future features to add remote control if you use a WiFi equipped model.


## Install
The program doesn't install and is just used directly with `./rgb-daylight.py`. It has 
the following dependancies

 - [astral](https://pypi.org/project/astral/): `sudo pip3 install astral`
 - [pi-blaster](https://github.com/sarfata/pi-blaster/): Clone git repo and standard autoconf install

*You may need to manually run `pi-blaster` after installing it the first time 
or just reboot*

Once everything is installed you can just download these files and run them:
 
     git clone https://github.com/AkBKukU/rgb-daylight
     cd rgb-daylight
     ./rgb-daylight

After that you can quit it with `ctrl+c` and then go through the [Setup](#setup) steps
to configure it for your use.

### Installation Method 1
If you have your pi auto login and want the program to run on boot, add the following
lines to the `/home/pi/.bashrc` file:

     cd rgb-daylight
     ./rgb-daylight

### Installation Method 2
If you prefer to create a service instead, move `rgb-daylight.service` to `/lib/systemd/system` and run the following:
`sudo systemctl daemon-reload`
`sudo systemctl enable rgb-daylight.service`
`sudo systemctl start rgb-daylight.service`
*By default, the unit file assumines you cloned the repo to `/home/pi/`, if necessary, change the location in the unit file to the path you've cloned the repo to.*

## Build

You're going to need to build a driver interface of some kind to connect the RPI
to the LEDs. If you are using a typical "5050" +12V,G,R,B LED strip like I 
designed this with you can take a look at this 
[example schematic](eda/pi-connection.pdf) on what parts to use and how to
connect them. The pins that are used on the RPI aren't significant, any GPIO 
will work. You just need to update the pinout in `rgb-daylight.py` to match how you put 
it together.

## Setup

After the first time you run `rgb-daylight.py` a `settings.json` file will be 
created with several things in it that you will need to change to match your 
build, location, and preferences. 

#### `led_pins`
These are the GPIO pin numbers that the LEDs are controlled with. The default
values match the schematic but if you made changes you will need to update those
to match your build. The allowed pins are limited by [pi-blaster](https://github.com/sarfata/pi-blaster/)
so you should look at the documentation for that for info on which ones you can
use.

#### `intensity`
This is the overall brightness of the lights as controlled by the PWM. It takes
decimal values between 0 and 1 (exa, 0.75).


#### `white_balance`
RGB lights are rarely "white" when all three elements are on fully on. This will
allow you to adjust individual intensities for the RGB channels to attempt to 
correct this.

#### `position`
The `position` settings are perphaps the most important for this project because
they are used to match the light to your local(or any other) specific daylight
conditions. They are used by [astral](https://pypi.org/project/astral/) to 
do the sun position calculations.

##### `timezone`
This needs to be set to the timezone you need to match. The possible values for
this are determined by the `pytz` module. The easiest way to find the acceptable 
values is to run `python3` in a console and run the following commands to have
`pytz` print out the options:

	from pytz import all_timezones
	for timezone in all_timezones:
		print(timezone)

*(You may need to press enter one more time after the print command before it 
runs)*

A small note about daylight savings time. I am not 100% sure how this will
handle DST. I am in Arizona where we do not participate in DST and have not 
needed to counter-program it. I suspect that it will "Just Work" because I think
[astral](https://pypi.org/project/astral/) internally only uses UTC and only
calculates relative values. So the actual local time doesn't matter. But if 
there is an problem feel free to open an issue and I'll attempt to fix it.

##### `latitude` & `longitude`
This is the exact location you want to calculate the sun position from. I would
recommend looking up the location of a nearby airport and using the values for
that. It will provide a known refrence you can compare your results to.

#### `timezone_offset`
You don't need to change this. This only effects the printed valus in the
terminal for debugging purposes. You can set this to whatever your hours offset
from UTC is.

#### `colors`
These are the colors used for the different times of the day. The default colors
are intended to be more realistically subtle but you can change them to
anything. The values are like the others, a decimal number from 0-1. The values
are for the Red, Green, and Blue LEDs in that order for each period.

So as an example, if you want a neon magenta sunset, just change the `sunset` 
values to `[1,0,0.5]` and start the program.
