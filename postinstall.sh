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
wget https://download.jetbrains.com/python/pycharm-community-2016.2.3.tar.gz
echo "--- Get Eagle ---"
wget http://web.cadsoft.de/ftp/eagle/program/7.6/eagle-lin64-7.6.0.run
echo "--- Get visual studio code ---"
wget https://az764295.vo.msecnd.net/stable/9e4e44c19e393803e2b05fe2323cf4ed7e36880e/code_1.6.1-1476373175_amd64.deb
echo "--- Get android ide ---"
wget https://dl.google.com/dl/android/studio/ide-zips/2.2.1.0/android-studio-ide-145.3330264-linux.zip

# update
echo "---------------------------"
echo "--- Basic system update ---"
echo "---------------------------"
sudo apt-get --yes update
sudo apt-get --yes upgrade





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
apache2
libapache2-mod-wsgi
libpq-dev
postgresql
postgresql-contrib
sqlite3
libsqlite3-dev
openjdk-9-jdk
build-essential
guake
imagemagick
nodejs
npm
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
python3-virtualenv
python-virtualenv
python-dev
python3-dev
python-web2py
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
sudo mkdir /opt/pycharm.2016.2.3
sudo tar -xzvf pycharm-community-2016.2.3.tar.gz -C /opt/pycharm.2016.2.3
echo "--- install arduino ide ---"
sudo mkdir /opt/arduinostudio
sudo unzip android-studio-ide-145.3330264-linux.zip -d /opt/arduinostudio


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
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/IMG_7632_by_Jobin_Babu.jpg
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


# install eagle PCB
cd ~/Downloads
chmod a+x eagle-lin64-7.6.0.run
./eagle-lin64-7.6.0.run



#reboot device
echo "--------------------------"
echo "--- System will reboot ---"
echo "--------------------------"
sudo shutdown -r +3