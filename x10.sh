#!/bin/sh
#Version 1.2.1

#This script works with http://www.heyu.org/ to control X10 units. X10s have an issue
#where they sometimes don't register commands, either due to a large home, many electrical
#sub-panels, or line interference from other devices. This script will resend a command
#over several seconds to be sure that the modules receive the signals. It will also use
#https://github.com/julienXX/terminal-notifier to display completion of the command.
#Examples shown if you want to name modules.

ONOFF=$1
MODULE=$2
HEYU="/usr/local/bin/heyu"

DISPLAY="Module ""$MODULE"

if [ "$MODULE" = "A7" ]; then
	DISPLAY="A7 Steve's Notebook is"
fi
if [ "$MODULE" = "A8" ]; then
	DISPLAY="A8 Holiday Lights are"
fi
if [ "$MODULE" = "A9" ]; then
	DISPLAY="A9 Morning Modules are"
fi
if [ "$MODULE" = "A10" ]; then
	DISPLAY="A10 Afternoon Modules are"
fi

COUNTER=0
while [ $COUNTER -lt 6 ]; do
	"$HEYU" "f""$ONOFF" "$MODULE"
	sleep 10
	let COUNTER=COUNTER+1
done

NOTIFY="$DISPLAY"" now ""$ONOFF"
/usr/local/bin/terminal-notifier -title 'X10 Module' -message "$NOTIFY" -appIcon ~/Scripts/GitHub/x10/x10.png -activate -sender com.apple.Terminal -timeout 10
