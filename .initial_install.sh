#!/usr/bin/env bash

# File to get my computer up and running, meant for ubuntu 16.04

# Add our 3rd party ppas
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:dawidd0811/neofetch
sudo add-apt-repository -y ppa:linrunner/tlp
sudo add-apt-repository -y ppa:numix/ppa
sudo add-apt-repository -y ppa:moka/stable

# Update for our ppas
sudo apt-get update

# Install Some apt-get packages (Some from ppas)
sudo apt-get install -y vim git atom ubuntu-restricted-extras vlc tlp tlp-rdw numix-icon-theme-circle steam conky moka-icon-theme gparted neofetch

# Start tlp for battery savings
sudo tlp start

# Install google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i --force-depends google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

#Install Franz (https://gist.github.com/ruebenramirez/22234da93f08be65125cc45fc386c1cd)
sudo rm -fr /opt/franz
sudo rm -fr /usr/share/applications/franz.desktop
sudo mkdir -p /opt/franz
wget -qO- https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-linux-x64-4.0.4.tgz | sudo tar xvz -C /opt/franz/
sudo wget "https://cdn-images-1.medium.com/max/360/1*v86tTomtFZIdqzMNpvwIZw.png" -O /opt/franz/franz-icon.png
sudo bash -c "cat <<EOF > /usr/share/applications/franz.desktop                                                                 
[Desktop Entry]
Name=Franz
Comment=
Exec=/opt/franz/Franz
Icon=/opt/franz/franz-icon.png
Terminal=false
Type=Application
Categories=Messaging,Internet
EOF"

# Move the Unity Bar to the bottom
gsettings set com.canonical.Unity.Launcher launcher-position Bottom

# Change the status bar transparency
# Get transparency: gsettings get org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ panel-opacity
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ panel-opacity 0.25

# Enable workspaces, and change size
# Enable workspaces in Settings > Appearance > Behavior
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 3
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 3

# Install our Ubuntu Themes
# http://askubuntu.com/questions/660855/how-can-you-change-unitys-theme-from-the-command-line
gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'

# Configure our git
git config --global user.email "aaron@aaronthedev.com"
git config --global user.name "Aaron Turner"


# TODO: Install Node
