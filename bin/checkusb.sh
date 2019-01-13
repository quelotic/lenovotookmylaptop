#!/usr/bin/env bash

# If there is a device that is misbehaving (auto = suspend is allowed, on = suspend is not allowed)
# add the appropriate line in /etc/udev/rules.d/91.local.rules (note that 91 is higher than 42 in the
# filename of /usr/lib/udev/rules.d/42-usb-hid-pm.rules, so it gets executed "after")
#
# ACTION=="add", SUBSYSTEM=="usb", ATTR{product}=="Razer Abyssus", ATTR{power/control}="on"
#
# Then reload the rules
# udevadm control --reload

for d in /sys/bus/usb/devices/[0-9]* ;
do
    if [[ -e $d/product ]] ;
    then echo -e "`basename $d`\t`cat $d/power/control`\t`cat $d/speed`\t`cat $d/product`" ;
fi ;
done
