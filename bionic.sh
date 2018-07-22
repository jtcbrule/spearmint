#!/usr/bin/env bash

if ! [ $(id -u) = 0 ]; then
    echo "Root privileges are required."
    exit 1
fi

# base system
apt-get update
apt-get -y install slick-greeter cinnamon-core

# hack to fix network management
mv /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml-old
mv /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf-old
touch /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf

# miscellaneous utilities
apt-get -y install xdg-user-dirs-gtk
apt-get -y install gnome-screenshot
apt-get -y install lightdm-settings

# fonts
apt-get -y install fonts-liberation fonts-noto

# sounds
apt-get -y sound-theme-freedesktop

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

# theme
apt-get -y install dmz-cursor-theme
gsettings set org.cinnamon.desktop.interface cursor-theme "DMZ-White"

