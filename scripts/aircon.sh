#/bin/bash

case $1 in
"21")
    /usr/bin/irsend SEND_ONCE fujitsu_ac on_21_auto_auto
    ;;
"22")
    /usr/bin/irsend SEND_ONCE fujitsu_ac on_22_auto_auto
    ;;
"23")
    /usr/bin/irsend SEND_ONCE fujitsu_ac on_23_auto_auto
    ;;
"24")
    /usr/bin/irsend SEND_ONCE fujitsu_ac on_24_auto_auto
    ;;
"23_cool")
    /usr/bin/irsend SEND_ONCE fujitsu_ac on_23_cool_auto
    ;;
"23_heat")
    /usr/bin/irsend SEND_ONCE fujitsu_ac on_23_heat_auto
    ;;
*)
    echo "Usage: $0 <mode>"
    ;;
esac
