# x10
Pre-script for use with heyu to better control X10 modules.

This script works with http://www.heyu.org/ to control X10 units. X10s have an issue
where they sometimes don't register commands, either due to a large home, many electrical
sub-panels, or line interference from other devices. This script will resend a command
over several seconds to be sure that the modules receive the signals. It will also use
https://github.com/julienXX/terminal-notifier to display completion of the command.
Examples shown if you want to name modules.
