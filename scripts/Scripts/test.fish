#!/usr/bin/fish

clear

if test -e /tmp/test_toggle
	echo "File exists"
	rm /tmp/test_toggle
else
	echo "File does not exist"
	touch /tmp/test_toggle
end

