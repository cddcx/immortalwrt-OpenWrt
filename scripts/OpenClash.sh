#!/bin/bash

echo "Start Clash Core Download !"
echo "Current Path: $PWD"

mkdir -p files/etc/openclash/core
#cd files/etc/openclash/core
cd files/etc/openclash/core || (echo "Clash core path does not exist! " && exit)

# 下载OpenClash的meta核心
#wget https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz
#tar -zxvf clash-linux-amd64.tar.gz
#mv clash clash_meta
#rm -rf clash-linux-amd64.tar.gz

# 下载OpenClash的dev核心
wget https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-amd64.tar.gz
tar -zxvf clash-linux-amd64.tar.gz
rm -rf clash-linux-amd64.tar.gz
