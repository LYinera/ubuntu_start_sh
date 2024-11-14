#!/bin/bash
CODE_USERNAME=haoranliu
SOURCE_DIR=$HOME/Ubuntu

cd $HOME
git config --global user.email "$CODE_USERNAME@pateo.com.cn"
git config --global user.name "$CODE_USERNAME"
ssh-keygen -t rsa -C $CODE_USERNAME@pateo.com.cn

cp $SOURCE_DIR/repo /usr/local/bin
sudo sed -i "s/USER/$CODE_USERNAME/g" /usr/local/bin/repo

make -p $HOME/MyCode/241/TBox
make -p $HOME/MyCode/241/6125AOSP

cat $HOME/.ssh/id_rsa.pub
echo "将SSH KEY 复制到Gerrit"
echo "Gerrit: http://10.10.113.241:8080/login/"
echo "Gerrit: http://10.10.113.240:8080/login/"