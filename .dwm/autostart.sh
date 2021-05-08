#/bin/sh
# force main monitor to be primary 
xrandr --output HDMI-0 --primary

xcompmgr &
nitrogen --restore &
dwmblocks 2>&1 >/dev/null &

redshift

XNOTIFY_FIFO="$HOME/.cache/xnotify$DISPLAY.fifo"
export XNOTIFY_FIFO
rm -f $XNOTIFY_FIFO
mkfifo $XNOTIFY_FIFO
xnotify -g -5+20 0<>$XNOTIFY_FIFO &
echo $XNOTIFY_FIFO
tiramisu -j | jq --raw-output --unbuffered '.summary + "\t" + .body' > $XNOTIFY_FIFO &

