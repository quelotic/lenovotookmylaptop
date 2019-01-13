#!/usr/bin/env bash
#
# IPfetch v1.0
# This script will fetch your public IP from ifconfig.co
# and if it's changed, it'll send it to someone (self)
# using the telegram-cli program

newip=$(curl -s ifconfig.co)
file=$HOME/tmp/public.ip

if [ -e $file ]; then
    oldip=$(cat $file)
    echo $newip > $file
else
    mkdir $HOME/tmp
    touch $file
    echo $newip > $file
    oldip=0.0.0.0
fi

if [ "$oldip" == "$newip" ]; then
    exit 0
else
    telegram-cli -W -e "msg Thomas_A. $newip" &>/dev/null
#    mail -s "arcturus public ip has changed" "thomas.antoniou@hotmail.com" < public.ip
fi
