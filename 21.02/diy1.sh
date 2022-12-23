#!/bin/bash

#修改密码
sed -i 's/root::0:0:99999:7:::/root:$1$xUooaZpA$6zs50xt4ac9sJXiYpycT3\/:19338:0:99999:7:::/g' package/base-files/files/etc/shadow

## 酷友社开发的Openwrt插件：DDNSTO远程穿透、易有云存储端、iStore、QuickStart便捷首页
svn co https://github.com/linkease/nas-packages package/nas
svn co https://github.com/linkease/nas-packages-luci package/nas_luci
git clone https://github.com/linkease/istore.git package/istore
git clone https://github.com/linkease/istore-ui.git package/istore-ui

## 修改include/target.mk
sed -i 's/kmod-ipt-raw/kmod-ipt-raw kmod-igc/g' target/linux/x86/Makefile
sed -i 's/iptables/iptables ip6tables odhcp6c odhcpd-ipv6only/g' target/linux/x86/Makefile
sed -i 's/luci-app-filetransfer/luci-app-openclash luci-app-istorex/g' include/target.mk
sed -i 's/luci-app-turboacc/luci-app-udpxy luci-app-upnp/g' include/target.mk

## 修改target/linux/x86/Makefile
sed -i 's/mkf2fs/mkf2fs alsa-utils fdisk kmod-usb-hid kmod-e1000e kmod-i40e kmod-igb kmod-igbvf kmod-igc kmod-ixgbe kmod-pcnet32 kmod-tulip kmod-vmxnet3 kmod-r8101 kmod-r8125 kmod-r8168 kmod-8139cp kmod-8139too kmod-tg3 kmod-fs-f2fs kmod-ac97 kmod-sound-hda-core kmod-sound-hda-codec-realtek kmod-sound-hda-codec-via kmod-sound-via82xx kmod-sound-hda-intel kmod-sound-hda-codec-hdmikmod-sound-i8x0 kmod-usb-audio kmod-usb-net kmod-usb-net-asix kmod-usb-net-asix-ax88179 kmod-usb-net-rtl8150 kmod-usb-net-rtl8152-vendor autocore-x86 automount/g' target/linux/x86/Makefile
sed -i 's/iptables/iptables ip6tables odhcp6c odhcpd-ipv6only/g' target/linux/x86/Makefile

## luci-app-openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
rm -rf package/luci-app-openclash/.svn
