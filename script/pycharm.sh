VERSION="$1"
source ./progress.sh

progress_start "部署PyCharm-$VERSION"
function download_pycharm() {
	mkdir -p $HOME/IDE && sync
	set_progress_str "下载PyCharm"
	if [ ! -f $HOME/IDE/pycharm-professional-$VERSION.tar.gz ]; then
		wget https://download-cdn.jetbrains.com.cn/python/pycharm-professional-$VERSION.tar.gz -P $HOME/IDE > /dev/null 2>&1
	fi
	progress_done_one
	set_progress_str "解压PyCharm"
	tar -zxf $HOME/IDE/pycharm-professional-$VERSION.tar.gz -C $HOME/IDE
	progress_done_one
	set_progress_str "部署PyCharm-$VERSION"
}


download_pycharm 
sync
mv $HOME/IDE/pycharm-$VERSION $HOME/IDE/PyCharm
bash ./desktop_generator.sh $HOME/IDE/PyCharm.desktop $HOME/IDE/PyCharm/bin/pycharm.sh $HOME/IDE/PyCharm/bin/pycharm.png PyCharm
chmod 755 $HOME/IDE/PyCharm.desktop
mv $HOME/IDE/PyCharm.desktop /usr/share/applications

progress_done

