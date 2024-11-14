#!/bin/bash
SOURCE_DIR=$HOME/Ubuntu
source ./progress.sh

function jetbra() {
	progress_start "创建JetBrains激活器"
	mkdir -p $HOME/IDE/
	if [ ! -f $HOME/IDE/jetbra/scripts/install.sh ]; then
		cp -r $SOURCE_DIR/software/jetbra $HOME/IDE && sh $HOME/IDE/jetbra/scripts/install.sh && sync
	fi
	progress_done
}

if [ ! -d $HOME/shell ]; then
	( cp -r $SOURCE_DIR/shell $HOME && chmod 777 -R $HOME/shell/* ) & > /dev/null 2>&1
fi

jetbra
if [ ! -d $HOME/IDE/CLion ]; then
	bash $SOURCE_DIR/script/clion.sh 2024.2.3
fi
if [ ! -d $HOME/IDE/PyCharm ]; then
	bash $SOURCE_DIR/script/pycharm.sh 2024.2.4
fi
if [ ! -d $HOME/IDE/WebStorm ]; then
	bash $SOURCE_DIR/script/webstorm.sh 2024.2.4
fi




