#!/bin/bash
SOURCE_DIR=$HOME/Ubuntu
source ./progress.sh

progress_start "更新软件包"
(sudo apt-get -y update) > /dev/null 2>&1
(sudo apt-get -y upgrade) > /dev/null 2>&1
progress_done


sudo -E $SOURCE_DIR/script/install_software.sh all

sudo -E bash $SOURCE_DIR/script/IDE.sh

sudo -E $SOURCE_DIR/script/encrypt.sh
