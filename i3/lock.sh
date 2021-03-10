#!/bin/sh
set -e
xset s off dpms 0 10 0

batata=`xrdb -query | grep "\*\.background:" | cut -f 2 | sed 's/#//'`
i3lock --color=$batata --ignore-empty-password --show-failed-attempts --nofork
xset s off -dpms
