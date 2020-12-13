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
The program doesn't install and is just used directly with `./run.py`. It has 
the following dependancies

 - [astral](https://pypi.org/project/astral/): `sudo pip3 install astral`
 - [pi-blaster](https://github.com/sarfata/pi-blaster/): Clone git repo and standard autoconf install

*You may need to manually run `pi-blaster` after installing it the first time 
or just reboot*

Once everything is installed you can just download these files and run them:


## Build

You're going to need to build a driver interface of some kind to connect the RPI
to the LEDs. If you are using a typical "5050" +12V,G,R,B LED strip like I 
designed this with you can take a look at this 
[example schematic](eda/pi-connection.pdf) on what parts to use and how to
connect them. The pins that are used on the RPI aren't significant, any GPIO 
will work. You just need to update the pinout in `run.py` to match how you put 
it together.

## Setup

`run.py` has several things in it that you will need to change to match your
build, location, and preferences. 

#### `lights = RGB(r=22,g=27,b=17)`
This creates an interface to the LEDs based on the pins you have them connected to. 
If you use different pins update those numbers to match the GPIO numbers you 
used for each color.

#### `lights.intensity=1`
This is the overall brightness of the lights as controlled by the PWM. It takes
decimal values between 0 and 1 (exa, 0.75).


#### `lights.white_balance = [1,0.9,0.7]`
RGB lights are rarely "white" when all three elements are on fully on. This will
allow you to adjust individual intensities for the RGB channels to attempt to 
correct this.

#### Location and Timezone
`day.position = ["Phoenix","America","America/Phoenix",33.434061, -112.016303,346]`

This line does multiple things, it sets your region, timezeone, and the exact 
location to calculate the sun's position relative to.
