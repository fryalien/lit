#!/bin/sh

prefix="/usr"
exec_prefix="${prefix}"
xrdb="xrdb"
xinitdir="/etc/X11/xinit"
xclock="xclock"
xterm="xterm"
twm="twm"
xmodmap="xmodmap"

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources="$xinitdir/.Xresources"
sysmodmap="$xinitdir/.Xmodmap"

# merge in defaults and keymaps

if [ -f "$sysresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$sysresources"
    else
        "$xrdb" -nocpp -merge "$sysresources"
    fi
fi

if [ -f "$sysmodmap" ]; then
    "$xmodmap" "$sysmodmap"
fi

if [ -f "$userresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$userresources"
    else
        "$xrdb" -nocpp -merge "$userresources"
    fi
fi

if [ -f "$usermodmap" ]; then
    "$xmodmap" "$usermodmap"
fi

# start some nice programs

if [ -d "$xinitdir"/xinitrc.d ] ; then
	for f in "$xinitdir/xinitrc.d"/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi


# MY STUFF

# Other things
export SSH_AUTH_SOCK
export XDG_SESSION_TYPE=X11
export GDK_BACKEND=x11
export GTK_THEME="Arc-Dark"
export QT_QPA_PLATFORMTHEME=gtk
# Fix misbehaving Java apps
export _JAVA_AWT_WM_NONREPARENTING=1

# keyboard
setxbmap -layout us &
sxhkd &

# screen
xrandr --output Virtual-1 --mode 1920x1080

# compositor
picom -f &

#network
#nm-applet

# vritualbox
/usr/bin/VBoxClient --clipboard &
/usr/bin/VBoxClient --dispaly &

# wallpaper
nitrogen --restore &

xrdb -merge ~/.Xresources

# dwm always run
#while true; do
#	dwm >/dev/null 2>&1
#done

# dwm
exec dwm
