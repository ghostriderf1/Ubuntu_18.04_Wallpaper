#!/bin/bash


sleep 5		# allow time for the network settings to load at startup

SCHOME=/home/user/wallpaper  # edit user name
BGFILE=$SCHOME/sys.info
BG=$SCHOME/bg.png
ORIGWALL=/usr/share/backgrounds/backup/warty-final-ubuntu.png # select a wallpaper
NEWWALL=$SCHOME/wallpaper.png
WALL=/usr/share/backgrounds/default.png

> $BGFILE


B_HOSTNAME=`hostname`
B_IPADDRESS=`/sbin/ifconfig | grep -w inet | grep -v 127.0.0.1 | awk '{ print $2}'`


echo  F1tenth >> $BGFILE # edit project name
echo  $B_HOSTNAME >> $BGFILE
echo  $B_IPADDRESS >> $BGFILE


cat $BGFILE | \
convert -font Century-Schoolbook-L-Roman -pointsize 80 \
        -background none \
        -fill white \
		-gravity center \
        label:@- $BG

composite -gravity center $BG $ORIGWALL $NEWWALL
cp $NEWWALL $WALL

gsettings set org.gnome.desktop.background picture-uri file:///home/user/wallpaper/wallpaper.png # edit user name
