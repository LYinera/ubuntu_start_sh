#!/bin/bash
source ./progress.sh
progress_start "部署加密"
sudo sed -i 's/GRUB_DEFAULT=0/GRUB_DEFAULT="Advanced options for ubuntu>Ubuntu，Linux 5.4.0-42-generic"/g' /etc/default/grub
sudo sed -i 's/GRUB_TIMEOUT_STYLE=hidden//g' /etc/default/grub
sudo sed -i 's/GRUB_TIMEOUT=0/GRUB_TIMEOUT=30/g' /etc/default/grub

sudo update-grub                                                               > /dev/null 2>&1
apt-mark hold linux-image-5.4.0-42-generic                                     > /dev/null 2>&1
apt-mark hold linux-headers-5.4.0-42-genesric                                  > /dev/null 2>&1
apt-mark hold linux-modules-extra-5.4.0-42-generic                             > /dev/null 2>&1

sudo more /boot/grub/grub.cfg | grep menusudo chmod 777 $HOME/Ubuntu/software/UltraSec20.04/ultrasec_V300R007C00_amd64.deb > /dev/null 2>&1
sudo dpkg -i $HOME/Ubuntu/software/UltraSec20.04/ultrasec_V300R007C00_amd64.deb > /dev/null 2>&1

progress_done