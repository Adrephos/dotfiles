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
sleep 5;autorandr -c

# compositor
picom --no-fading-openclose &

# wallpaper
sleep 5;feh --bg-fill --randomize ~/Pictures/Wallpaper/Current

# brightness
xrandr --output eDP --brightness 0.8

xsetroot -cursor_name left_ptr

# Autostart
(sleep 5 && wmname LG3D) &
autostart_huion &
flameshot &
nm-applet &
udiskie &
blueman-applet &
discord &
xmousepasteblock &
setxkbmap -layout us -variant altgr-intl -option nodeadkeys &
(sleep 5 && clipit) &

while true; do
  slstatus &
  temperature &
  sleep 240s
  killall slstatus
done &

exec dwm
