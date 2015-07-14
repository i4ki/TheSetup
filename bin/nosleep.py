# import the module
from pymouse import PyMouse
import time

# instantiate an mouse object
m = PyMouse()
incx = 1
incy = 1

while True:
    position = m.position()
    # move the mouse to int x and int y (these are absolute positions)
    m.move(position[0]+incx, position[1]+incy)

    incx = -incx
    incy = -incy
    print m.position()
    time.sleep(50)
