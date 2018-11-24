# Ubuntu Cleanup Script
This script removes unneeded files and libraries, including log files and snaps. I originally created it to combat the /var directory filling up (when on a seperate partition). I know there is redundency with apt vs apt-get commands, but I always seem to have more drive space after running both!  I created this for Ubuntu 18.04 (Desktop), but it should run on other distros based on Ubuntu without issue.

To run this script from anywhere, place it in your `/usr/local/bin directory`

To list your partition sizes run `df -Th | sort`
