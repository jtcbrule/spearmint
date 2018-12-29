#!/usr/bin/env bash

sudo apt-get update

# base
sudo apt-get -y install slick-greeter cinnamon-desktop-environment

# gui apt updates
sudo apt-get -y install update-manager

# hack to fix network management
sudo mv /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml-old
sudo mv /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf \
   /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf-old
sudo touch /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf

# themes and icons
sudo apt-get -y install dmz-cursor-theme arc-theme moka-icon-theme

gsettings set org.cinnamon.desktop.wm.preferences theme 'Arc'
gsettings set org.cinnamon.desktop.interface icon-theme 'Moka'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Arc'
gsettings set org.cinnamon.desktop.interface cursor-theme 'DMZ-White'
gsettings set org.cinnamon.theme name 'Arc'

# change volume sound effect
gsettings set org.cinnamon.desktop.sound volume-sound-enabled true
gsettings set org.cinnamon.desktop.sound volume-sound-file \
    '/usr/share/sounds/freedesktop/stereo/dialog-information.oga'

