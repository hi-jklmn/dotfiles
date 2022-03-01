#!/bin/bash

LED_DIR=/sys/class/leds

CAPS="input3::capslock"
BACK="platform::kbd_backlight"

turn_on_led () {
	echo 1 > $LED_DIR/$1/brightness
}

turn_off_led () {
	echo 0 > $LED_DIR/$1/brightness
}

toggle_led () {
	BRIGHTNESS=$LED_DIR/$1/brightness
	if [ $(cat $BRIGHTNESS) -eq 0 ]
	then
		turn_on_led $1
	else
		turn_off_led $1
	fi
}

turn_off_led $CAPS
turn_off_led $BACK

for i in {1..10}
do
	sleep $(calc -pd 1/$i)
	turn_on_led $CAPS
	sleep $(calc -pd 1/$i)
	turn_off_led $CAPS
done

