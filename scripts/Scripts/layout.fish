#!/usr/bin/fish

bspc desktop -f 'A1'
firefox &

noti -m "Started firefox"

bspc desktop -f 'B2'
qutebrowser &

noti -m "Started qutebrowser"

bspc desktop -f 'A1'
