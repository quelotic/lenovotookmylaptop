#!/bin/bash

# add this line to the i3 config file
# bindsym XF86TouchpadToggle exec /some/path/toggletouchpad.sh # toggle touchpad

if synclient -l | grep "TouchpadOff .*=.*0" ; then
    synclient TouchpadOff=1 ;
else
    synclient TouchpadOff=0 ;
fi
