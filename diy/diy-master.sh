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
#sed -i 's/PATCHVER:=5.10/PATCHVER:=5.15/g' target/linux/x86/Makefile

#酷友社开发的Openwrt插件：DDNSTO远程穿透、易有云存储端、iStore、QuickStart便捷首页
#svn co https://github.com/xiangfeidexiaohuo/openwrt-packages/trunk/linkease package/linkease
#rm -rf package/linkease/preview
#sed -i 's/("iStore"), 31/("应用商店"), 61/g' package/linkease/iStore/luci-app-store/luasrc/controller/store.lua

# 软件中心istore
svn co https://github.com/linkease/istore/trunk/luci package/istore
svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
rm -rf package/istore/.svn
sed -i 's/("iStore"), 31/("应用商店"), 61/g' package/istore/luci-app-store/luasrc/controller/store.lua

# luci-theme-opentopd主题
#git clone https://github.com/sirpdboy/luci-theme-opentopd package/luci-theme-opentopd
#rm -rf package/luci-theme-opentopd/README* package/luci-theme-opentopd/doc/

sed -i 's/ip6tables/ip6tables ipv6helper/g' include/target.mk

sed -i 's/automount/autocore-x86 default-settings-chn luci luci-app-openclash luci-app-store luci-app-udpxy luci-app-upnp/g' target/linux/x86/Makefile
# luci-theme-argon改版主题
#git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
#rm -rf package/luci-theme-argon/README*
#rm -rf package/luci-theme-argon/Screenshots/
#sed -i 's/luci-theme-argon-18.06/luci-theme-argon/g' package/luci-theme-argon/Makefile

# ikoolproxy去广告插件
#git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
