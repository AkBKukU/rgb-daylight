#!/usr/bin/python3

class RGB(object):

    def __init__(self,r=None,g=None,b=None):

        self._white_balance = [1,1,1]
        self._intensity = 1
        self._color = [0,0,0]
        if ( (r is not None) and (g is not None) and (b is not None) ):
            self.r_led = r
            self.g_led = g
            self.b_led = b

    def set(self):
        r=self.color[0] * self.white_balance[0] * self.intensity
        g=self.color[1] * self.white_balance[1] * self.intensity 
        b=self.color[2] * self.white_balance[2] * self.intensity 

        pwm = open('/dev/pi-blaster', 'w')
        pwm.write(str(self.r_led)+"="+str(r)+" ")
        pwm.write(str(self.g_led)+"="+str(g)+" ")
        pwm.write(str(self.b_led)+"="+str(b)+"\n")
        pwm.close()

    @property
    def color(self):
        return self._color

    @color.setter
    def color(self, value):
        self._color = value
        self.set()

    @property
    def intensity(self):
        return self._intensity

    @intensity.setter
    def intensity(self, value):
        self._intensity = value
        self.set()

    @property
    def white_balance(self):
        return self._white_balance

    @white_balance.setter
    def white_balance(self, value):
        self._white_balance = value
        self.set()
