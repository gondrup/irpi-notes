#!/usr/bin/python3

import paho.mqtt.client as mqtt
from time import sleep
from subprocess import call

SH_CMD='/bin/bash'

TV_TOPIC='aacars/tv'
AIRCON_TOPIC='aacars/aircon'

TV_SH_SCRIPT='/home/pi/irpi/scripts/tv.sh'
AIRCON_SH_SCRIPT='/home/pi/irpi/scripts/aircon.sh'

def dispatch_tv_command(command):
    print('Dispatching TV command: {}'.format(command))
    shell_cmd = [SH_CMD, TV_SH_SCRIPT, command]
    print('Running "{}"'.format(shell_cmd))
    call(shell_cmd)

def dispatch_aircon_command(command):
    print('Dispatching Air-Con command: {}'.format(command))
    shell_cmd = [SH_CMD, TV_AIRCON_SCRIPT, command]
    print('Running "{}"'.format(shell_cmd))
    call(shell_cmd)
    
def on_message(client, userdata, message):
    message_str = str(message.payload.decode('utf-8'))

    #print('message: {}'.format(message_str))
    #print('topic: {}'.format(message.topic))

    if message.topic == TV_TOPIC:
        #print('TV Control!')
        dispatch_tv_command(message_str)
    elif message.topic == AIRCON_TOPIC:
        #print('Air-Con Control!')
        dispatch_aircon_command(message_str)
    
client = mqtt.Client('Raspberry Pi IR')
client.on_message=on_message

client.connect('hugebeef.com')

client.subscribe("aacars/tv")
client.subscribe("aacars/aircon")

while True:
    client.loop_start()

client.loop_stop()
