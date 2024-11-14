VERSION="$1"
source ./progress.sh

progress_start "部署CLion-$VERSION"
function download_clion() {
	mkdir -p $HOME/IDE && sync
	set_progress_str "下载CLion"
	if [ ! -f $HOME/IDE/CLion-$VERSION.tar.gz ]; then
		wget https://download-cdn.jetbrains.com.cn/cpp/CLion-$VERSION.tar.gz -P $HOME/IDE >/dev/null 2>&1
	fi
	progress_done_one
	set_progress_str "解压CLion"
	if [ ! -d "$HOME/IDE/CLion" ];then
		tar -zxf $HOME/IDE/CLion-$VERSION.tar.gz -C $HOME/IDE
	fi
	progress_done_one
	set_progress_str "部署CLion-$VERSION"
}


download_clion 
sync
mv $HOME/IDE/clion-$VERSION $HOME/IDE/CLion
sudo chmod 777 -R $HOME/IDE
bash ./desktop_generator.sh $HOME/IDE/CLion.desktop $HOME/IDE/CLion/bin/clion.sh $HOME/IDE/CLion/bin/clion.png CLion
chmod 755 $HOME/IDE/CLion.desktop
mv $HOME/IDE/CLion.desktop /usr/share/applications

progress_done

