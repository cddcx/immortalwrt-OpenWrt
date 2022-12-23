#!/bin/bash

#修改密码
sed -i 's/root::0:0:99999:7:::/root:$1$xUooaZpA$6zs50xt4ac9sJXiYpycT3\/:19338:0:99999:7:::/g' package/base-files/files/etc/shadow

#酷友社开发的Openwrt插件：DDNSTO远程穿透、易有云存储端、iStore、QuickStart便捷首页
svn co https://github.com/linkease/nas-packages package/nas
svn co https://github.com/linkease/nas-packages-luci package/nas_luci
git clone https://github.com/linkease/istore.git package/istore
git clone https://github.com/linkease/istore-ui.git package/istore-ui

## 修改include/target.mk
sed -i 's/luci-app-filetransfer/luci-app-openclash luci-app-istorex/g' include/target.mk
sed -i 's/luci-app-turboacc/luci-app-udpxy luci-app-upnp/g' include/target.mk

## 修改target/linux/x86/Makefile
sed -i 's/automount/ipv6helper/g' target/linux/x86/Makefile

# luci-app-openclash
#svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
#rm -rf package/luci-app-openclash/.svn
