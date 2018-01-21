#/bin/bash

# Inform user of copy
echo " "
echo "Copying dotfiles with 'cp -r .* ~', and deleting the extra 'dotFiles' folder"
echo " "

# Simply a command to run for dotfiles to be copied to the home directory
cp -r .* ~

# Go back home and delete the dot file repo
cd ~
rm -rf dotFiles

echo " "
echo "Done! Please note, any errors about copying git is fine, and should be expected."
echo " "
