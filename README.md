# Initial set-up

## Install Raspbian

- Use gparted to partition and format SD card as FAT32
- Download NOOBS: https://www.raspberrypi.org/downloads/noobs/
- Unzip and copy the contents of NOOBS to SD
- Boot pi and install Raspbian from the GUI

## Set-up LIRC

### Reference

- Driver reference: http://aron.ws/projects/lirc_rpi/
- LIRC set-up notes here: https://github.com/josemotta/IoT.Starter.Api/tree/master/gpio-base

### Process

#### Install Lirc like so:

    apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y lirc \
    && rm -rf /var/lib/apt/lists/*

#### Uncomment and update the line to enable lirc-rpi kernel module with correct GPIO pins:

    # Uncomment this to enable the lirc-rpi module
    dtoverlay=lirc-rpi,gpio_out_pin=22,gpio_in_pin=23,gpio_in_pull=up


#### Edit file /etc/lirc/lirc_options.conf and change:

    from:
    driver  = devinput
    device  = auto
    
    to:
    driver  = default
    device  = /dev/lirc0

#### Reboot and test

	systemctl stop lircd.socket lircd.service
	mode2 --driver default --device /dev/lirc0

Press buttons on a remote and watch for output

## Record remote input

- Run mode2 command and pipe into file
- Press remote button
- Ctrl+c
- Copy output of mode2 to config file as command, replace "pause" and "pulse" with spaces

# Plan

- Record all possible air con configs (e.g. 22 degrees on, 23 degrees on) and create a config
- Create basic web API & test page to run the commands
- Create tasker widget for phone
- Add cron jobs to do stuff, examples:
	- turn tv on before 9 am
	- turn tv off after 5 pm
	- turn on aircon before 9 am in time to heat office ready for our arrival
	- turn off aircon after 5 pm
- Implement cron jobs as one cron that calls a "worker" script that can then be configured by scheduling
- Password protect the pi
- Enable Wifi with dongle
- Test on battery

# SFX

curl http://192.168.0.81/play.php --data "source=/var/www/html/sound/off_on.mp3"
curl http://192.168.0.81/play.php --data 'say="a"'

# Webcam

sudo apt install fswebcam
fswebcam -r 640x480 ~/Pictures/webcamtest.jpg

# Web API

[https://getgrav.org/blog/raspberrypi-nginx-php7-dev]

sudo apt install php7.0 php7.0-curl php7.0-gd php7.0-fpm php7.0-cli php7.0-opcache php7.0-mbstring php7.0-xml php7.0-zip
php -v
sudo apt install nginx
