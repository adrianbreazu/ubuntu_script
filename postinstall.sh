#!/bin/bash

# add repositories
#reboot device
echo "------------------------"
echo "--- Add repositories ---"
echo "------------------------"
sudo add-apt-repository ppa:webupd8team/sublime-text-3
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb



# update
#reboot device
echo "---------------------------"
echo "--- Basic system update ---"
echo "---------------------------"
sudo apt-get --yes --force-yes update
sudo apt-get --yes --force-yes upgrade


# install apps
echo "--------------------"
echo "--- Install apps ---"
echo "--------------------"

sudo apt-get install --yes --force-yes sublime-text-installer git
sudo dpkg -i google-chrome-stable_current_amd64.deb; sudo apt-get -f install


# make folders
echo "---------------------------"
echo "--- Make folders update ---"
echo "---------------------------"
mkdir ~/repositories

# get repositories
echo "------------------------"
echo "--- Get repositories ---"
echo "------------------------"
git config --global user.email "breazuadrian@gmail.com"
git config --global user.name "Adrian Breazu"


#reboot device
echo "--------------------------"
echo "--- System will reboot ---"
echo "--------------------------"
sudo shutdown -r +3