#!/bin/bash
CODE_USERNAME=haoranliu

cd $HOME/MyCode/241/TBox
git clone ssh://$CODE_USERNAME@10.10.113.241:29418/projects/TboxApp  -b tbox_6125_dev
git clone ssh://$CODE_USERNAME@10.10.113.241:29418/projects/TboxBuildEnv -b main
tar -zxf opt_ssl1.1.tar.gz -C $HOME
rm -rf opt_ssl1.1.tar.gz

cd $HOME/MyCode/241/6125AOSP
repo init -u ssh://$CODE_USERNAME@10.10.113.241:29418/projects/DLS-Quectel-6125/platform/manifest -b pateo_ag600k_dev_p57
repo sync
