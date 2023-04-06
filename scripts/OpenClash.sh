#!/bin/bash

echo "Start Clash Core Download !"
echo "Current Path: $PWD"

mkdir -p files/etc/openclas
cp -rf scripts/Backup-OpenClash*.tar.gz files/etc/openclas
cd files/etc/openclash || (echo "Clash core path does not exist! " && exit)
mv Backup-OpenClash*.tar.gz Backup-OpenClash.tar.gz
tar -zxvf Backup-OpenClash.tar.gz
rm -rf Backup-OpenClash.tar.gz

mkdir -p files/etc/openclash/core
cd files/etc/openclash/core || (echo "Clash core path does not exist! " && exit)
wget https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-amd64.tar.gz
tar -zxvf clash-linux-amd64.tar.gz
mv clash clash_meta
rm -rf clash-linux-amd64.tar.gz
