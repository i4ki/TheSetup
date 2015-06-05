# import the module
from pymouse import PyMouse
import random
import time

# instantiate an mouse object
m = PyMouse()

while True:
    x = random.randint(0, 400)
    y = random.randint(0, 400)
    
    # move the mouse to int x and int y (these are absolute positions)
    m.move(x, y)

    print m.position()
    time.sleep(50)
