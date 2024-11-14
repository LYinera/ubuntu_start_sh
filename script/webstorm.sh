VERSION="$1"
source ./progress.sh

progress_start "部署WebStorm-$VERSION"
function download_webstorm() {
	mkdir -p $HOME/IDE && sync
	set_progress_str "下载WebStorm"
	if [ ! -f $HOME/IDE/WebStorm-$VERSION.tar.gz ]; then
		wget https://download-cdn.jetbrains.com.cn/webstorm/WebStorm-$VERSION.tar.gz -P $HOME/IDE >/dev/null
	fi
	progress_done_one
	set_progress_str "解压WebStorm"
	tar -zxf $HOME/IDE/WebStorm-$VERSION.tar.gz -C $HOME/IDE
	progress_done_one
	set_progress_str "部署WebStorm-$VERSION"
	mv $HOME/IDE/WebStorm-$VERSION.tar.gz ~/Desktop
}


download_webstorm 
sync
mv $HOME/IDE/Web* $HOME/IDE/WebStorm
sudo chmod 777 -R $HOME/IDE
bash ./desktop_generator.sh $HOME/IDE/WebStorm.desktop $HOME/IDE/WebStorm/bin/webstorm.sh $HOME/IDE/WebStorm/bin/webstorm.png WebStorm
chmod 755 $HOME/IDE/WebStorm.desktop
mv $HOME/IDE/WebStorm.desktop /usr/share/applications
mv ~/Desktop/WebStorm-$VERSION.tar.gz $HOME/IDE/
progress_done

