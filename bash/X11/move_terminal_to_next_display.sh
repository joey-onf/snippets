#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Launch a shell in another monitor
## -----------------------------------------------------------------------
export PATH="/usr/bin:$PATH"

xdotool="/usr/bin/xdotool"
wmctrl="/usr/bin/wmctrl"

wid=$("${xdotool}" getactivewindow)
max_state=$(xprop -id "$wid _NET_WM_STATE")

"${wmctrl}" -ir "$wid" -b remove,maximized_vert,maximized_horz
eval $("${xdotool}" getwindowgeometry --shell "$wid")

new_x=1600
if [[ "$X" -ge "$new_x" ]]; then
  new_x=0
fi

"${xdotool}" windowmove "$wid" "$new_x" "$Y"
# if [ -z "${max_state/*_NET_WM_STATE_MAXIMIZED_*/}" ]; then
#   "${wmctrl}" -ir $wid -b add,maximized_vert,maximized_horz
# fi

"${xdotool}" windowraise "$wid"

# ..seealso: https://unix.stackexchange.com/questions/106793/how-can-i-open-a-window-on-a-different-monitor

# [EOF]
