#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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

# monitors
sleep 5;~/bin/xrandr.sh

# compositor
picom --no-fading-openclose &

# wallpaper
sleep 5;feh --bg-fill --randomize ~/Pictures/Wallpaper/*

# brightness
xrandr --output eDP-1 --brightness 0.7

# Autostart
(sleep 5 && wmname LG3D) &
rclone --vfs-cache-mode writes mount "college":  ~/workspace/college/ &
flameshot &
slstatus &
ibus-daemon -drxR &
volumeicon &
nm-applet &
udiskie &
blueman-applet &
discord &

exec dwm
