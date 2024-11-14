#!/bin/bash
cmd="$1"
SOURCE_DIR=$HOME/Ubuntu
source ./progress.sh

function install_sogoinput() {
	progress_start "部署搜狗输入法"
	sudo apt-get install -y -q qtdeclarative5-dev                              > /dev/null 2>&1
	sudo apt-get install -y -q libgsettings-qt1                                > /dev/null 2>&1
	sudo dpkg -i $SOURCE_DIR/software/sogoinput.deb                            > /dev/null 2>&1
	rm -rf $HOME/.bashrc && sync && cp $SOURCE_DIR/setting/.bashrc $HOME/ && source $HOME/.bashrc
	rm -rf $HOME/.config/sogoupinyin/ && sync && cp -r $SOURCE_DIR/setting/sogoupinyin $HOME/.config/ && sync
	progress_done
}

function apt_install() {
	progress_start "部署安卓开发环境"
	sudo sh -c 'echo y | apt-add-repository ppa:git-core/ppa                   > /dev/null 2>&1'
	sudo sh -c 'echo y | apt-add-repository ppa:linuxuprising/libpng12         > /dev/null 2>&1'
	sudo apt-get update                                                        > /dev/null 2>&1
	sudo apt-get install -y -q libx11-dev                                      > /dev/null 2>&1
	sudo apt-get install -y -q libreadline-dev                                 > /dev/null 2>&1
	sudo apt-get install -y -q git                                             > /dev/null 2>&1
	sudo apt-get install -y -q libncurses-dev                                  > /dev/null 2>&1
	sudo apt-get install -y -q tofrodos                                        > /dev/null 2>&1
	sudo apt-get install -y -q xsltproc                                        > /dev/null 2>&1
	sudo apt-get install -y -q dpkg-dev                                        > /dev/null 2>&1
	sudo apt-get install -y -q libsdl1.2-dev                                   > /dev/null 2>&1
	sudo apt-get install -y -q gnupg                                           > /dev/null 2>&1
	sudo apt-get install -y -q gperf                                           > /dev/null 2>&1
	sudo apt-get install -y -q curl                                            > /dev/null 2>&1
	sudo apt-get install -y -q zip                                             > /dev/null 2>&1
	sudo apt-get install -y -q m4                                              > /dev/null 2>&1
	sudo apt-get install -y -q ccache                                          > /dev/null 2>&1
	sudo apt-get install -y -q libssl-dev                                      > /dev/null 2>&1
	sudo apt-get install -y -q git-core                                        > /dev/null 2>&1
	sudo apt-get install -y -q flex                                            > /dev/null 2>&1
	sudo apt-get install -y -q bison                                           > /dev/null 2>&1
	sudo apt-get install -y -q build-essential                                 > /dev/null 2>&1
	sudo apt-get install -y -q zlib1g-dev                                      > /dev/null 2>&1
	sudo apt-get install -y -q gcc-multilib                                    > /dev/null 2>&1
	sudo apt-get install -y -q g++-multilib                                    > /dev/null 2>&1
	sudo apt-get install -y -q libc6-dev-i386                                  > /dev/null 2>&1
	sudo apt-get install -y -q libncurses5                                     > /dev/null 2>&1
	sudo apt-get install -y -q lib32ncurses5-dev                               > /dev/null 2>&1
	sudo apt-get install -y -q x11proto-core-dev                               > /dev/null 2>&1
	sudo apt-get install -y -q lib32z1-dev                                     > /dev/null 2>&1
	sudo apt-get install -y -q libgl1-mesa-dev                                 > /dev/null 2>&1
	sudo apt-get install -y -q libxml2-utils                                   > /dev/null 2>&1
	sudo apt-get install -y -q unzip                                           > /dev/null 2>&1
	sudo apt-get install -y -q fontconfig                                      > /dev/null 2>&1
	sudo apt-get install -y -q scrcpy                                          > /dev/null 2>&1
	sudo apt-get install -y -q vim                                             > /dev/null 2>&1
	sudo apt-get install -y -q mlocate                                         > /dev/null 2>&1
	sudo apt-get install -y -q gcc                                             > /dev/null 2>&1
	sudo apt-get install -y -q g++                                             > /dev/null 2>&1
	sudo apt-get install -y -q openssh-server                                  > /dev/null 2>&1
	sudo apt-get install -y -q net-tools                                       > /dev/null 2>&1
	sudo apt-get install -y -q minicom                                         > /dev/null 2>&1
	sudo apt-get install -y -q ssl1.1                                          > /dev/null 2>&1
	sudo apt-get install -y -q openjdk-8-jdk                                   > /dev/null 2>&1
	sudo apt-get install -y -q aptitude                                        > /dev/null 2>&1
	sudo apt-get install -y -q clang                                           > /dev/null 2>&1
	sudo apt-get install -y -q fastboot                                        > /dev/null 2>&1
	sudo apt-get install -y -q fcitx                                           > /dev/null 2>&1
	sudo apt-get install -y -q fcitx-frontend-gtk2                             > /dev/null 2>&1
	sudo apt-get install -y -q fcitx-frontend-gtk3                             > /dev/null 2>&1
	sudo apt-get install -y -q fcitx-frontend-qt5                              > /dev/null 2>&1
	sudo apt-get install -y -q fcitx-module-x11                                > /dev/null 2>&1
	sudo apt-get install -y -q libpng12-0                                      > /dev/null 2>&1
	sudo apt-get --fix-broken install                                          > /dev/null 2>&1
	progress_done
}


function install_other_software() {
	progress_start "部署其他软件"
	sudo dpkg -i $SOURCE_DIR/software/edge.deb                             > /dev/null 2>&1
	sudo dpkg -i $SOURCE_DIR/software/wps.deb                              > /dev/null 2>&1
	sudo dpkg -i $SOURCE_DIR/software/feishu.deb                           > /dev/null 2>&1
	sudo dpkg -i $SOURCE_DIR/software/typora.deb                           > /dev/null 2>&1
	sudo dpkg -i $SOURCE_DIR/software/Termius.deb                          > /dev/null 2>&1
	progress_done
}

case $cmd in
	"apt_install")
		apt_install
		;;
	"sogoinput")
		install_sogoinput
		;;
	"software")
		install_other_software
		;;
	"deb")
		install_sogoinput
		install_other_software
		;;
	"legitimate")
		apt_install
		install_sogoinput
		;;
	*)
		apt_install
		install_sogoinput
		install_other_software
		;;
esac


sudo apt-get --fix-broken -y install > /dev/null 2>&1 && sync
progress_done_one "修复依赖"
