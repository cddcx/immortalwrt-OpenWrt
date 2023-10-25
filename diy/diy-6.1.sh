#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# 修改内核
sed -i 's/PATCHVER:=*/PATCHVER:=6.1/g' target/linux/x86/Makefile

# 修改include/target.mk
#sed -i "s/autocore/autocore-x86/" include/target.mk

# 修改target/linux/x86/Makefile
sed -i 's/automount/autocore default-settings-chn ipset luci luci-compat luci-app-udpxy luci-app-upnp luci-app-openclash luci-app-ssr-plus/g' target/linux/x86/Makefile

#酷友社开发的Openwrt插件：DDNSTO远程穿透、易有云存储端、iStore、QuickStart便捷首页
#svn co https://github.com/xiangfeidexiaohuo/openwrt-packages/trunk/linkease package/linkease
#rm -rf package/linkease/preview
#sed -i 's/("iStore"), 31/("应用商店"), 61/g' package/linkease/iStore/luci-app-store/luasrc/controller/store.lua

# ikoolproxy去广告插件
#git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
#rm -rf package/luci-app-ikoolproxy/README*

## luci-app-xray
#git clone https://github.com/yichya/luci-app-xray.git package/luci-app-xray
#git clone https://github.com/yichya/openwrt-xray.git package/openwrt-xray
#git clone https://github.com/xiechangan123/luci-i18n-xray-zh-cn.git package/luci-i18n-xray-zh-cn
#sed -i 's/luci-app-xray-fw4/luci-app-xray/g' package/luci-i18n-xray-zh-cn/Makefile

# 软件中心istore
#svn co https://github.com/linkease/istore/trunk/luci package/istore
#svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
#rm -rf package/istore/.svn
#sed -i 's/("iStore"), 31/("应用商店"), 61/g' package/istore/luci-app-store/luasrc/controller/store.lua

# luci-app-passwall2
#svn co https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2

# luci-theme-opentopd主题
#git clone https://github.com/sirpdboy/luci-theme-opentopd package/luci-theme-opentopd
#rm -rf package/luci-theme-opentopd/README* package/luci-theme-opentopd/doc/

# luci-theme-argon改版主题
#git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#rm -rf package/luci-theme-argon/README*
#rm -rf package/luci-theme-argon/Screenshots/
#sed -i 's/luci-theme-argon-18.06/luci-theme-argon/g' package/luci-theme-argon/Makefile

# ikoolproxy去广告插件
#git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
