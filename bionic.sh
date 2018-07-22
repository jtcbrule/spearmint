#!/usr/bin/env bash

if ! [ $(id -u) = 0 ]; then
    echo "Root privileges are required."
    exit 1
fi

# base system
apt install slick-greeter

apt install cinnamon-core
rm /etc/netplan/01-netcfg.yaml

apt install gnome-terminal

# utils

