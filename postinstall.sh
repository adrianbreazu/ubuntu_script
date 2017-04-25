#!/bin/bash

# options
echo "Should I get also the git repositories ?"
read getrepostiories

# download apps
echo "------------------------"
echo "---    Download      ---"
echo "------------------------"
cd ~/Downloads
echo "--- Get Sublime 3 ---"
wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb
echo "--- Get PyCharm 2016.2.3 ---"
wget https://download.jetbrains.com/python/pycharm-community-2017.1.1.tar.gz
echo "--- Get Eagle ---"
wget http://www.autodesk.com/eagle-download-lin
echo "--- Get adrduino ---"
wget https://www.arduino.cc/download_handler.php?f=/arduino-1.8.2-linux64.tar.xz
echo "--- Get android ide ---"
wget https://dl.google.com/dl/android/studio/ide-zips/2.3.1.0/android-studio-ide-162.3871768-linux.zip


# update
echo "---------------------------"
echo "--- Basic system update ---"
echo "---------------------------"
sudo apt-get --yes update
sudo apt-get --yes upgrade

sudo apt-get install nvidia-375

# install apps
echo "--------------------"
echo "--- Install apps ---"
echo "--------------------"
apps_to_be_installed="
chromium-browser 
git 
vlc 
vim 
mc 
ssh 
arduino 
arduino-core 
libpq-dev 
postgresql 
postgresql-contrib 
sqlite3 
libsqlite3-dev 
openjdk-9-jdk 
build-essential 
imagemagick 
nodejs 
npm 
gnome-online-accounts 
python 
python3.6
"
cd ~
sudo apt-get install --yes -f install
sudo apt-get install --yes $apps_to_be_installed

## install eagle PCB
echo "--- install eagle lib ---"
eagle_lib="
libssl1.0.0:i386 
libxrender1:i386 
libxrandr2:i386 
libxcursor1:i386 
libfreetype6:i386 
libfontconfig1:i386 
libxi6:i386 
"
sudo apt-get install --yes $eagle_lib

echo "--- install android lib ---"
android_lib="
libc6:i386 
libncurses5:i386 
libstdc++6:i386 
lib32z1 
"
sudo apt-get install --yes $android_lib

## install python apps
echo "--- install python libs ---"
pyhotn_libs="
python-pip 
python3-pip 
python3.6-venv 
python-virtualenv 
python-dev
python3.6-dev
"
sudo apt-get install --yes $pyhotn_libs

echo "--- pip and pip3 upgrade ---"
sudo pip install --upgrade pip
sudo pip3 install --upgrade pip

echo "--- install pip and pip3 packages ---"
sudo pip install flask virtualenv RPi.GPIO psycopg2
sudo pip3 install django flask virtualenv RPi.GPIO psycopg2

cd ~/Downloads
echo "--- install *.deb files ---"
sudo dpkg -i ~/Downloads/*.deb
echo "--- install pycharm ---"
sudo mkdir /opt/pycharm.2017.1.1
sudo tar -xzvf pycharm-community-2017.1.1.tar.gz -C /opt/pycharm.2017.1.1
echo "--- install eagle pcb ---"
sudo mkdir /opt/eaglepcb.8.1.1
sudo tar -xzvf Autodesk_EAGLE_8.1.1_English_Linux_64bit.tar.gz -C /opt/eaglepcb.8.1.1
echo "--- install arduino ---"
sudo mkdir /opt/arduino-1.8.2
sudo tar -xzvf arduino-1.8.2-linux64.tar.xz -C /opt/arduino-1.8.2
echo "--- install arduino ide ---"
sudo mkdir /opt/androidstudio.2.3.1
sudo unzip android-studio-ide-162.3871768-linux.zip -d /opt/androidstudio.2.3.1


# Configure Ubuntu installation
echo "-----------------------------"
echo "--- Config Ubuntu install ---"
echo "-----------------------------"
#configure battery
gsettings set com.canonical.indicator.power show-percentage true
gsettings set com.canonical.indicator.power show-time true
# enable workspace + hide show desktop
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ disable-show-desktop true
# set background image
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/there_is_something_human_in_that_stuff_by_Pierre_Cante.jpg
# fix privacy
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.desktop.screensaver lock-enabled true


# make repository folder
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
