#!/bin/bash

# From: https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04

echo " "
echo "Install MongoDB..."
echo "This will require some confirmation in some places, so be ready to press enter, and say yes :)"
echo " "

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod

echo " "
echo "MongoDB Installed, and enabled at boot, showing systemctl status..."
echo " "

sudo systemctl status mongod

echo " "
echo "If you see a status here, Mongo is installed! And control mongo with systemctl!"
echo " "
echo "Done! Enjoy Losing your data! Jk! See the joke below:"
echo "https://www.reddit.com/r/mongodb/comments/43m2om/how_exactly_does_mongodb_lose_data_and_is_it/"
echo " "
