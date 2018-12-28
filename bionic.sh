#!/usr/bin/env bash

if ! [ $(id -u) = 0 ]; then
    echo "Root privileges are required."
    exit 1
fi

apt-get update

# base
apt-get -y install slick-greeter cinnamon-desktop-environment

# hack to fix network management
mv /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml-old
mv /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf \
   /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf-old
touch /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf

# themes and icons
apt-get -y install dmz-cursor-theme arc-theme moka-icon-theme

gsettings set org.cinnamon.desktop.wm.preferences theme 'Arc'
gsettings set org.cinnamon.desktop.interface icon-theme 'Moka'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Arc'
gsettings set org.cinnamon.desktop.interface cursor-theme 'DMZ-White'
gsettings set org.cinnamon.theme name 'Arc'

# gui apt updates
apt-get -y install update-manager

