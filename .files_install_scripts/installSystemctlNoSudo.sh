#/bin/bash

# https://github.com/torch2424/dotFiles/blob/master/.files_templates/createAndCopySystemctlService.sh#L65
FILE=/etc/sudoers.d/systemctl-no-sudo
echo " "
echo "Enabling systemctl no sudo in $FILE"
sudo touch $FILE
sudo echo "$(whoami) ALL=NOPASSWD: /bin/systemctl" | sudo tee $FILE

echo " "
echo "Reading/Logging $FILE :"
echo " "

sudo cat $FILE

echo " "
echo "Done!"
echo " "

