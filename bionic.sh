#!/usr/bin/env bash

if ! [ $(id -u) = 0 ]; then
    echo "Root privileges are required."
    exit 1
fi

# desktop environment
apt-get update
apt-get -y install slick-greeter cinnamon-core

# hack to fix network management
mv /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml-old
mv /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf-old
touch /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf

# gtk bookmark file
apt-get -y install xdg-user-dirs-gtk

# login window settings
apt-get -y install lightdm-settings

# fonts
apt-get -y install fonts-liberation fonts-noto

# sounds
apt-get -y sound-theme-freedesktop

# screenshot utility
apt-get -y install gnome-screenshot

# printer support
apt-get -y install cups system-config-printer

# pdf viewer
apt-get -y install atril

# image viewer
apt-get -y install eom

# text editor
apt-get -y install pluma

# media player
apt-get -y install vlc

# web browser
apt-get -y install firefox

# webcam
apt-get -y cheese

# cursor
apt-get -y install dmz-cursor-theme
# TODO set cursor from command line

# command line utilities
apt-get -y install git
apt-get -y install apt-listchanges

# mint-y theme
git clone https://github.com/jtcbrule/spearmint.git
cp -r spearmint/icons/. /usr/share/cinnamon/icons
cp -r spearmint/themes/. /usr/share/cinnamon/themes
# TODO set theme and icons from command line

# cleanup
if [ -f spearmint/bionic.sh ]; then
    rm $0
fi

