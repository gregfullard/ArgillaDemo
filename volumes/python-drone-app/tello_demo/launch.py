import tello
import time

#drone = tello.Tello('192.168.10.3', 8889)
drone = tello.Tello('172.17.0.2', 8889)
drone.takeoff()
#time.sleep(5)
#drone.set_speed(2)
#time.sleep(1)
#drone.move_forward(10)
#time.sleep(10)
#drone.rotate_cw(180)
#time.sleep(5)
drone.land()
