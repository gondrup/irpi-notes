#/bin/bash

case $1 in
"power")
    /usr/bin/irsend SEND_ONCE MKJ40653802-TV KEY_POWER
    ;;
"up")
    /usr/bin/irsend SEND_ONCE MKJ40653802-TV KEY_UP
    ;;
"down")
    /usr/bin/irsend SEND_ONCE MKJ40653802-TV KEY_DOWN
    ;;
"left")
    /usr/bin/irsend SEND_ONCE MKJ40653802-TV KEY_LEFT
    ;;
"right")
    /usr/bin/irsend SEND_ONCE MKJ40653802-TV KEY_RIGHT
    ;;
"pageup")
    /usr/bin/irsend SEND_ONCE MKJ40653802-TV KEY_PAGEUP
    ;;
"pagedown")
    /usr/bin/irsend SEND_ONCE MKJ40653802-TV KEY_PAGEDOWN
    ;;
"volumeup")
    /usr/bin/irsend SEND_ONCE MKJ40653802-TV KEY_VOLUMEUP
    ;;
"volumedown")
    /usr/bin/irsend SEND_ONCE MKJ40653802-TV KEY_VOLUMEDOWN
    ;;
"mute")
    /usr/bin/irsend SEND_ONCE MKJ40653802-TV KEY_MUTE
    ;;
*)
    echo "Usage: $0 <command>"
    ;;
esac
