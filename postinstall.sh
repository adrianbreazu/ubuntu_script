#!/bin/bash

# options
echo "Should I get also the git repositories ?"
read getrepostiories

# add repositories
#reboot device
echo "------------------------"
echo "--- Add repositories ---"
echo "------------------------"
cd ~/Downloads
wget https://download.sublimetext.com/sublime-text_build-3114_amd64.deb
wget https://download.jetbrains.com/python/pycharm-community-2016.1.3.tar.gz



# update
#reboot device
echo "---------------------------"
echo "--- Basic system update ---"
echo "---------------------------"
sudo apt-get --yes --allow update
sudo apt-get --yes --allow upgrade



# install apps
echo "--------------------"
echo "--- Install apps ---"
echo "--------------------"
cd ~
sudo apt-get install --yes --allow -f install
sudo apt-get install --yes --allow chromium-browser git vlc vim mc ssh 

## install arduino
sudo apt-get install --yes --allow arduino arduino-core 

## install python apps
sudo apt-get install --yes --allow python3-pip web.py python-dev python3-dev apache2 libapache2-mod-wsgi libpq-dev postgresql postgresql-contrib sqlite3 libsqlite3-dev openjdk-9-jre-headless 
sudo apt-get install --yes --allow python-qt4 python-qt4-dbus python-qt4-dev python-qt4-doc python-qt4-gl python-qt4-phonon python-qt4-sql python-qtmobility python-qwt3d-qt4 python-qwt5-qt4 qt4-dev-tools python3-dbus.mainloop.qt python3-pyqt4 python3-pyqt4.phononpython3-pyqt4.qsci python3-pyqt4.qtopengl python3-pyqt4.qtsql 
sudo pip install --upgrade pip
sudo pip3 install --upgrade pip
sudo pip install flask virtualenv RPi.GPIO psycopg2
sudo pip3 install django flask virtualenv RPi.GPIO psycopg2
#sudo dpkg -i google-chrome-stable_current_amd64.deb; sudo apt-get -f install
cd ~/Downloads
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
if [$getrepostiories = "yes"]
	then 
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
fi



#reboot device
echo "--------------------------"
echo "--- System will reboot ---"
echo "--------------------------"
sudo shutdown -r +3