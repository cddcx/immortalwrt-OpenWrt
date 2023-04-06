#!/bin/bash

echo "Start Clash Core Download !"
echo "Current Path: $PWD"

# 恢复OpenClash备份
mkdir -p files/etc/openclash
cp -rf scripts/Backup-OpenClash*.tar.gz files/etc/openclash
#chmod +x files/etc/openclas
cd files/etc/openclash
tar -zxvf Backup-OpenClash*.tar.gz
rm -rf Backup-OpenClash*.tar.gz
# 下载OpenClash核心
mkdir -p core
cd core || (echo "Clash core path does not exist! " && exit)
wget https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz
tar -zxvf clash-linux-amd64.tar.gz
mv clash clash_meta
rm -rf clash-linux-amd64.tar.gz
