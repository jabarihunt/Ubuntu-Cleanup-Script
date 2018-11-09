#!/bin/bash
###############################################################################
# This script removes unneeded files and libraries, including log files and snaps.
# I originally created it to combat the /var directory filling up (when on a
# seperate partition). I know there is redundency with apt vs apt-get commands,
# but I alsways seem to have more drive space after running both!
#
# I created this for Ubuntu 18.04 (Desktop), but it should run on other distros
# based on Ubuntu without issue.
#
# To run this script from anywhere, place it in your /usr/local/bin directory
#
# To list your partition sizes run: df -Th | sort
###############################################################################

# Remove apt / apt-get files
sudo apt clean
sudo apt -s clean
sudo apt clean all
sudo apt autoremove
sudo apt-get clean
sudo apt-get -s clean
sudo apt-get clean all
sudo apt-get autoclean

#Remove Old Log Files
sudo rm -f /var/log/*gz

# Remove Thumbnail Cache
rm -rf ~/.cache/thumbnails/*

# Remove old snaps
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done