#!/bin/bash

# add repositories
#reboot device
echo "------------------------"
echo "--- Add repositories ---"
echo "------------------------"
#sudo add-apt-repository ppa:webupd8team/sublime-text-3
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://download.sublimetext.com/sublime-text_build-3114_amd64.deb
wget https://download.jetbrains.com/python/pycharm-community-2016.1.3.tar.gz



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
cd ~
#sudo apt-get install --yes --force-yes sublime-text-installer
sudo apt-get install --yes --force-yes git vlc vim mc ssh 

## install arduino
sudo apt-get install --yes --force-yes arduino arduino-core 

## install python apps
sudo apt-get install --yes --force-yes python-pip python3-pip web.py python-dev python3-dev apache2 libapache2-mod-wsgi libpq-dev postgresql postgresql-contrib sqlite3 libsqlite3-dev openjdk-9-jre-headless 
sudo apt-get install --yes --force-yes python-qt4 python-qt4-dbus python-qt4-dev python-qt4-doc python-qt4-gl python-qt4-phonon python-qt4-sql python-qtmobility python-qwt3d-qt4 python-qwt5-qt4 qt4-dev-tools python3-dbus.mainloop.qt python3-pyqt4 python3-pyqt4.phononpython3-pyqt4.qsci python3-pyqt4.qtopengl python3-pyqt4.qtsql 

sudo pip install python-rpi.gpio flask virtualenv RPi.GPIO psycopg2
sudo pip3 install python3-rpi.gpio django flask virtualenv RPi.GPIO psycopg2
#sudo dpkg -i google-chrome-stable_current_amd64.deb; sudo apt-get -f install
sudo dpkg -i ~/Downloads/*.deb
sudo mkdir /opt/pycharm.2016.1.3
sudo tar -xzvf pycharm-community-2016.1.3.tar.gz -C /opt/pycharm.2016.1.3



# make folders
echo "---------------------------"
echo "--- Make folders update ---"
echo "---------------------------"
mkdir ~/repositories



# get repositories
echo "------------------------"
echo "--- Get repositories ---"
echo "------------------------"
cd ~/repositories
git config --global user.email "breazuadrian@gmail.com"
git config --global user.name "Adrian Breazu"
git clone https://github.com/adrianbreazu/ProjectMoneyBox.git
git clone https://github.com/adrianbreazu/PyHub.git
git clone https://github.com/adrianbreazu/Arduino_ultrasonic_car.git
git clone https://github.com/adrianbreazu/homeautomation.git
git clone https://github.com/adrianbreazu/LearnDjango19.git
git clone https://abreazu@bitbucket.org/abreazu/ubuntu_script.git
git clone https://abreazu@bitbucket.org/abreazu/sprinklerpi.git
git clone https://bitbucket.org/abreazu/home-automation
git clone https://bitbucket.org/abreazu/bruno-home
git clone https://abreazu@bitbucket.org/abreazu/web_pages_tests.git



#reboot device
echo "--------------------------"
echo "--- System will reboot ---"
echo "--------------------------"
sudo shutdown -r +3