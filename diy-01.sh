!/bin/bash
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

# 软件中心istore
svn co https://github.com/linkease/istore/trunk/luci/luci-app-store package/luci-app-store
rm -rf package/luci-app-store/.svn
sed -i 's/("iStore"), 31/("应用商店"), 61/g' package/luci-app-store/luasrc/controller/store.lua

# luci-theme-argon改版主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
sed -i 's/luci-theme-argon-18.06/luci-theme-argon/g' package/luci-theme-argon/Makefile

# ikoolproxy去广告插件
git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
