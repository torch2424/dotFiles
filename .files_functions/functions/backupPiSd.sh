#!/bin/bash

function backupPiSd() {
    if [ "$#" -ne 2 ]; then
        echo "USAGE: ./backupPiSd.sh [Disk e.g (/dev/disk1) or (/dev/sdb)] [nameOfImageFile]"
    else
        echo "This command will run dd. Please beware, and ensure this is the correct disk to be backed up."
        echo " "
        
        # From the pi hut: https://thepihut.com/blogs/raspberry-pi-tutorials/17789160-backing-up-and-restoring-your-raspberry-pis-sd-card 
        sudo dd bs=4M if="$1" of="$2".img

        # Mention piShrink
        echo "Image backup Completed!"
        echo " "
        echo "Next try piShink for minimize the pi image"
        echo "https://github.com/Drewsif/PiShrink/"
        echo " "
        echo "Or, if using torch2424/dotFiles, simply run the piShrink function!"
    fi
}
