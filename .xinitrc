#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

DEFAULT_SESSION='i3 --shmlog-size 0'

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

#get_session(){
#	local dbus_args=(--sh-syntax --exit-with-session)
#	case $1 in
#		awesome) dbus_args+=(awesome) ;;
#		bspwm) dbus_args+=(bspwm-session) ;;
#		budgie) dbus_args+=(budgie-desktop) ;;
#		cinnamon) dbus_args+=(cinnamon-session) ;;
#		deepin) dbus_args+=(startdde) ;;
#		enlightenment) dbus_args+=(enlightenment_start) ;;
#		fluxbox) dbus_args+=(startfluxbox) ;;
#		gnome) dbus_args+=(gnome-session) ;;
#		i3|i3wm) dbus_args+=(i3 --shmlog-size 0) ;;
#		jwm) dbus_args+=(jwm) ;;
#		kde) dbus_args+=(startkde) ;;
#		lxde) dbus_args+=(startlxde) ;;
#		lxqt) dbus_args+=(lxqt-session) ;;
#		mate) dbus_args+=(mate-session) ;;
#		xfce) dbus_args+=(xfce4-session) ;;
#		openbox) dbus_args+=(openbox-session) ;;
#		*) dbus_args+=($DEFAULT_SESSION) ;;
#	esac
#
#	echo "dbus-launch ${dbus_args[*]}"
#}

#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr auto
#exec $(get_session)
#while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
#    do
#    	sleep 1
#    done &

#exec dwm & wmpid=$!

#sleep 5
#/home/reza/Bin/startup.sh

#wait $wmpid

exec i3

### For DWM ####
#/home/reza/Bin/startup.sh
#while true
#do
	# Set root title in dwm bar
#	  sh .xsetroot.sh
	# Check battery level
#	  BATT=$( acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi' )
#         STATUS=$( acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi' )
#        if ([ $BATT -le 5 ] && [ $STATUS == 'Discharging' ]); then
            # Beep
#	    echo -e "\007" >/dev/tty10 && sleep 0.2
#	    echo -e "\007" >/dev/tty10 && sleep 0.2
#	    echo -e "\007" >/dev/tty10 && sleep 0.2
	    # Blink
#	    echo 'on' > /proc/acpi/ibm/light && sleep 1
#	    echo 'off' > /proc/acpi/ibm/light
#	  fi
	  # Update every 1s
#	  sleep 1s
#done &

#exec dwm

