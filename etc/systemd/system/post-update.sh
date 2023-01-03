#!/bin/bash

if [ ! -f /post-update-done ]; then
    steamos-readonly disable
    pacman-key --init
    pacman-key --populate archlinux
    pacman -S --noconfirm glibc ranger
    sed -i 's/#\(ja_JP.UTF-8.*\)/\1/' /etc/locale.gen
    locale-gen
    touch /post-update-done
    steamos-readonly enable
fi
